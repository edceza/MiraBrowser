unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cefvcl, ActnList, Buttons;

type
  TMainForm = class(TForm)
    pages: TPageControl;
    actnLst: TActionList;
    actGoBack: TAction;
    actGoForward: TAction;
    actNewTab: TAction;
    actGo: TAction;
    actCloseTab: TAction;
    actRefresh: TAction;
    SpeedButton1: TSpeedButton;
    actChangeTab: TAction;
    saveDlg: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure openUrlInNewTab(url: string);
    procedure openUrl(url: string);
    procedure OpenNewTab;
    function getActiveBrowser(): TChromium;
    function getActiveForm(): TForm;
    procedure actGoBackExecute(Sender: TObject);
    procedure actGoForwardExecute(Sender: TObject);
    procedure actNewTabExecute(Sender: TObject);
    procedure actGoExecute(Sender: TObject);
    procedure actCloseTabExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private

    procedure setActivePage(ts: TTabSheet);
    function getActivePage(): TTabSheet;

    { Private declarations }
  public
    property activePage: TTabSheet read getActivePage write  setActivePage;
    { Public declarations }
  end;

var
  MF: TMainForm;

implementation
uses BrowserTab;
{$R *.dfm}

function TMainForm.getActiveForm(): TForm;
begin
  Result := ActivePage.Controls[0] as TForm;
end;

procedure TMainForm.setActivePage(ts: TTabSheet);
begin
  pages.ActivePage := ts;
end;

function TMainForm.getActivePage(): TTabSheet;
begin
  Result := pages.ActivePage;
end;

function TMainForm.getActiveBrowser(): TChromium;
begin
  Result := (getActivePage().Components[0] as TBrowserTab).Chromium1;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  openNewTab();
end;

procedure TMainForm.openUrlInNewTab(url: string);
var
sh: TTabSheet;
f: TBrowserTab;
begin
  sh := TTabSheet.Create(pages);
  sh.PageControl := pages;
  f := TBrowserTab.Create(sh);
  f.Parent := sh;
  sh.Parent := pages;
  f.BorderStyle := bsNone;
  f.Align := alClient;
  f.Show;
  pages.ActivePage := sh;
  f.Chromium1.Load(url);
end;
procedure TMainForm.openNewTab;
var
sh: TTabSheet;
f: TBrowserTab;
begin
  sh := TTabSheet.Create(pages);
  sh.PageControl := pages;
  f := TBrowserTab.Create(sh);
  f.Parent := sh;
  sh.Parent := pages;
  f.BorderStyle := bsNone;
  f.Align := alClient;
  f.Show;
  activePage := sh;
end;

procedure TMainForm.openUrl(url: string);
begin
  getActiveBrowser().Load(url);
end;

procedure TMainForm.actGoBackExecute(Sender: TObject);
begin
  getActiveBrowser.Browser.GoBack;
end;

procedure TMainForm.actGoForwardExecute(Sender: TObject);
begin
  getActiveBrowser.Browser.GoForward;
end;

procedure TMainForm.actNewTabExecute(Sender: TObject);
begin
  openNewTab();
end;

procedure TMainForm.actGoExecute(Sender: TObject);
begin
  openUrl((getActivePage().Components[0] as TBrowserTab).addressBar.Text);
end;

procedure TMainForm.actCloseTabExecute(Sender: TObject);
var
  i: integer;
  j: integer;
begin
  i := pages.ActivePageIndex;
  j := -1;
  if i = 0 then
  begin
    j := 1;
  end;
  if i + j > pages.PageCount - 1 then
  begin
    close;
  end;
  activePage := pages.Pages[i+j];
  pages.pages[i].Destroy;
end;

procedure TMainForm.actRefreshExecute(Sender: TObject);
begin
  getActiveBrowser().Browser.Reload;
end;

end.
