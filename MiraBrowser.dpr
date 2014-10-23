program MiraBrowser;

uses
  Forms,
  MainForm in 'MainForm.pas' {MainForm},
  BrowserTab in 'BrowserTab.pas' {BrowserTab};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MF);
  Application.Run;
end.
