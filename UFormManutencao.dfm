object FormManutencao: TFormManutencao
  Left = 0
  Top = 0
  Caption = 'FormManutencao'
  ClientHeight = 193
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 339
    Height = 193
    Align = alClient
    Alignment = taLeftJustify
    TabOrder = 0
    ExplicitLeft = 32
    ExplicitTop = 48
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      Left = 14
      Top = 12
      Width = 51
      Height = 13
      Caption = 'Campanha'
    end
    object Label2: TLabel
      Left = 14
      Top = 42
      Width = 67
      Height = 13
      Caption = 'Detalhamento'
    end
    object Label3: TLabel
      Left = 14
      Top = 129
      Width = 66
      Height = 13
      Caption = 'Data de In'#237'cio'
    end
    object LblDuracao: TLabel
      Left = 14
      Top = 152
      Width = 111
      Height = 35
      Caption = 'Dura'#231#227'o da Campanha (dias)'
    end
    object EdtNomeCampanha: TEdit
      Left = 132
      Top = 7
      Width = 201
      Height = 21
      TabOrder = 0
    end
    object MemDetalhamento: TMemo
      Left = 131
      Top = 34
      Width = 201
      Height = 89
      TabOrder = 1
    end
    object DtpDataInicio: TDatePicker
      Left = 131
      Top = 126
      Width = 95
      Height = 21
      DateFormat = 'dd/MM/yyyy'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 2
    end
    object NbbDuracao: TNumberBox
      Left = 131
      Top = 149
      Width = 47
      Height = 21
      Decimal = 0
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 339
    Top = 0
    Width = 108
    Height = 193
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 398
    ExplicitTop = -8
    ExplicitHeight = 201
    object DBNCampanhas: TDBNavigator
      Left = 4
      Top = 8
      Width = 100
      Height = 21
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Hints.Strings = (
        'First record'
        'Prior record'
        'Next record'
        'Last record')
      TabOrder = 0
      OnClick = DBNCampanhasClick
    end
    object BbtRestaurar: TButton
      Left = 4
      Top = 34
      Width = 100
      Height = 30
      Caption = 'Restaurar'
      TabOrder = 1
      OnClick = BbtRestaurarClick
    end
    object BbtSair: TButton
      Left = 4
      Top = 158
      Width = 100
      Height = 30
      Caption = 'Sair'
      TabOrder = 2
      OnClick = BbtSairClick
    end
    object BbtConfirmarAcao: TButton
      Left = 4
      Top = 127
      Width = 100
      Height = 30
      Caption = 'Ok'
      TabOrder = 3
      OnClick = BbtConfirmarAcaoClick
    end
  end
end
