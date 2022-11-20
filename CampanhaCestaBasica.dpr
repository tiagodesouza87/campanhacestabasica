program CampanhaCestaBasica;

uses
  Vcl.Forms,
  UFormCampanhaCestaBasica in 'UFormCampanhaCestaBasica.pas' {FormCampanha},
  UFormManutencao in 'UFormManutencao.pas' {FormManutencao},
  UDMCampanhaCestaBasica in 'UDMCampanhaCestaBasica.pas' {DMDadosCampanha: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCampanha, FormCampanha);
  Application.CreateForm(TDMDadosCampanha, DMDadosCampanha);
  Application.CreateForm(TFormManutencao, FormManutencao);
  Application.Run;
end.
