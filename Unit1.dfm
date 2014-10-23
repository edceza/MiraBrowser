object Form1: TForm1
  Left = 200
  Top = 170
  Width = 1142
  Height = 656
  Align = alClient
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 874
    Top = 60
    Width = 23
    Height = 22
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1134
    Height = 629
    Align = alClient
    TabOrder = 0
  end
  object ActionList1: TActionList
    Left = 739
    Top = 105
    object actGoBack: TAction
      Caption = 'Back'
      OnExecute = actGoBackExecute
    end
    object actGoForward: TAction
      Caption = 'Forward'
      OnExecute = actGoForwardExecute
    end
    object actNewTab: TAction
      Caption = 'New Tab'
      OnExecute = actNewTabExecute
    end
    object actGo: TAction
      Caption = 'Go'
      OnExecute = actGoExecute
    end
    object actCloseTab: TAction
      Caption = 'Close Tab'
      OnExecute = actCloseTabExecute
    end
    object actRefresh: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshExecute
    end
    object actChangeTab: TAction
      Caption = 'Change Tab'
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 589
    Top = 216
  end
end
