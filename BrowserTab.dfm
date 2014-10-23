object BrowserTab: TBrowserTab
  Left = 515
  Top = 189
  Width = 1142
  Height = 656
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
    OnLoadStart = Chromium1LoadStart
    OnLoadingStateChange = Chromium1LoadingStateChange
    OnTitleChange = Chromium1TitleChange
    OnBeforeDownload = Chromium1BeforeDownload
    OnDownloadUpdated = Chromium1DownloadUpdated
    OnBeforePopup = Chromium1BeforePopup
    OnBeforeBrowse = Chromium1BeforeBrowse
    Options.Javascript = STATE_ENABLED
    Options.Java = STATE_ENABLED
    Options.Plugins = STATE_ENABLED
    Options.ImageLoading = STATE_ENABLED
    Options.TabToLinks = STATE_ENABLED
    Options.ApplicationCache = STATE_ENABLED
    Options.AcceleratedCompositing = STATE_ENABLED
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 0
    Width = 1134
    Height = 29
    Caption = 'ToolBar2'
    TabOrder = 1
    object btnBack: TButton
      Left = 0
      Top = 2
      Width = 22
      Height = 22
      Action = MainForm.actGoBack
      TabOrder = 4
    end
    object btnForward: TButton
      Left = 22
      Top = 2
      Width = 22
      Height = 22
      Action = MainForm.actGoForward
      TabOrder = 5
    end
    object btnRefresh: TButton
      Left = 44
      Top = 2
      Width = 22
      Height = 22
      Action = MainForm.actRefresh
      TabOrder = 6
    end
    object addressBar: TEdit
      Left = 66
      Top = 2
      Width = 532
      Height = 22
      TabOrder = 0
      OnKeyPress = addressBarKeyPress
    end
    object btnGo: TButton
      Left = 598
      Top = 2
      Width = 22
      Height = 22
      Action = MainForm.actGo
      TabOrder = 1
    end
    object btnNewTab: TButton
      Left = 620
      Top = 2
      Width = 22
      Height = 22
      Action = MainForm.actNewTab
      TabOrder = 2
    end
    object btncloseTab: TButton
      Left = 642
      Top = 2
      Width = 22
      Height = 22
      Action = MainForm.actCloseTab
      TabOrder = 3
    end
  end
end
