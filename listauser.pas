unit listauser;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope, FMX.ListView,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects,
  FMX.MultiView;

type
  Tf_listauser = class(TForm)
    ScaledLayout1: TScaledLayout;
    ToolBar1: TToolBar;
    bt_menu: TButton;
    bt_saida: TButton;
    ListView1: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    ToolBar2: TToolBar;
    Button1: TButton;
    Button2: TButton;
    MultiView1: TMultiView;
    bt_cadcli: TButton;
    bt_cadcid: TButton;
    bt_home: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
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
    procedure bt_excluircontaClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bt_homeClick(Sender: TObject);
    procedure bt_cadcidClick(Sender: TObject);
    procedure bt_cadcliClick(Sender: TObject);
    procedure bt_listcidClick(Sender: TObject);
    procedure bt_listcliClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    usuario: string;
  end;

var
  f_listauser: Tf_listauser;

implementation

{$R *.fmx}

uses u_dm, caduser, cidade, clientes, listacli, listcid, login, menu;

procedure Tf_listauser.bt_cadcidClick(Sender: TObject);
begin
f_cidade.Show;
end;

procedure Tf_listauser.bt_cadcliClick(Sender: TObject);
begin
             f_cliente.Show;
end;

procedure Tf_listauser.bt_excluircontaClick(Sender: TObject);
begin
 //primeiramente saber se o abençoado quer realmente excluir a conta
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

procedure Tf_listauser.bt_homeClick(Sender: TObject);
begin
           tela_menu.Show;
end;

procedure Tf_listauser.bt_listcidClick(Sender: TObject);
begin
f_listacid.Show;
end;

procedure Tf_listauser.bt_listcliClick(Sender: TObject);
begin
f_listacli;
end;

procedure Tf_listauser.Button2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure Tf_listauser.FormActivate(Sender: TObject);
begin
 lb_nomeuser.Text := usuario;
end;

end.
