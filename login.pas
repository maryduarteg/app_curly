unit login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  Tform_login = class(TForm)
    ScaledLayout1: TScaledLayout;
    Label1: TLabel;
    Label2: TLabel;
    e_login: TEdit;
    e_senha: TEdit;
    Entrar: TButton;
    Label3: TLabel;
    Button1: TButton;
    Image1: TImage;
    Label4: TLabel;
    Button2: TButton;
    procedure EntrarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    user : string;
  end;

var
  form_login: Tform_login;

implementation

{$R *.fmx}

uses menu, u_dm, caduser, cidade;

procedure Tform_login.Button1Click(Sender: TObject);
begin
f_caduser.Show;
end;

procedure Tform_login.Button2Click(Sender: TObject);
begin
form2.Show;
end;

procedure Tform_login.EntrarClick(Sender: TObject);
var usuario : string;
begin
  
      with dm.sql_userread do
      begin
              close;
              SQL.Clear;
              SQL.Add('SELECT * FROM user WHERE user_login = :puser_login and user_senha= :puser_senha');
              parambyname('puser_login').Value:= e_login.Text;
              parambyname('puser_senha').Value:= e_senha.Text;
              open;
              if (RecordCount > 0 ) then
              begin
                ShowMessage('Ol� ' + e_login.Text +', seja bem vindo!');
                usuario := e_login.Text;
                e_login.Text := '';
                e_senha.Text := '';
                e_login.SetFocus;
                tela_menu.usuario := usuario;
                tela_menu.Show;
              end
              else
              begin
                ShowMessage('Usu�rio n�o cadastrado!');
                e_login.Text := '';
                e_senha.Text := '';
                e_login.SetFocus;
              end;

      end;




end;

end.
