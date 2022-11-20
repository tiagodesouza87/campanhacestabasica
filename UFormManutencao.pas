unit UFormManutencao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.NumberBox, Vcl.WinXPickers, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, DateUtils,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormManutencao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNCampanhas: TDBNavigator;
    BbtRestaurar: TButton;
    BbtSair: TButton;
    BbtConfirmarAcao: TButton;
    EdtNomeCampanha: TEdit;
    Label1: TLabel;
    MemDetalhamento: TMemo;
    DtpDataInicio: TDatePicker;
    NbbDuracao: TNumberBox;
    Label2: TLabel;
    Label3: TLabel;
    LblDuracao: TLabel;
    procedure BbtSairClick(Sender: TObject);
    procedure BbtConfirmarAcaoClick(Sender: TObject);
    procedure DBNCampanhasClick(Sender: TObject; Button: TNavigateBtn);
    procedure BbtRestaurarClick(Sender: TObject);
  private
    { Private declarations }
    DsCampanha : TDataSource;
    Tipo: string;
    Query : String;
    procedure OrganizarForm;
    procedure CarregarComponentes;
    procedure Incluir;
    procedure Alterar;
    procedure Filtrar;
  public
    { Public declarations }
    procedure ShowForm(Tipo :string);
    procedure setDsCampanha(DsCampanha: TDataSource);
    function getQuery: String;
  end;

var
  FormManutencao: TFormManutencao;

implementation

{$R *.dfm}
//==============================================================================
// Método para realização de tratamento antes de mostrar o form
//==============================================================================
procedure TFormManutencao.ShowForm(Tipo: string);
begin
  Self.Tipo := Tipo;
  Self.OrganizarForm;
  Self.ShowModal;
end;

//==============================================================================
// Inicialização do Dataset Compartilhado
//==============================================================================
procedure TFormManutencao.setDsCampanha(DsCampanha: TDataSource);
begin
  Self.DsCampanha := DsCampanha;
  DBNCampanhas.DataSource := Self.DsCampanha;
end;

//==============================================================================
// Organização dos componentes da interface gráfica
//==============================================================================
procedure TFormManutencao.OrganizarForm;
begin
  EdtNomeCampanha.Clear;
  MemDetalhamento.Lines.Clear;
  DtpDataInicio.Date := Date();
  NbbDuracao.Clear;

  EdtNomeCampanha.Enabled := true;
  MemDetalhamento.Enabled := true;
  DtpDataInicio.Enabled   := true;
  NbbDuracao.Enabled      := true;

  LblDuracao.Caption := 'Duração da campanha'+#13+'(em dias)';

  BbtRestaurar.Visible  := false;
  DBNCampanhas.Visible  := false;
  DtpDataInicio.Visible := true;

  if(Self.Tipo = 'Alterar') then
  begin
    BbtRestaurar.Visible := true;
    CarregarComponentes;
  end
  else if(Self.Tipo = 'Consultar') then
  begin
    EdtNomeCampanha.Enabled := false;
    MemDetalhamento.Enabled := false;
    DtpDataInicio.Enabled   := false;
    NbbDuracao.Enabled      := false;

    DBNCampanhas.Visible := true;
    CarregarComponentes;
  end
  else if(Self.Tipo = 'Filtrar') then
  begin
    DtpDataInicio.Visible := false;
  end;
end;

procedure TFormManutencao.CarregarComponentes;
begin
  MemDetalhamento.Lines.Clear;
  EdtNomeCampanha.Text := DsCampanha.DataSet.FieldByName('Nome').AsString;
  MemDetalhamento.Lines.Add(DsCampanha.DataSet.FieldByName('Detalhamento').AsString);
  DtpDataInicio.Date := DsCampanha.DataSet.FieldByName('DataInicio').AsDateTime;
  NbbDuracao.Value :=  DsCampanha.DataSet.FieldByName('DiasCampanha').AsFloat;
end;

//==============================================================================
// Método auxiliar para filtro de consulta
//==============================================================================
function TFormManutencao.getQuery: String;
begin
  Result := Self.Query;
end;

//==============================================================================
// Métodos do CRUD
//==============================================================================
procedure TFormManutencao.Incluir;
begin
  DsCampanha.DataSet.Insert;
  DsCampanha.DataSet.FieldByName('IdCampanha').AsString       := '';
  DsCampanha.DataSet.FieldByName('Nome').AsString             := EdtNomeCampanha.Text;
  DsCampanha.DataSet.FieldByName('Detalhamento').AsString     := MemDetalhamento.Lines.Text;
  DsCampanha.DataSet.FieldByName('DataInicio').AsDateTime     := DtpDataInicio.Date;
  DsCampanha.DataSet.FieldByName('DiasCampanha').AsFloat      := NbbDuracao.Value;
  DsCampanha.DataSet.FieldByName('UsuarioCadastro').AsString  := 'user.local';
  DsCampanha.DataSet.FieldByName('DataCadastro').AsDateTime   := Now;

  DsCampanha.DataSet.Post;
end;

procedure TFormManutencao.Filtrar;
var
  numArgumentos: integer;
begin
  numArgumentos := 0;
  Self.Query := 'SELECT * FROM CampanhaDoacao';
  if(EdtNomeCampanha.Text <> '') then
  Begin
    Self.Query := Self.Query + ' WHERE Nome LIKE '+QuotedStr('%'+EdtNomeCampanha.Text+'%');
    numArgumentos := numArgumentos +1;
  End
  else if(NbbDuracao.Value >0) then
  Begin
    if(numArgumentos >= 1) then
    Begin
      Self.Query := Self.Query + ' AND ';
    End
    else
    Begin
      Self.Query := Self.Query + ' WHERE ';
    End;
    Self.Query := Self.Query + ' DiasCampanha = '+FloatToStr(NbbDuracao.Value);
  End
  else if(MemDetalhamento.Lines.ToString <> '') then
  Begin
    if(numArgumentos >= 1) then
    Begin
      Self.Query := Self.Query + ' AND ';
    End
    else
    Begin
      Self.Query := Self.Query + ' WHERE ';
    End;
    Self.Query := Self.Query + ' Detalhamento LIKE '+QuotedStr('%'+MemDetalhamento.Lines.Text+'%');
  End;
end;

procedure TFormManutencao.Alterar;
begin
  DsCampanha.DataSet.Edit;
  DsCampanha.DataSet.FieldByName('Nome').AsString             := EdtNomeCampanha.Text;
  DsCampanha.DataSet.FieldByName('Detalhamento').AsString     := MemDetalhamento.Lines.Text;
  DsCampanha.DataSet.FieldByName('DataInicio').AsDateTime     := DtpDataInicio.Date;
  DsCampanha.DataSet.FieldByName('DiasCampanha').AsFloat      := NbbDuracao.Value;
  DsCampanha.DataSet.FieldByName('UsuarioCadastro').AsString  := 'user.local';
  DsCampanha.DataSet.FieldByName('DataCadastro').AsDateTime   := Now;

  DsCampanha.DataSet.Post;
end;

//==============================================================================
// Tratamento dos botões
//==============================================================================
procedure TFormManutencao.BbtRestaurarClick(Sender: TObject);
begin
  CarregarComponentes;
end;

procedure TFormManutencao.BbtConfirmarAcaoClick(Sender: TObject);
begin
  if(Self.Tipo = 'Incluir') then
  begin
    if((EdtNomeCampanha.Text = '') or  (DtpDataInicio.Date < Date()) or (NbbDuracao.Value <=0)) then
    begin
      ShowMessage('Não foi possível cadastrar a nova campanha');
      Exit();
    end;
    Incluir;
    ShowMessage('Campanha cadastrada com sucesso!');
    Self.Close;
  end
  else if (Self.Tipo = 'Alterar') then
  Begin
    if((EdtNomeCampanha.Text = '') or  (DtpDataInicio.Date < Date()) or (NbbDuracao.Value <=0)) then
    begin
      ShowMessage('Não foi possível alterar a campanha');
      Exit();
    end;
    Alterar;
    Self.Close;
  End
  else if (Self.Tipo = 'Filtrar') then
  Begin
    Filtrar;
    Self.Close;
  End;
end;

procedure TFormManutencao.BbtSairClick(Sender: TObject);
begin
  self.Close;
end;

//==============================================================================
// Tratamento no navegador de dados
//==============================================================================
procedure TFormManutencao.DBNCampanhasClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  CarregarComponentes;
end;

end.
