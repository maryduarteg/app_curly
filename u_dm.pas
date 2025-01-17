unit u_dm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Phys.MySQLDef,
  FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Phys.MySQL;

type
  Tdm = class(TDataModule)
    conexao: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    sql_userread: TFDQuery;
    sql_userreaduser_id: TIntegerField;
    sql_userreaduser_login: TStringField;
    sql_userreaduser_senha: TStringField;
    sql_caduser: TFDQuery;
    sql_cidade: TFDQuery;
    sql_cidread: TFDQuery;
    procedure conexaoBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses caduser, login, menu, splash;

{$R *.dfm}

procedure Tdm.conexaoBeforeConnect(Sender: TObject);
begin
{$IF DEFINED (ios) OR DEFINED (ANDROID)}
conexao.ParamS.Values['Database']:= Tpath.combine
(TPath.getdocumentsPath, 'curlybanco.db');
{$ENDIF}
end;

end.
