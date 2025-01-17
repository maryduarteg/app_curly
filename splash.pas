unit splash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Ani;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer: TTimer;
    anima_visible: TFloatAnimation;
    anima_invisible: TFloatAnimation;
    procedure TimerTimer(Sender: TObject);
    procedure anima_visibleFinish(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure anima_invisibleFinish(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses login;

procedure TForm1.anima_invisibleFinish(Sender: TObject);
begin
form_login.Show;
end;

procedure TForm1.anima_visibleFinish(Sender: TObject);
begin
Timer.Enabled := true;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
anima_visible.enabled := true;
anima_visible.Start;
end;

procedure TForm1.TimerTimer(Sender: TObject);
begin
anima_invisible.enabled := true;
anima_invisible.Start;
Timer.Enabled := false;

end;

end.
