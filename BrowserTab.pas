unit BrowserTab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cefvcl, ceflib, ComCtrls, StdCtrls, ToolWin, MainForm;

type
  TBrowserTab = class(TForm)
    Chromium1: TChromium;
    ToolBar2: TToolBar;
    btnBack: TButton;
    btnForward: TButton;
    btnRefresh: TButton;
    addressBar: TEdit;
    btnGo: TButton;
    btnNewTab: TButton;
    btncloseTab: TButton;
    procedure Chromium1BeforePopup(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame; const targetUrl,
      targetFrameName: ustring; var popupFeatures: TCefPopupFeatures;
      var windowInfo: TCefWindowInfo; var client: ICefClient;
      var settings: TCefBrowserSettings; var noJavascriptAccess: Boolean;
      out Result: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Chromium1BeforeBrowse(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const request: ICefRequest; isRedirect: Boolean;
      out Result: Boolean);
    procedure Chromium1LoadingStateChange(Sender: TObject;
      const browser: ICefBrowser; isLoading, canGoBack,
      canGoForward: Boolean);
    procedure Chromium1TitleChange(Sender: TObject;
      const browser: ICefBrowser; const title: ustring);
    procedure Chromium1DownloadUpdated(Sender: TObject;
      const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
      const callback: ICefDownloadItemCallback);
    procedure Chromium1BeforeDownload(Sender: TObject;
      const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
      const suggestedName: ustring;
      const callback: ICefBeforeDownloadCallback);
    procedure Chromium1LoadStart(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame);
    procedure addressBarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    a: boolean;
    s: string;
  end;

var
  BT: TBrowserTab;

implementation

uses URLMon;
{$R *.dfm}

procedure TBrowserTab.Chromium1BeforePopup(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; const targetUrl,
  targetFrameName: ustring; var popupFeatures: TCefPopupFeatures;
  var windowInfo: TCefWindowInfo; var client: ICefClient;
  var settings: TCefBrowserSettings; var noJavascriptAccess: Boolean;
  out Result: Boolean);
begin
  s := targeturl;
  a := true;
  chromium1.Load(s);
  result := true;
end;

procedure TBrowserTab.FormCreate(Sender: TObject);
begin
  a := false;
  addressBar.SetFocus;
  btnGo.Caption := '>';
  btnBack.Caption := '<';
  btnForward.Caption := '>';
  btnRefresh.Caption := 'R';
  btnNewTab.Caption := '+';
  btnCloseTab.Caption := '-';
end;

procedure TBrowserTab.Chromium1BeforeBrowse(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const request: ICefRequest; isRedirect: Boolean; out Result: Boolean);
begin
  if a then
  begin
    MF.openUrlInNewTab(s);
    result := true;
    a := false;
  end
  else
  begin
    result := false;
  end;
end;

procedure TBrowserTab.Chromium1LoadingStateChange(Sender: TObject;
  const browser: ICefBrowser; isLoading, canGoBack, canGoForward: Boolean);
begin
  btnBack.Enabled := Chromium1.Browser.CanGoBack;
  btnForward.Enabled := Chromium1.Browser.CanGoForward;
end;

procedure TBrowserTab.Chromium1TitleChange(Sender: TObject;
  const browser: ICefBrowser; const title: ustring);
var
  t: string;
begin
  t := title;
  if Length(title) > 15 then
  begin
    t := Copy(title, 0, 12);
    t := t + '...';
  end;
  (Parent as TTabSheet).Caption := t;
  if title <> '' then
  begin
    MF.Caption := title + ' - ' + 'MiraBrowser';
  end;
end;

procedure TBrowserTab.Chromium1DownloadUpdated(Sender: TObject;
  const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
  const callback: ICefDownloadItemCallback);
begin
  if downloaditem.TotalBytes = downloaditem.ReceivedBytes then
  begin
//
  end;
end;

procedure TBrowserTab.Chromium1BeforeDownload(Sender: TObject;
  const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
  const suggestedName: ustring;
  const callback: ICefBeforeDownloadCallback);
begin
   callback.Cont('c:\', true);

end;

procedure TBrowserTab.Chromium1LoadStart(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame);
begin
  addressBar.Text := browser.MainFrame.GetUrl;
end;

procedure TBrowserTab.addressBarKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    MF.actGo.Execute;
    exit;  
  end;  
end;

end.
