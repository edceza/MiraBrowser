object Form2: TForm2
  Left = 515
  Top = 189
  Width = 1142
  Height = 656
  Caption = 'Form2'
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
  object Chromium1: TChromium
    Left = 0
    Top = 29
    Width = 1134
    Height = 600
    Align = alClient
    DefaultUrl = 'about:blank'
    TabOrder = 0
    OnLoadingStateChange = Chromium1LoadingStateChange
    OnTitleChange = Chromium1TitleChange
    OnBeforeDownload = Chromium1BeforeDownload
    OnDownloadUpdated = Chromium1DownloadUpdated
    OnBeforePopup = Chromium1BeforePopup
    OnBeforeBrowse = Chromium1BeforeBrowse
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 0
    Width = 1134
    Height = 29
    Caption = 'ToolBar2'
    TabOrder = 1
    object Button4: TButton
      Left = 0
      Top = 2
      Width = 22
      Height = 22
      Action = Form1.actGoBack
      TabOrder = 4
    end
    object Button5: TButton
      Left = 22
      Top = 2
      Width = 22
      Height = 22
      Action = Form1.actGoForward
      TabOrder = 5
    end
    object Button6: TButton
      Left = 44
      Top = 2
      Width = 22
      Height = 22
      Action = Form1.actRefresh
      TabOrder = 6
    end
    object Edit1: TEdit
      Left = 66
      Top = 2
      Width = 532
      Height = 22
      TabOrder = 0
      Text = 'Edit1'
    end
    object Button1: TButton
      Left = 598
      Top = 2
      Width = 22
      Height = 22
      Action = Form1.actGo
      TabOrder = 1
    end
    object Button2: TButton
      Left = 620
      Top = 2
      Width = 22
      Height = 22
      Action = Form1.actNewTab
      TabOrder = 2
    end
    object Button3: TButton
      Left = 642
      Top = 2
      Width = 22
      Height = 22
      Action = Form1.actCloseTab
      TabOrder = 3
    end
  end
end
