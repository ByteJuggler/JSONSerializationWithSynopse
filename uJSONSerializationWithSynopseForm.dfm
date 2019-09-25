object JSONSerializationWithSynopseForm: TJSONSerializationWithSynopseForm
  Left = 0
  Top = 0
  Caption = 'JSON Serialization With Synopse'
  ClientHeight = 508
  ClientWidth = 719
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    719
    508)
  PixelsPerInch = 96
  TextHeight = 13
  object SerializeButton: TButton
    Left = 8
    Top = 8
    Width = 225
    Height = 25
    Caption = 'Serialize'
    TabOrder = 0
    OnClick = SerializeButtonClick
  end
  object LogMemo: TMemo
    Left = 8
    Top = 39
    Width = 703
    Height = 461
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'LogMemo')
    TabOrder = 1
  end
end
