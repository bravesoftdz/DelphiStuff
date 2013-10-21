object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 310
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 217
    Height = 289
    Lines.Strings = (
      'This'
      #9'Text'
      #9#9'is'
      #9#9#9'TAB '
      'indented'
      'Blue'
      #9'Child1'
      #9'Child2'
      #9'Child3'
      #9#9'Child4'
      #9#9'Child5'
      'Green'
      #9'Beige'
      'Orange')
    TabOrder = 0
    WantTabs = True
  end
  object Button1: TButton
    Left = 231
    Top = 128
    Width = 50
    Height = 25
    Caption = '>>'
    TabOrder = 1
    OnClick = Button1Click
  end
  object TreeView1: TTreeView
    Left = 296
    Top = 8
    Width = 217
    Height = 289
    Indent = 19
    TabOrder = 2
  end
end
