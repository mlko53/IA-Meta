unit U_TPiece2;

{Copyright 2001, Gary Darby, Intellitech Systems Inc., www.DelphiForFun.org

 This program may be used or modified for any non-commercial purpose
 so long as this original notice remains in place.
 All other rights are reserved
 }

 {Version 2.0 - Fairly complete}


interface

uses windows, classes, sysutils, graphics, controls, extctrls, forms, dialogs,
      math;

const
  maxpoints=5; {maximum nbr of points in a single tangram piece}
type
  tline=record
    p1,p2:TPoint;
  end;


  tpiece = class(TObject)       {TPIECE - Tangram piece class}
    public
    points:array [1..maxpoints] of TPoint;   {make dynamic later}
    drawpoints:array[1..maxpoints] of TPoint; {make dynamic}

    center,drawcenter,offset:TPoint;
    nbrpoints:integer;
    piececolor:TColor;
    gridsize:integer;
    angle:integer;  {0..7, angle in 45 degree units}
    dragging:boolean;
    movable:boolean;  {can be moved (figure outlines are unmovable)}
    visible:boolean;
    procedure assign(p:TPiece);
    procedure rotate45;
    procedure moveby(p:TPoint);
    procedure moveto(p:TPoint);
    procedure makedrawpoints;
    procedure draw(canvas:TCanvas);
    procedure flip;
    {PointInPoly helps recognize mouse clicks and solutions }
    function pointinpoly(x,y:integer; includeborders:boolean;
                         var vertexpoint:boolean):boolean;
  end;


 tfigpoint=record   {defines center point of a piece in a figure}
    exists:boolean;
    x,y,r,f:integer; {r - amt to rotate, f = 1=mirror flip}
    pcolor:TColor;
  end;

  Tfigpieces=class(TObject)  {array defining figure piece characteristics}
      fig:array of tfigpoint;
    end;

  tTangram=class(TPaintbox)
  protected
     procedure Paint;   override;
     procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
                         X, Y: Integer); override;
     procedure MouseMove(Shift: TShiftState; X,Y: Integer); override;
  public
     piecesfilename:string;
     figfilename:string;
     piece: array of TPiece; {array of piece shapes, locations, colors, orientations}
     homepiece:array of Tpiece; {initial piece location info}
     figures:array of Tfigpieces;  {a set of figures, one is active at a time}
     solutionpieces:array of TPiece;  {pieces in the solution figure}
     piecesInplace:integer; {count of pieces placed - used to recognize solved state}
     nbrpieces, nbrfigures:integer;
     curfig:integer;  {the figure currently being solved, indexed from 1}
     dragnbr:integer; {which piece is selected}
     gridsize:integer;  {multiplier for grid}
     splitpoint:integer;  {x coordinate divider beween figures and pieces home}
     editmode:boolean;  {maybe useful for if edit is implemented}

     constructor createTangram(aowner:TWinControl; newsize:TRect;
                               neweditMode:boolean);
     destructor destroy;  override;
     function  loadpieces(fname:string):boolean;
     procedure loadfigset(fname:string);
     procedure addpiece(p:TPiece);
     procedure restart;
     procedure showfigure(fignbr:integer);
     function pieceInSolution:boolean;
     procedure showsolution;
     procedure painttobitmap(b:TBitmap);
  end;


  const
  {selectable colors for testing}
  colors:array[0..11] of tcolor=
  (clblue,clred,clyellow,clgreen,clpurple, cllime,
   clfuchsia,claqua,clteal,clNavy,clmaroon,clolive);


implementation

  {******************* LOCAL SUBROUTINES **********************}

  {**************** SameSide ***************}
  function sameside(L:TLine; p1,p2:TPoint; var pointonborder:boolean):int64;
  {used by Intersect function}
  {same side =>result>0
   opposite sides => result <0
   a point on the line => result=0 }
  var
    dx,dy,dx1,dy1,dx2,dy2:int64;
  begin
    dx:=L.p2.x-L.P1.x;
    dy:=L.p2.y-L.P1.y;
    dx1:=p1.x-L.p1.x;
    dy1:=p1.y-L.p1.y;
    dx2:=p2.x-L.p2.x;
    dy2:=p2.y-L.p2.y;
    result:=(dx*dy1-dy*dx1)*(dx*dy2-dy*dx2);
    if ((dx<>0) or (dy<>0)) and (result=0) then pointonborder:=true
    else pointonborder:=false;
  end;

  {***************** SLOPE *****************}
  function slope(L:TLine):extended;
  {return slope of a line}
  begin
    with L do
    begin
      if p1.x<>p2.x then  result:=round(10*((p2.y-p1.y)/(p2.x-p1.x)))
      else result:=1e10;
    end;
  end;

  {******************** INTERSECT *******************}
  function  intersect(L1,L2:TLine; var pointonborder,colinear:boolean):boolean;
  {test for 2 lines intersecting }
  var
    a,b:int64;
    pb:boolean;
  begin
    pointonborder:=false;
    colinear:=false;
    a:=sameside(L1,L2.p1,L2.p2, pb);
    if pb then pointonborder:=true;
    b:=sameside(L2,L1.p1,L1.p2,pb);
    if pb then pointonborder:=true;
    result:=(a<=0) and (b<=0);
    if result then if slope(L1)=slope(L2) then colinear:=true;
  end;

  {**************** OVERLAPPED *******************}
  function overlapped(L1,L2:TLine):boolean;
  {Do these  co-linear lines overlap?}
  var
    L:TLine;
    P:TPoint;
  begin
    result:=false;
    if L1.p1.y<>L1.p2.y then  {not horizontal}
    begin
      with L1 do   {sort by y}
      If p1.y>p2.y then
      begin
        p:=p1;
        p1:=p2;
        p2:=p;
      end;
      with L2 do
      If p1.y>p2.y then
      begin
        p:=p1;
        p1:=p2;
        p2:=p;
      end;
      If L1.P1.Y>L2.P1.Y then  {sort lines by Y}
      begin
        L:=L1;
        L1:=L2;
        L2:=L;
      end;
      {2nd point of L1 must be > 1st point of L2}
      if L1.p2.y>L2.p1.y then result:=true;
    end
    else
    begin {horizontal - use X for comaprisons}
      with L1 do   {sort by x}
      If p1.x>p2.x then
      begin
        p:=p1;
        p1:=p2;
        p2:=p;
      end;
      with L2 do
      If p1.x>p2.x then
      begin
        p:=p1;
        p1:=p2;
        p2:=p;
      end;
      If L1.P1.x>L2.P1.x then  {sort lines by x}
      begin
        L:=L1;
        L1:=L2;
        L2:=L;
      end;
      {for overlap, rightmost point of L1 be be greater then leftmost of L2}
      if L1.p2.x>L2.p1.x then result:=true;
    end;
  end;

{**************** TPiece.assign *************}
procedure TPiece.assign(p:TPiece);
{assign piece p to ourselves}
var
  i:integer;
begin
  nbrpoints:=p.nbrpoints;
  for i:= 1 to nbrpoints do
  begin
    points[i]:=p.points[i];
    drawpoints[i]:=p.drawpoints[i];
  end;
  center:=p.center;
  drawcenter:=p.drawcenter;
  piececolor:=p.piececolor;
  angle:=p.angle;
  gridsize:=p.gridsize;
  dragging:=false;
  movable:=p.movable;
  offset:=p.offset;
  visible:=p.visible;
end;


{*************** TPiece.draw **************}
procedure tpiece.draw(canvas:TCanvas);
begin
  if visible then
  with canvas do
  begin
    if dragging then pen.width:=2
    else pen.width:=1;
    pen.color:=clblack;
    brush.color:=piececolor;
    polygon(slice(drawpoints,nbrpoints));
  end;
end;


{************************ TPiece.PointInPoly ********************}
function TPiece.pointinpoly(x,y:integer; includeborders:boolean; var vertexpoint:boolean):boolean;
{returns true if passed point is inside of piece }

var
  count,i,j:integer;
  lt,lp:TLine;
  onborder, ob, colinear:boolean;

begin
    vertexpoint:=false;
    onborder:=false;
    count:=0; j:=nbrpoints;
    lt.p1:=point(x,y);
    lt.p2:=point(x,y);
    lt.p2.x:=2000;
    for i:= 1 to nbrpoints do
    begin
      if (drawpoints[i].x=x) and (drawpoints[i].y=y)
      then vertexpoint:=true;

      Lp.p1:=drawpoints[i];
      Lp.p2:=drawpoints[i];
      if not intersect(Lp,Lt,ob,colinear) then
      begin
        Lp.p2:=Drawpoints[j];
        j:=i;
        if intersect(Lp,lT,ob,colinear) then
        begin
          if ob then onborder:=true
          else inc(count);
        end;

      end
      else if ob then onborder:=true;

    end;
    result:=count mod 2 =1;
    (*
    if result and onborder and (not includeborders)
    then  result:=false;
    *)
    if onborder then
      if (not includeborders) then  result:=false
      else result:=true;

end;


{**************** TPiece.rotate45 ******************}
procedure TPiece.rotate45;

    procedure rotate(var p:Tpoint; a:real);
     {rotate point "p" by "a" radians about the origin (0,0)}
     var
       t:TPoint;
     Begin
       t:=P;
       p.x:=round(t.x*cos(a)-t.y*sin(a));
       p.y:=round(t.x*sin(a)+t.y*cos(a));
     end;

     procedure translate(var p:TPoint; t:TPoint);
     {move point "p" by x & y amounts specified in "t"}
     Begin
       p.x:=p.x+t.x;
       p.y:=p.y+t.y;
     end;

var
  i:integer;
begin
  angle:=(angle +1) mod 8;
  for i:= 1 to nbrpoints do
  begin
    translate(points[i],point(-center.x,-center.y));
    rotate(points[i],pi/4.0);
    translate(points[i],center);
  end;
  makedrawpoints;
end;


{**************** Tpiece.Moveby ****************}
Procedure TPiece.moveby(P:TPoint);
{move piece by p.x and p.y}
var
  i:integer;
begin
  for i:= 1 to nbrpoints do
  with points[i] do
  begin
    inc(x,p.x);
    inc(y,p.y);
  end;
  inc(center.x,p.x);
  inc(center.y,p.y);
  makedrawpoints;
end;

{**************** Tpiece.Moveto ****************}
Procedure TPiece.moveto(P:TPoint);
{move piece to loc centered at p.x and p.y}
begin
  moveby(point(p.x-center.x, p.y-center.y));
end;

{***************** Tpiece.makedrawpoints *************}
procedure TPiece.makedrawpoints;
{Precalc screen positions to improve redraw speed}
var
  i:integer;
begin
  for i:= 1 to nbrpoints do
  begin
    drawpoints[i].x:=points[i].x*gridsize+offset.x;
    drawpoints[i].y:=points[i].y*gridsize+offset.y;
  end;
  drawcenter.x:=center.x*gridsize+offset.x;
  drawcenter.y:=center.y*gridsize+offset.y;
end;

procedure TPiece.flip;
var
  i:integer;
begin
  for i:= 1 to nbrpoints do
  with points[i] do x:=2*center.x-x;
  makedrawpoints;
end;


 {*************************************************}
 {***************** tTangram methods **************}
 {*************************************************}

{************ TTangram,Paint ****************}
procedure TTangram.Paint;
vaR
  i:integer;
begin
  with canvas do
  begin
    brush.color:=color;
    pen.color:=clblack;
    pen.width:=1;
    rectangle(cliprect{clientrect});
    moveto(splitpoint,0);
    lineto(splitpoint,height);
  end;

  if curfig>0 then
  with canvas do
  begin
    brush.color:=clwhite;
    pen.color:=clwhite;
    pen.width:=1;
    for i:= 0 to high(solutionpieces) do
    with  solutionpieces[i] do
    begin
      polygon(slice(drawpoints,nbrpoints));
    end;
  end;
  {start with high pieces to draw unmovables first}

  for i:= high(piece) downto low(piece) do
    if assigned(piece[i])and (i<>dragnbr)
    then piece[i].draw(canvas);
  {make sure that selected piece shows on top}
  if (dragnbr>=0) then piece[dragnbr].draw(self.canvas);
end;

procedure TTangram.PaintToBitMap(b:TBitmap);
vaR
  i:integer;
begin
  for i:= high(piece) downto low(piece) do
    if assigned(piece[i])and (i<>dragnbr)
    then piece[i].draw(b.canvas);
  if (dragnbr>=0) then piece[dragnbr].draw(b.canvas);
end;

{**************** tTangram.Mousedown ******************}
procedure TTangram.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i:integer;
  p:TPoint;
  vertex:boolean;
begin
  if dragnbr<0 then  {not dragging, is mouse on a piece?}
  Begin
    for i:= low(piece) to high(piece) do
    if assigned(piece[i]) and (piece[i].movable) then
    begin
      if piece[i].pointinpoly(x,y, true,vertex) then
      with piece[i] do
      begin
        p:=clienttoscreen(drawcenter);
        setcursorpos(p.x,p.y);
        dragnbr:=i;
        dragging:=true;
        if drawcenter.x<splitpoint then dec(PiecesInPlace);
        if button = mbright then  rotate45;
        invalidate;
        break;
      end;
    end;
  end
  else
  case button of
    mbleft:
      begin
        if editmode then
        begin
          piece[dragnbr].dragging:=false;
          invalidate;
          dragnbr:=-1;
        end
        else
        begin  {in play mode, dropping locations are restricted}
          If PieceInSolution then
          begin
            piece[dragnbr].dragging:=false;
            inc(PiecesinPlace);
            invalidate;
            dragnbr:=-1;
            if PiecesInplace=high(solutionpieces)+1
            then showmessage ('You did it!');
          end
          else
          If piece[dragnbr].drawcenter.x>splitpoint then
          begin
            piece[dragnbr].assign(homepiece[dragnbr]);
            invalidate;
            dragnbr:=-1;
          end
          else beep;
        end;
      end;
    mbright:
      begin
        piece[dragnbr].rotate45;
        invalidate;
      end;
  end; {case}
end;

{********************* tTangram.MouseMove **************}
procedure TTangram.MouseMove(Shift: TShiftState; X,Y: Integer);
var
  nx,ny:integer;
begin
  If (dragnbr>=0) then
  with piece[dragnbr] do
  If  (abs(x-drawcenter.x)>gridsize) or  (abs(y-drawcenter.y)>gridsize) then
  begin
    nx:=((x-drawcenter.x) div (gridsize));
    ny:=((y-drawcenter.y) div (gridsize));
    moveby(point(nx,ny));
    invalidate;
  end;
end;

{******************** tTangram.CreateTangram *******************}
constructor TTangram.createTangram(aowner:TWinControl; newsize:TRect;
                                     neweditmode:boolean );
begin
  randomize;
  inherited create(aowner);
  parent:=aowner;
  left:= newsize.left;
  top:=newsize.top;
  width:=newsize.right-left;
  height:=newsize.bottom-top;
  editmode:=neweditmode;
  nbrpieces:=0;
  setlength(piece,0);
  setlength(homepiece,0);
  dragnbr:=-1;
  splitpoint:= (2*width) div 3;
  gridsize:= (width-splitpoint) div 18;
  splitpoint:= gridsize* (splitpoint div gridsize); {put it on a grid boundary}
  invalidate;
end;


{******************* tTangram.destroy ************}
destructor TTangram.destroy;
var
  i:integer;
begin
  for i:= low(piece) to high(piece) do piece[i].free;
  for i:= low(homepiece) to high(homepiece) do homepiece[i].free;
  setlength(piece,0);
  setlength(homepiece,0);
  inherited;
end;


{******************* tTangram.LoadPieces **************}
function TTangram.Loadpieces(fname:string):boolean;
{Load a piece definition file}
var
  f:textfile;
  i,j:integer;
  topx,topy,newrotate,newflip:integer;
  newx,newy:integer;
  {version:integer; }
  piececount, pointcount:integer;
  stop:integer;
begin
   if fileexists(fname) then
   begin
     result:=true;
     for i:= low(piece) to high(piece) do piece[i].free;
     for i:= low(homepiece) to high(homepiece) do homepiece[i].free;
     nbrpieces:=0;
     assignfile(f,fname);
     reset(f);
     readln(f {,version});
     readln(f,piececount);
     setlength(piece,piececount);
     for i:= 0 to piececount-1 do
     begin
       readln(f);
       inc(nbrpieces);
       piece[i]:=TPiece.create;
       with piece[i] do
       begin
         gridsize:=self.gridsize;
         readln(f,topx,topy,newrotate,newflip);
         offset.x:=splitpoint+topx*gridsize;
         offset.y:=topy*gridsize;
         readln(f,pointcount);
         nbrpoints:=0;
         for j:= 1 to pointcount do
         begin
           inc(nbrpoints);
           readln(f,newx,newy);
           with points[nbrpoints] do
           begin
            x:=newx;
            y:=newy;
           end;
         end;
         center.x:=0;
         center.y:=0;
         piececolor:=clwhite;
         movable:=true;
         newrotate:=newrotate mod 8;  {piece definitions normally do not include rotate
                             or flip, but they can}
         stop:=(8-newrotate);
         for j:=1 to stop do rotate45;
         if newflip>0 then flip;
         makedrawpoints;
       end;
     end;
     closefile(f);
     invalidate;
     setlength(homepiece,length(piece));
     for i:= low(homepiece) to high(homepiece) do
     begin
       homepiece[i]:=TPiece.create;
       homepiece[i].assign(piece[i]);
     end;
   end
   else result:=false;
 end;

{******************* tTangram.LoadFigSet ***************}
procedure tTangram.loadfigset(fname:string);
{Load a figure definition file}
var
  ff:textfile;
  i,j:integer;
  newx,newy:integer;
  {version:integer; }
  count,newcolor,rotate,flip:integer;
  p:string;
begin

   if fileexists(fname) then
   begin
     assignfile(ff,fname);
     reset(ff);
     readln(ff {,version});
     readln(ff,piecesfilename);
     p:=piecesfilename;
     piecesfilename:=extractfilepath(fname)+p;
     {if pieces file not found in .tan directory, try program's directory}
     if not fileexists(piecesfilename) then  piecesfilename:=extractfilepath(application.exename)+p;
     if fileexists(piecesfilename)
     then
     if loadpieces(piecesfilename) then
     begin
       for i:= low(figures) to high(figures) do
       begin
         setlength(figures[i].fig,0);
         figures[i].free;
       end;
       setlength(figures,0);
       readln(ff,nbrfigures);
       setlength(figures,nbrfigures);
       for i:= 0 to nbrfigures-1 do
       begin
          figures[i]:=TFigpieces.create;
          readln(ff);
         setlength(figures[i].fig,nbrpieces);
         for j:= 0 to nbrpieces-1 do
         with figures[i] do
         begin
           readln(ff,count,newcolor,newx,newy,rotate,flip);
           fig[j].pcolor:=colors[newcolor];
           if count>0 then
           begin
             with fig[j] do
             begin
               exists:=true;
               x:=newx;
               y:=newy;
               r:=rotate;
               f:=flip;
             end;
           end;
         end;
       end;
     end
     else showmessage('Load of pieces file '+piecesfilename+' failed')
     else showmessage('Pieces file '+piecesfilename+' not found');
     closefile(ff);
     invalidate;
   end;
 end;


 {******************** tTangram.AddPiece **************}
 procedure TTangram.addpiece(p:TPiece);
 begin
   setlength(piece,length(piece)+1);
   piece[high(piece)]:=p;
   inc(nbrpieces);
 end;

 {********************** tTangram.restart ******************}
 procedure tTangram.restart;
 {reset pieces to home position}
 var
   i:integer;
 begin
   for i:= low(homepiece) to high(homepiece)
   do piece[i].assign(homepiece[i]);
   PiecesInPlace:=0;
   invalidate;
 end;


{********************* tTangram.Showfigure ********************}
procedure tTangram.showfigure(fignbr:integer);
var
  i,j,n:integer;
  p:TPiece;
  stop:integer;

begin
  n:=high(figures);
  if fignbr=0 then fignbr:=n+1;
  if fignbr>n+1 then curfig:=fignbr mod (high(figures)+1)
  else curfig:=fignbr;
  restart;
  {free old solution pieces}
  for i:=0 to high(solutionpieces) do solutionpieces[i].free;
  setlength(solutionpieces,0);

  n:=0;
  for i:=low(piece) to high(piece) do
  with figures[curfig-1].fig[i] do
  begin
    homepiece[i].piececolor:=pcolor;
    if exists then {only create solution pieces for those actually used
                    in this figure }
    begin
      homepiece[i].visible:=true;
      p:=TPiece.create; {create a new solutionpiece}
      with p do
      begin
        inc(n);
        setlength(solutionpieces,n);
        solutionpieces[n-1]:=P;
        assign(piece[i]);
        moveto(point(x-offset.x div gridsize,y-offset.y div gridsize));
        r:=r mod 8;  {Overmars files assume counterclockwise rotation and may}
        stop:=(8-r);  {be large or negative numbers, this changes value
                      to what we need}

        for j:=1 to stop do p.rotate45;
        if f>0 then p.flip;
        piececolor:=clwhite;
        movable:=false;
        makedrawpoints;
      end;
    end
    else homepiece[i].visible:=false;
  end;
  restart;
  invalidate;
end;

function tTangram.pieceInSolution:boolean;
{to be valid drop location, try this:
  1. corners of piece all fall in solution pieces
  2. no edges intersect piece.
  3. no piece shares more than one side with another piece
 }
var
  i,j,k:integer;
  OK, OK2, vertex:boolean;
  L1,L2:TLine;
  sharedbordercount:array of integer;
  onborder,colinear:boolean;
begin
  OK:=true;
  {1: corners of piece all fall in solution space}
  with piece[dragnbr] do
  for j:= 1 to nbrpoints do
  begin
    OK2:=false;

    for i:= 0 to high(solutionpieces) do
    begin
      if solutionpieces[i].pointinpoly(drawpoints[j].x,drawpoints[j].y, true, vertex)
       or vertex then
      begin
        OK2:=true;
        break;
      end;
    end;
    if not OK2 then OK:=false;
    if not OK then break;
  end;
  {2  no edge intersects another space (touching OK)
   3 if any 2 share more than one border, one is interior to the other}

   {we'll loop around the points of each piece, forming edges to test for
    intersections}
  if OK then
  begin
    setlength(sharedbordercount,length(piece));
    {keep track of shared borders with each piece}
    for i:= 0 to high(sharedbordercount) do sharedbordercount[i]:=0;
    for i:= 0 to high(piece) do
    if (i<>dragnbr) and (piece[i].drawcenter.x<splitpoint) then
    with piece[dragnbr] do
    begin
      L1.p1:=drawpoints[nbrpoints];
      for j:= 1 to nbrpoints do
      begin
        L1.p2:=drawpoints[j];
        with piece[i] do
        begin
          L2.p1:=drawpoints[nbrpoints];
          for k:= 1 to nbrpoints do
          begin
            L2.p2:=drawpoints[k];
            if intersect(L1,L2,onborder,colinear)then
            begin
              if not onborder then
              begin
                OK:=false; {interior point found ==> invalid move}
                break;
              end
              else
              {borders might be colinear and not overlapped, ie just end-to-end
               which is OK, if they overlap on two borders then the polygons overlap
               and the move is invalid}
              if colinear and overlapped(L1,L2) then
              begin
                inc(sharedbordercount[i]);
                if sharedbordercount[i]>1 then
                begin
                  OK:=false;
                  break;
                end;
              end;
            end;
            l2.p1:=drawpoints[k];
          end;
        end;
        if not Ok then break;
        l1.p1:=drawpoints[j];
      end;
    end;
  end;
  result:=OK;
end;


{************** tTangram.showsolution ******************}
procedure tTangram.showsolution;
var
  i,j:integer;
  stop:integer;
begin
  restart;
  with figures[curfig-1] do
  for i := low(fig) to high(fig) do
  with fig[i], piece[i] do
  if exists then
  begin
     moveto(point(x-offset.x div gridsize,y-offset.y div gridsize));
     r:=r mod 8;
     stop:=(8-r);
     for j:=1 to stop do rotate45;
     if f>0 then
     begin
       flip;
       makedrawpoints;
     end;
  end;
  invalidate;
  (*    linit solution viewing
  application.processmessages;
  sleep(2500);  {show for 2 1/2 seconds}
  restart;
  *)
  invalidate;
end;


end.

