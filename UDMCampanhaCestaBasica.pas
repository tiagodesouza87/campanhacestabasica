unit UDMCampanhaCestaBasica;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Datasnap.DBClient;

type
  TDMDadosCampanha = class(TDataModule)
    FDConexao: TFDConnection;
    FDPhDriver: TFDPhysPgDriverLink;
    FDQueryBanco: TFDQuery;
    DSCampanhaDoacao: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDadosCampanha: TDMDadosCampanha;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
