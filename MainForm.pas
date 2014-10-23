unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cefvcl, ActnList, Buttons, ExtCtrls;

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
    procedure pagesMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pagesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pagesDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure pagesDragDrop(Sender, Source: TObject; X, Y: Integer);
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
frmBT: TBrowserTab;
begin
  sh := TTabSheet.Create(pages);
  sh.PageControl := pages;
  frmBT := TBrowserTab.Create(sh);
  frmBT.Parent := sh;
  sh.Parent := pages;
  frmBT.BorderStyle := bsNone;
  frmBT.Align := alClient;
  frmBT.Show;
  frmBT.Chromium1.Load(url);
end;

procedure TMainForm.openNewTab;
var
sh: TTabSheet;
frmBT: TBrowserTab;
begin
  sh := TTabSheet.Create(pages);
  sh.PageControl := pages;
  frmBT := TBrowserTab.Create(sh);
  frmBT.Parent := sh;
  sh.Parent := pages;
  frmBT.BorderStyle := bsNone;
  frmBT.Align := alClient;
  frmBT.Show;
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
  pages.pages[i].Free;
end;

procedure TMainForm.actRefreshExecute(Sender: TObject);
begin
  getActiveBrowser().Browser.Reload;
end;

procedure TMainForm.pagesMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button = mbMiddle then
  begin
    actCloseTab.Execute;
  end;
end;

procedure TMainForm.pagesMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pages.BeginDrag(False);
end;

procedure TMainForm.pagesDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if (Sender is TPageControl) then Accept := True;
end;

procedure TMainForm.pagesDragDrop(Sender, Source: TObject; X, Y: Integer);
const
   TCM_GETITEMRECT = $130A;
var
   TabRect: TRect;
   j: Integer;
begin
   if (Sender is TPageControl) then
   for j := 0 to pages.PageCount - 1 do
   begin
     pages.Perform(TCM_GETITEMRECT, j, LParam(@TabRect)) ;
     if PtInRect(TabRect, Point(X, Y)) then
     begin
       if pages.ActivePage.PageIndex <> j then
         pages.ActivePage.PageIndex := j;
       Exit;
     end;
   end;

end;

end.
