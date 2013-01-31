unit uDMpos;

interface

uses
  System.SysUtils, System.Classes, ACBrBase, ACBrECF;

type
  TDMpos = class(TDataModule)
    Emissor: TACBrECF;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMpos: TDMpos;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
