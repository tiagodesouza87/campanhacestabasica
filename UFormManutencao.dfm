object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 201
  ClientWidth = 506
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
    Width = 371
    Height = 201
    Align = alClient
    Alignment = taLeftJustify
    TabOrder = 0
    ExplicitLeft = 32
    ExplicitTop = 48
    ExplicitWidth = 185
    ExplicitHeight = 41
  end
  object Panel2: TPanel
    Left = 371
    Top = 0
    Width = 135
    Height = 201
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 377
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 4
      Width = 116
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Hints.Strings = (
        'First record'
        'Prior record'
        'Next record'
        'Last record')
      TabOrder = 0
    end
    object Button1: TButton
      Left = 6
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
    end
  end
end
