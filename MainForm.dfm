object MainForm: TMainForm
  Left = 200
  Top = 170
  Width = 1142
  Height = 656
  Align = alClient
  Caption = 'MiraBrowser'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 874
    Top = 60
    Width = 23
    Height = 22
  end
  object pages: TPageControl
    Left = 0
    Top = 0
    Width = 1134
    Height = 629
    Align = alClient
    TabOrder = 0
    OnDragDrop = pagesDragDrop
    OnDragOver = pagesDragOver
    OnMouseDown = pagesMouseDown
    OnMouseUp = pagesMouseUp
  end
  object actnLst: TActionList
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
  object saveDlg: TSaveDialog
    Left = 589
    Top = 216
  end
end
