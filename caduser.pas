unit caduser;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Layouts;

type
  Tf_caduser = class(TForm)
    ScaledLayout1: TScaledLayout;
    Label1: TLabel;
    e_cod: TEdit;
    e_login: TEdit;
    Button1: TButton;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    e_senha: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_caduser: Tf_caduser;

implementation

{$R *.fmx}

uses u_dm, login, menu, splash;

procedure Tf_caduser.Button1Click(Sender: TObject);
begin
      with dm.sql_caduser do
      begin
        close;
        Sql.Clear;
        Sql.Add( 'INSERT INTO user VALUES(:cod, :user, :senha');
        parambyname('cod').Value := e_cod.Text;
        parambyname('user').Value  := e_login.Text;
        parambyname('senha').Value := e_senha.Text;
        ExecSql;
        ShowMessage('Usu�rio ' + e_login.Text +' cadastrado com sucesso!');
        self.Close;
      end;
end;

procedure Tf_caduser.Button2Click(Sender: TObject);
begin
self.Close;
end;

end.
