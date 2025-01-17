unit cliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Edit, FMX.Layouts, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation,
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
    Edit1: TEdit;
    Edit2: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_cliente: Tf_cliente;

implementation

{$R *.fmx}

end.
