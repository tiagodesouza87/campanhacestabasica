object FormCampanha: TFormCampanha
  Left = 0
  Top = 0
  Caption = 'Campanhas de Doa'#231#227'o'
  ClientHeight = 502
  ClientWidth = 567
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGCampanhas: TDBGrid
    Left = 0
    Top = 0
    Width = 454
    Height = 502
    Align = alClient
    DataSource = DMDadosCampanha.DSCampanhaDoacao
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idcampanha'
        Title.Caption = 'NSU'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Campanha'
        Width = 211
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datainicio'
        Title.Caption = 'Data de In'#237'cio'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'diascampanha'
        Title.Caption = 'Dura'#231#227'o (dias)'
        Width = 83
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 454
    Top = 0
    Width = 113
    Height = 502
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 444
    object BbtSair: TButton
      Left = 8
      Top = 461
      Width = 99
      Height = 33
      Caption = 'Sair'
      TabOrder = 0
      OnClick = BbtSairClick
    end
    object BbtConsultar: TButton
      Left = 8
      Top = 186
      Width = 99
      Height = 33
      Caption = 'Consultar'
      TabOrder = 1
      OnClick = BbtConsultarClick
    end
    object BbtExcluir: TButton
      Left = 8
      Top = 151
      Width = 99
      Height = 33
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = BbtExcluirClick
    end
    object BbtAlterar: TButton
      Left = 8
      Top = 116
      Width = 99
      Height = 33
      Caption = 'Alterar'
      TabOrder = 3
      OnClick = BbtAlterarClick
    end
    object BbtIncluir: TButton
      Left = 8
      Top = 81
      Width = 99
      Height = 33
      Caption = 'Incluir'
      TabOrder = 4
      OnClick = BbtIncluirClick
    end
    object BbtTodos: TButton
      Left = 8
      Top = 46
      Width = 99
      Height = 33
      Caption = 'Todos'
      TabOrder = 5
      OnClick = BbtTodosClick
    end
    object BbtFiltrar: TButton
      Left = 8
      Top = 11
      Width = 99
      Height = 33
      Caption = 'Filtrar'
      TabOrder = 6
      OnClick = BbtFiltrarClick
    end
  end
end
