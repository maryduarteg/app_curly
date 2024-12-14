unit menu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.MultiView,
  FMX.Objects;

type
  Ttela_menu = class(TForm)
    ToolBar1: TToolBar;
    ScaledLayout1: TScaledLayout;
    MultiView1: TMultiView;
    bt_menu: TButton;
    bt_saida: TButton;
    bt_cadcli: TButton;
    bt_cadcid: TButton;
    bt_home: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image5: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    bt_excluirconta: TButton;
    Rectangle1: TRectangle;
    Image6: TImage;
    Image7: TImage;
    lb_nomeuser: TLabel;
    bt_listcli: TButton;
    bt_listuser: TButton;
    bt_listcid: TButton;
    Image4: TImage;
    Image8: TImage;
    Image9: TImage;
    procedure bt_saidaClick(Sender: TObject);
    procedure bt_excluircontaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bt_cadcidClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     usuario : string;

  end;

var
  tela_menu: Ttela_menu;



implementation

{$R *.fmx}

uses u_dm, caduser, login, splash, cidade;

procedure Ttela_menu.bt_cadcidClick(Sender: TObject);
begin
f_cidade.Show();
end;

procedure Ttela_menu.bt_excluircontaClick(Sender: TObject);
begin
    //primeiramente, saber se o abençoado quer realmente excluir a conta
    MessageDlg(usuario + ', deseja excluir sua conta? ', TmsgDlgType.mtConfirmation, [TmsgDlgBtn.mbYes, Tmsgdlgbtn.mbNo], 0, procedure(const Aresult : TModalResult)
     begin
       if Aresult = MrYes then
       begin
         with dm.sql_userread do
           begin
                  close;
                  sql.clear;
                  sql.Add('DELETE FROM user WHERE = :puser');
                  Parambyname('puser').Value:=usuario;
                  ExecSql;
                  ShowMessage(usuario+' seu cadadastro foi excluído com sucesso!');
                  Self.Close;

           end;
       end;
     end);

end;

procedure Ttela_menu.FormActivate (sender : TObject);
begin
       lb_nomeuser.Text := usuario;
end;

procedure Ttela_menu.bt_saidaClick(Sender: TObject);
begin
Application.Terminate;
end;



end.
