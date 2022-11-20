unit UFormCampanhaCestaBasica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls,
  UDMCampanhaCestaBasica,
  UFormManutencao;

type
  TFormCampanha = class(TForm)
    DBGCampanhas: TDBGrid;
    Panel1: TPanel;
    BbtSair: TButton;
    BbtConsultar: TButton;
    BbtExcluir: TButton;
    BbtAlterar: TButton;
    BbtIncluir: TButton;
    BbtTodos: TButton;
    BbtFiltrar: TButton;
    procedure BbtIncluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BbtAlterarClick(Sender: TObject);
    procedure BbtConsultarClick(Sender: TObject);
    procedure BbtFiltrarClick(Sender: TObject);
    procedure BbtTodosClick(Sender: TObject);
    procedure BbtSairClick(Sender: TObject);
    procedure BbtExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure ConsultarTodos;
  public
    { Public declarations }
  end;

var
  FormCampanha: TFormCampanha;

implementation

{$R *.dfm}
//==============================================================================
// Compartilhamento de Dataset para form filho
//==============================================================================
procedure TFormCampanha.FormActivate(Sender: TObject);
begin
  FormManutencao.setDsCampanha(DMDadosCampanha.DSCampanhaDoacao);
end;

//==============================================================================
// Procedure Auxiliar - ConsultarTodos
//==============================================================================
procedure TFormCampanha.ConsultarTodos;
begin
  DMDadosCampanha.FDQueryBanco.SQL.Text := 'SELECT * FROM CampanhaDoacao ORDER BY IdCampanha';
  DMDadosCampanha.FDQueryBanco.Open;
end;

//==============================================================================
// Métodos para chamar funções do CRUD
//==============================================================================
procedure TFormCampanha.BbtIncluirClick(Sender: TObject);
begin
  FormManutencao.ShowForm('Incluir');
end;

procedure TFormCampanha.BbtTodosClick(Sender: TObject);
begin
  ConsultarTodos;
end;

procedure TFormCampanha.BbtConsultarClick(Sender: TObject);
begin
  FormManutencao.ShowForm('Consultar');
end;

procedure TFormCampanha.BbtFiltrarClick(Sender: TObject);
begin
  FormManutencao.ShowForm('Filtrar');
  DMDadosCampanha.FDQueryBanco.SQL.Text := FormManutencao.getQuery;
  DMDadosCampanha.FDQueryBanco.Open;
end;

procedure TFormCampanha.BbtAlterarClick(Sender: TObject);
begin
  FormManutencao.ShowForm('Alterar');
end;

procedure TFormCampanha.BbtExcluirClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Tem certeza que deseja excluir o registro de NSU '+ DMDadosCampanha.DSCampanhaDoacao.DataSet.FieldByName('IdCampanha').AsString),
                            'Confirma Exclusão de Item?',mb_yesno + mb_iconquestion) = id_yes then
  Begin
    DMDadosCampanha.DSCampanhaDoacao.DataSet.Edit;
    DMDadosCampanha.DSCampanhaDoacao.DataSet.Delete;
    ConsultarTodos;
  End;
end;

//==============================================================================
// Fechamento do Form
//==============================================================================
procedure TFormCampanha.BbtSairClick(Sender: TObject);
begin
  Self.Close;
end;

end.
