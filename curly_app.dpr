program curly_app;

uses
  System.StartUpCopy,
  FMX.Forms,
  splash in 'splash.pas' {Form1},
  login in 'login.pas' {form_login},
  menu in 'menu.pas' {tela_menu},
  caduser in 'caduser.pas' {f_caduser},
  cidade in 'cidade.pas' {f_cidade},
  cliente in 'cliente.pas' {f_cliente};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tform_login, form_login);
  Application.CreateForm(Ttela_menu, tela_menu);
  Application.CreateForm(Tf_caduser, f_caduser);
  Application.CreateForm(Tf_cidade, f_cidade);
  Application.CreateForm(Tf_cliente, f_cliente);
  Application.Run;
end.
