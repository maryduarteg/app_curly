unit cidade;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects,
  FMX.MultiView;

type
  Tf_cidade = class(TForm)
    ScaledLayout1: TScaledLayout;
    Label1: TLabel;
    e_cod: TEdit;
    e_nome: TEdit;
    Button1: TButton;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    cb_uf: TComboBox;
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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_cidade: Tf_cidade;

implementation

{$R *.fmx}

uses u_dm, login;

procedure Tf_cidade.Button1Click(Sender: TObject);
begin

    if (e_cod.Text <> ' ') or (e_nome.Text <> ' ') or (cb_uf.Items[cb_uf.ItemIndex] <> ' ') then
        begin
        //buscar os cods da cidade
            with dm.sql_cidread do
            begin
                    close;
                    sql.Clear;
                    sql.Add('SELECT * FROM cidade WHERE cid_cod=:pcod');
                    parambyname('pcod').Value := StrToInt(e_cod.Text);
                    open;
                if (recordcount > 0 ) then   //Continuar apenas se a
                    //busca n�o retornou algum c�digo j� cadastrado
                    begin
                      with dm.sql_cidade do
                      begin
                        close;
                        sql.Clear;
                        Sql.Add('INSERT INTO cidade VALUES (:pcod, :pnome, :puf)');
                        parambyname('pcod').Value := StrToInt(e_cod.Text);
                        parambyname('pnome').Value := e_nome.Text;
                        parambyname('puf').Value := cb_uf.Items[cb_uf.ItemIndex];
                        ExecSql;
                        ShowMessage ('A cidade '+e_nome.Text+' foi cadastrada com sucesso');

                      end;

                     dm.sql_cidread.Close;
                     dm.sql_cidread.sql.Clear;
                     dm.sql_cidread.sql.Add('SELECT * FROM cidade');
                     dm.sql_cidread.Open;
                     // fechar form, pois j� cadastrou
                     self.Close;


                    end
                    else
                    begin
                      ShowMessage('O c�digo '+e_cod.Text+ ' j� foi cadastrado!');
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
          cb_uf.Items[cb_uf.ItemIndex] := '';
      end;


end;

procedure Tf_cidade.Button2Click(Sender: TObject);
begin
form_login.Show;
end;

end.
