unit clientes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Layouts, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation,
  FMX.MultiView;

type
  Tf_cliente = class(TForm)
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
    ScaledLayout1: TScaledLayout;
    Label1: TLabel;
    e_cod: TEdit;
    e_nome: TEdit;
    Button1: TButton;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    Label5: TLabel;
    e_cpf: TEdit;
    e_cid: TEdit;
    ToolBar1: TToolBar;
    bt_menu: TButton;
    bt_saida: TButton;
    procedure Button1Click(Sender: TObject);
    procedure bt_saidaClick(Sender: TObject);
    procedure bt_excluircontaClick(Sender: TObject);
    procedure bt_homeClick(Sender: TObject);
    procedure bt_cadcidClick(Sender: TObject);
    procedure bt_listcliClick(Sender: TObject);
    procedure bt_listcidClick(Sender: TObject);
    procedure bt_listuserClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    usuario : string;
  end;

var
  f_cliente: Tf_cliente;

implementation

{$R *.fmx}

uses u_dm, caduser, cidade, listacli, listauser, listcid, login, menu;

procedure Tf_cliente.bt_cadcidClick(Sender: TObject);
begin
f_cidade.Show;
end;

procedure Tf_cliente.bt_excluircontaClick(Sender: TObject);
begin
               //primeiramente saber se o aben�oado quer realmente excluir a conta
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
                  ShowMessage(usuario+' seu cadadastro foi exclu�do com sucesso!');
                  Self.Close;

           end;
       end;
     end);
end;

procedure Tf_cliente.bt_homeClick(Sender: TObject);
begin
          tela_menu.Show;
end;

procedure Tf_cliente.bt_listcidClick(Sender: TObject);
begin
f_listacid.Show;
end;

procedure Tf_cliente.bt_listcliClick(Sender: TObject);
begin
f_listacli.Show;
end;

procedure Tf_cliente.bt_listuserClick(Sender: TObject);
begin
        f_listauser.Show;
end;

procedure Tf_cliente.bt_saidaClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure Tf_cliente.Button1Click(Sender: TObject);
begin
             if (e_cod.Text <> '') or (e_nome.Text <> '') or (e_cid.Text <> '') or (e_cpf.Text <> '') then
        begin
        //buscar os cods da cidade
            with dm.sql_clienteread do
            begin
                    close;
                    sql.Clear;
                    sql.Add('SELECT * FROM cliente WHERE cli_cod=:pcod');
                    parambyname('pcod').Value := StrToInt(e_cod.Text);
                    open;
                if (recordcount = 0 ) then   //Continuar apenas se a
                    //busca n�o retornou algum c�digo j� cadastrado
                    begin
                      with dm.sql_cidade do
                      begin
                        close;
                        sql.Clear;
                        Sql.Add('INSERT INTO cliente VALUES (:pcod, :pnome, :pcid, :pcpf');
                        parambyname('pcod').Value := StrToInt(e_cod.Text);
                        parambyname('pnome').Value := e_nome.Text;
                        parambyname('pcid').Value := StrToInt(e_cid.Text);
                        parambyname('pcpf').Value := e_cpf.Text;
                        ExecSql;
                        ShowMessage ('O cliente '+e_nome.Text+' foi cadastrada com sucesso');

                      end;

                     dm.sql_clienteread.Close;
                     dm.sql_clienteread.sql.Clear;
                     dm.sql_clienteread.sql.Add('SELECT * FROM cliente');
                     dm.sql_clienteread.Open;
                     // fechar form, pois j� cadastrou
                     self.Close;


                    end
                    else
                    begin
                      ShowMessage('O c�digo '+ e_cod.Text+ ' j� foi cadastrado!');
                      e_cod.Text := '';
                      e_cod.SetFocus;

                    end;

            end;


        end
    else
      begin
          ShowMessage('Preencha todos os campos!');
          e_cod.SetFocus;
          e_cod.Text := '';
          e_nome.Text := '';
          e_cid.Text := '';
          e_cpf.Text := '';

      end;

end;

procedure Tf_cliente.FormActivate(Sender: TObject);
begin
lb_nomeuser.Text := usuario;
end;

end.
