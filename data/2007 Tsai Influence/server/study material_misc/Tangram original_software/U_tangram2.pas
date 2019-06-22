unit U_tangram2;
 {Copyright 2001, Gary Darby, Intellitech Systems Inc., www.DelphiForFun.org

 This program may be used or modified for any non-commercial purpose
 so long as this original notice remains in place.
 All other rights are reserved
 }

{Version 3.0 - Pretty much complete}

{Concept and file structures adapted from Tangram freeware program written by
Dr Mark Overmars and available for download from http://www.cs.ruu.nl/~markov/kids/

Dr. Overmars' program is more complete that this version and is recommended
for playing Tangram.  This Delphi version is intended as a vehicle to study
the grapic and geometric processes. }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, extctrls, U_TPiece2, Menus;

type
  TForm1 = class(TForm)
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    LoadPiecebtn: TButton;
    RestartBtn: TButton;
    StaticText1: TStaticText;
    NextBtn: TButton;
    SolveBtn: TButton;
    PrevBtn: TButton;
    ExitBtn: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RestartBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure LoadPiecebtnClick(Sender: TObject);
    procedure SolveBtnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PrevBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Tangram:TTangram;
    figfile:string;
    procedure setcaption;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}


{******************* Form Methods *******************}


{***************** FormActivate *************}
procedure TForm1.FormActivate(Sender: TObject);
begin
  Tangram:=TTangram.createTangram(self,rect(0,0,panel1.left,
                                  clientheight-statictext1.height),false);
  doublebuffered:=true; {eliminate flicker}
  Open1click(self);  {get a figures file}

end;

{**************** FormClose **************}
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 tangram.free;
end;

{**************** RestartBtnClck **********}
procedure TForm1.RestartBtnClick(Sender: TObject);
begin
  tangram.restart;
end;

procedure TForm1.NextBtnClick(Sender: TObject);
begin
  with tangram do showfigure(curfig+1);
  setcaption;
end;

procedure TForm1.PrevBtnClick(Sender: TObject);
begin
  with tangram do showfigure(curfig-1);
  setcaption;
end;

procedure TForm1.Open1Click(Sender: TObject);
begin
    opendialog1.initialdir:=extractfilename(application.exename);
    if opendialog1.execute then
    with tangram do
    begin
      loadfigset(opendialog1.filename);
      figfile:=opendialog1.filename;
      showfigure(1);
      setcaption;
    end;
end;

procedure TForm1.LoadPiecebtnClick(Sender: TObject);
begin
  Open1click(sender);
end;

procedure TForm1.SolveBtnClick(Sender: TObject);
begin
   tangram.showsolution;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   with tangram do
   if (dragnbr>0) and ((key=ord('F')) or (key=ord('f')))
   then
   begin
     piece[dragnbr].flip;
     invalidate;
   end;
end;

procedure TFOrm1.setcaption;
begin
  caption:='TANGRAM - '+UPPercase(extractfilename(figfile))+',  Figure '+inttostr(tangram.curfig)
           + ' of '+ inttostr(tangram.nbrfigures);     
end;

procedure TForm1.ExitBtnClick(Sender: TObject);
begin
  close;
end;

end.

