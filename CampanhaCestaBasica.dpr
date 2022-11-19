program CampanhaCestaBasica;

uses
  Vcl.Forms,
  UFormCampanhaCestaBasica in 'UFormCampanhaCestaBasica.pas' {Form1},
  UDMCampanhaCestaBasica in 'UDMCampanhaCestaBasica.pas' {DataModule1: TDataModule},
  UFormManutencao in 'UFormManutencao.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
