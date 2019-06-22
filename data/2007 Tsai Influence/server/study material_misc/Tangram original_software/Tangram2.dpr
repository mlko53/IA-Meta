program Tangram2;
{Copyright 2001, Gary Darby, Intellitech Systems Inc., www.DelphiForFun.org

 This program may be used or modified for any non-commercial purpose
 so long as this original notice remains in place.
 All other rights are reserved
 }

 {Prelim version 0.1 - load, drag, rotate pieces}


uses
  Forms,
  U_tangram2 in 'U_tangram2.pas' {Form1},
  U_TPiece2 in 'U_TPiece2.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
