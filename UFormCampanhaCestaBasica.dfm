object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 502
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 456
    Height = 502
    Align = alClient
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 456
    Top = 0
    Width = 113
    Height = 502
    Align = alRight
    TabOrder = 1
    ExplicitHeight = 505
    object BbtSair: TButton
      Left = 8
      Top = 461
      Width = 99
      Height = 33
      Caption = 'Sair'
      TabOrder = 0
    end
    object BbtConsultar: TButton
      Left = 8
      Top = 186
      Width = 99
      Height = 33
      Caption = 'Consultar'
      TabOrder = 1
    end
    object BbtExcluir: TButton
      Left = 8
      Top = 151
      Width = 99
      Height = 33
      Caption = 'Excluir'
      TabOrder = 2
    end
    object BbtAlterar: TButton
      Left = 8
      Top = 116
      Width = 99
      Height = 33
      Caption = 'Alterar'
      TabOrder = 3
    end
    object BbtIncluir: TButton
      Left = 8
      Top = 81
      Width = 99
      Height = 33
      Caption = 'Incluir'
      TabOrder = 4
    end
    object BbtTodos: TButton
      Left = 8
      Top = 46
      Width = 99
      Height = 33
      Caption = 'Todos'
      TabOrder = 5
    end
    object BbtFiltrar: TButton
      Left = 8
      Top = 11
      Width = 99
      Height = 33
      Caption = 'BbtFiltrar'
      TabOrder = 6
    end
  end
end
