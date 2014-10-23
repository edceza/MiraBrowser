unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cefvcl, ceflib, ComCtrls, StdCtrls, ToolWin;

type
  TForm2 = class(TForm)
    Chromium1: TChromium;
    ToolBar2: TToolBar;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
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
     function DownloadFile(SourceFile, DestFile: string): Boolean;
    procedure Chromium1DownloadUpdated(Sender: TObject;
      const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
      const callback: ICefDownloadItemCallback);
    procedure Chromium1BeforeDownload(Sender: TObject;
      const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
      const suggestedName: ustring;
      const callback: ICefBeforeDownloadCallback);
  private
    { Private declarations }
  public
    { Public declarations }
    a: boolean;
    s: string;
  end;

var
  Form2: TForm2;

implementation

uses unit1, qtabbutton, URLMon, ShellApi;
{$R *.dfm}

procedure TForm2.Chromium1BeforePopup(Sender: TObject;
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

procedure TForm2.FormCreate(Sender: TObject);
begin
  a := false;
end;

procedure TForm2.Chromium1BeforeBrowse(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const request: ICefRequest; isRedirect: Boolean; out Result: Boolean);
begin
  if a then
  begin
    form1.openUrlInNewTab(s);
    result := true;
    a := false;
  end
  else
  begin
    result := false;
  end;
end;

procedure TForm2.Chromium1LoadingStateChange(Sender: TObject;
  const browser: ICefBrowser; isLoading, canGoBack, canGoForward: Boolean);
begin
  Button4.Enabled := Chromium1.Browser.CanGoBack;
  Button5.Enabled := Chromium1.Browser.CanGoForward;
end;

procedure TForm2.Chromium1TitleChange(Sender: TObject;
  const browser: ICefBrowser; const title: ustring);
begin
   (Parent as TTabSheet).Caption := title;
end;
function TForm2.DownloadFile(SourceFile, DestFile: string): Boolean;
begin
  try
    Result := UrlDownloadToFile(nil, PChar(SourceFile), PChar(DestFile), 0, nil) = 0;
  except
    Result := False;
  end;
end;

procedure TForm2.Chromium1DownloadUpdated(Sender: TObject;
  const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
  const callback: ICefDownloadItemCallback);
begin
//  label1.Caption := inttostr(downloaditem.GetReceivedBytes);
  if downloaditem.TotalBytes = downloaditem.ReceivedBytes then
  begin
    showMessage('wow');
    showmessage(downloaditem.FullPath);
//    showMessage
  end;
end;

procedure TForm2.Chromium1BeforeDownload(Sender: TObject;
  const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
  const suggestedName: ustring;
  const callback: ICefBeforeDownloadCallback);
begin
   callback.Cont('c:\', true);

end;

end.
