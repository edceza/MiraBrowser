unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ToolWin, ComCtrls, ceflib, cefvcl, ActnList, Buttons, QTabButton;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    ActionList1: TActionList;
    actGoBack: TAction;
    actGoForward: TAction;
    actNewTab: TAction;
    actGo: TAction;
    actCloseTab: TAction;
    actRefresh: TAction;
    SpeedButton1: TSpeedButton;
    actChangeTab: TAction;
    SaveDialog1: TSaveDialog;
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
    procedure tabBtnOnClick(Sender: TObject);
  private

    procedure setActivePage(ts: TTabSheet);
    function getActivePage(): TTabSheet;

    { Private declarations }
  public
    property activePage: TTabSheet read getActivePage write  setActivePage;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses unit2;
{$R *.dfm}

function TForm1.getActiveForm(): TForm;
begin
  Result := ActivePage.Controls[0] as TForm;
end;

procedure TForm1.setActivePage(ts: TTabSheet);
begin
  PageControl1.ActivePage := ts;
end;

function TForm1.getActivePage(): TTabSheet;
begin
  Result := PageControl1.ActivePage;
end;

function TForm1.getActiveBrowser(): TChromium;
begin
  Result := (getActivePage().Components[0] as TForm2).Chromium1;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  openNewTab();
end;

procedure TForm1.openUrlInNewTab(url: string);
var
sh: TTabSheet;
f: TForm2;
begin
  sh := TTabSheet.Create(PageControl1);
  sh.PageControl := PageControl1;
  f := TForm2.Create(sh);
  f.Parent := sh;
  sh.Parent := PageControl1;
  f.BorderStyle := bsNone;
  f.Align := alClient;
  f.Show;
  pagecontrol1.ActivePage := sh;
  f.Chromium1.Load(url);
end;
procedure TForm1.openNewTab;
var
sh: TTabSheet;
f: TForm2;
begin
  sh := TTabSheet.Create(PageControl1);
  sh.PageControl := PageControl1;
  f := TForm2.Create(sh);
  f.Parent := sh;
  sh.Parent := PageControl1;
  f.BorderStyle := bsNone;
  f.Align := alClient;
  f.Show;
  activePage := sh;
end;

procedure TForm1.openUrl(url: string);
begin
  getActiveBrowser().Load(url);
end;

procedure TForm1.actGoBackExecute(Sender: TObject);
begin
  getActiveBrowser.Browser.GoBack;
end;

procedure TForm1.actGoForwardExecute(Sender: TObject);
begin
  getActiveBrowser.Browser.GoForward;
end;

procedure TForm1.actNewTabExecute(Sender: TObject);
begin
  openNewTab();
end;

procedure TForm1.actGoExecute(Sender: TObject);
begin
  openUrl((getActivePage().Components[0] as TForm2).edit1.Text);
end;

procedure TForm1.actCloseTabExecute(Sender: TObject);
var
  i: integer;
  j: integer;
begin
  i := pagecontrol1.ActivePageIndex;
  j := -1;
  if i = 0 then
  begin
    j := 1;
  end;
  if i + j > pagecontrol1.PageCount - 1 then
  begin
    close;
  end;
  activePage := pagecontrol1.Pages[i+j];
  pagecontrol1.pages[i].Destroy;
end;

procedure TForm1.actRefreshExecute(Sender: TObject);
begin
  getActiveBrowser().Browser.Reload;
end;

procedure TForm1.tabBtnOnClick(Sender: TObject);
begin
  pageControl1.ActivePageIndex := (Sender as TTabButton).id;
end;

end.
