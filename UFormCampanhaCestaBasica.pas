unit UFormCampanhaCestaBasica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls,
  UFormManutencao;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BbtSair: TButton;
    BbtConsultar: TButton;
    BbtExcluir: TButton;
    BbtAlterar: TButton;
    BbtIncluir: TButton;
    BbtTodos: TButton;
    BbtFiltrar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
