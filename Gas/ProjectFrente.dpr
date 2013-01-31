program ProjectFrente;

uses
  Vcl.Forms,
  uFrente in 'uFrente.pas' {Form1},
  uFuncoes in 'uFuncoes.pas',
  uDMpos in 'uDMpos.pas' {DMpos: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDMpos, DMpos);
  Application.Run;
end.
