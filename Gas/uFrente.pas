unit uFrente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, ACBrPAF, ACBrRFD, ACBrBase, ACBrECF,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    gbCliente: TGroupBox;
    leNome: TLabeledEdit;
    leCpf: TLabeledEdit;
    leEndereco: TLabeledEdit;
    sbBuscaCliente: TSpeedButton;
    gbAbastecimentos: TGroupBox;
    dbgBicos: TDBGrid;
    gbVenda: TGroupBox;
    gbImpressora: TGroupBox;
    pnEstado: TPanel;
    mmBobina: TMemo;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    PAF: TACBrPAF;
    ECF: TACBrECF;
    RFD: TACBrRFD;
    StatusBar1: TStatusBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
