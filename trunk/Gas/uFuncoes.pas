unit uFuncoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, WinSock,
  DBClient, SqlExpr, Dialogs, ExtCtrls, ComCtrls, ActnList, IniFiles,
  StdCtrls, ACBrBase, ACBrECF, ACBrDevice;

type
  recECF = record
    modelo: Integer;
    serial: String;
    total: Double;
  end;

  recCliente = record
    nome: String;
    primeiro_nome: String;
    ultimo_nome: String;
    cpf: String;
    endereco: String;
  end;

  recCupom = record
    id: Integer;
    valor: Double;
    pagamentos: Double;
    dinheiro: Double;
    aberto: Boolean;
    impresso: Boolean;
    salvo: Boolean;
    COO: String;
    CCF: String;
    GNF: String;
    desconto: Double;
    mensagem: String;
  end;

  recItem = record
    numero: Integer;
    id_produto: Integer;
    codigo: String;
    descricao: string;
    aliquota: String;
    preco: Double;
    quantidade: Double;
    valor: Double;
    cancelado: Boolean;
    abastecimento_id: Integer;
    desconto: Double;
    unidade: String;
    legenda: Boolean;
  end;

  recCaixa = record
    id: Integer;
    id_responsavel: Integer;
    responsavel: String;
    computador: String;
    estado: String;
    abertura: TDateTime;
  end;

  recPagamento = record
    numero: Integer;
    valor: Double;
    id_forma: Integer;
    id_cartao: Integer;
    dinheiro_id: Integer;
    pos_id: Integer;
    forma: String;
    vinculado: Boolean;
    observacoes: String;
    multiplos: Boolean;
    troco_cartao: Boolean;
    parcial_vprazo: Boolean;
  end;

  recAbastecimento = record
    id: Integer;
    numero_bico: Integer;
    litros: Double;
    preco: Double;
    valor: Double;
  end;

var
  Ecf: recECF;
  Cliente: recCliente;
  Caixa: recCaixa;
  Cupom: recCupom;
  Item: recItem;
  Abastecimento: recAbastecimento;
  Pagamento: recPagamento;
function Teste: Boolean;
function EstadoECF: String;
function RetornaGTECF: Double;
function RetornaSerialECF: String;
function GetComputerNameFunc: string;
function ZeroEsquerda(fTermo: String; fQuant: Integer): String;
function CodigoCombustivel(nCombustivel: Integer): String;
function Trunca(valor: Double; casas: Integer): Double;
Function GetIPAddress: String;
function Criptografa(texto: string; chave: Byte): String;
procedure AlterVirgulaPonto(auxForm: TForm; var Key: Char);
procedure AbreForm(aClasseForm: TComponentClass; aForm: TForm);
procedure Erro(mensagem: String);
procedure Aviso(mensagem: String);
procedure GravaArqINI(pPath, pSerial, pTotalizador: String;
  pModeloECF: Integer);

const
  Estados: array [TACBrECFEstado] of string = ('Não Inicializada',
    'Desconhecido', 'Livre', 'Venda', 'Pagamento', 'Relatório', 'Bloqueada',
    'Requer Z', 'Requer X', 'Nao Fiscal');
  ErrECF: string = 'Erro de comuicação com a Impressora Fiscal.';
  ErrServidor: string = 'Erro de comunicação com o Servidor.';
  ErrValor: string = 'Erro: Valor inválido.';

implementation

uses uDMpos;

// Testa ECF e Banco de Dados
function Teste: Boolean;
var
  bTeste, bECF, bDataBase: Boolean;
  cFalha: String;
begin
  bECF := True;
  bDataBase := True;
  cFalha := 'Erro: ';
  try
    bTeste := DMpos.Emissor.Ativo;
  except
    bECF := False;
    cFalha := cFalha + ' [Comunicação com a Impressora] ';
  end;
  try
    // bTeste := DMpos.cdsCaixa.Active;
  except
    bDataBase := False;
    cFalha := cFalha + ' [ Acesso ao Banco de Dados ] ';
  end;
  bTeste := bECF and bDataBase;
  if not bTeste then
    Erro(cFalha);
  Result := bTeste;
end;

// Retorna o Estado do ECF
function EstadoECF: String;
begin
  try
    Result := Estados[DMpos.Emissor.estado];
    // GetEnumName(TypeInfo(TACBrECFEstado), integer( DMpos.ECF.Estado ) ) ;
  except
    Result := 'Falha ao ler';
  end;
end;

// Mensagem de Erro
procedure Erro(mensagem: String);
begin
  MessageDlg(mensagem, mtError, [mbOK], 0);
end;

// Mensagem de Aviso
procedure Aviso(mensagem: String);
begin
  MessageDlg(mensagem, mtWarning, [mbOK], 0);
end;

// Retorna Grande Total
function RetornaGTECF: Double;
var
  nGT: Double;
begin
  try
    nGT := DMpos.Emissor.GrandeTotal;
  except
    raise;
  end;
  Result := nGT;
end;

// Retorna Serial ECF
function RetornaSerialECF: String;
var
  aSerial: String;
begin
  SetLength(aSerial, 15);
  try
    aSerial := DMpos.Emissor.NumSerie;
  except
    raise;
  end;
  Result := aSerial;
end;

// Abre Form
procedure AbreForm(aClasseForm: TComponentClass; aForm: TForm);
begin
  Application.CreateForm(aClasseForm, aForm);
  try
  finally
    aForm.Free;
  end;
end;

// Nome do Cpomputador
function GetComputerNameFunc: string;
var
  ipbuffer: string;
  nsize: dword;
begin
  nsize := 255;
  SetLength(ipbuffer, nsize);
  if GetComputerName(pchar(ipbuffer), nsize) then
    Result := ipbuffer;
end;

function ZeroEsquerda(fTermo: String; fQuant: Integer): String;
var
  aux: String;
  i: Integer;
begin
  Result := '';
  aux := Trim(fTermo);
  for i := 1 to fQuant - Length(aux) do
  begin
    Result := Result + '0';
  end;
  Result := Result + aux;
end;

function CodigoCombustivel(nCombustivel: Integer): String;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to 13 - Length(IntToStr(nCombustivel)) do
  begin
    Result := Result + '0';
  end;
  Result := Result + IntToStr(nCombustivel);
end;

procedure AlterVirgulaPonto(auxForm: TForm; var Key: Char);
var
  i: Integer;
begin
  for i := 0 to auxForm.ComponentCount - 1 do
  begin
    if auxForm.Components[i] is TEdit then
    begin
      with auxForm do
      begin
        if Key in [',', '.'] then
          Key := decimalseparator;
      end;
    end;
  end;
end;

function Trunca(valor: Double; casas: Integer): Double;
var
  i: Integer;
begin
  for i := 1 to casas do
  begin
    valor := valor * 10;
  end;
  valor := Int(valor);
  for i := 1 to casas do
  begin
    valor := valor / 10;
  end;
  Result := valor;
end;

///
Function GetIPAddress: String;
Type
  Name = Array [0 .. 100] Of AnsiChar;
  PName = ^Name;
Var
  HEnt: pHostEnt;
  HName: PName;
  WSAData: TWSAData;
  i: Integer;
Begin
  Result := '';
  If WSAStartup($0101, WSAData) <> 0 Then
    Exit;
  New(HName);
  If GetHostName(HName^, SizeOf(Name)) = 0 Then
  Begin
    HEnt := GetHostByName(HName^);
    For i := 0 To HEnt^.h_length - 1 Do
      Result := Concat(Result,
        IntToStr(Ord(SetLength(Result, Length(Result) - 1); End; Dispose(HName);
        WSACleanup; End;
        ///
      procedure GravaArqINI(pPath, pSerial, pTotalizador: String;
        pModeloECF: Integer); var ArqIni: TIniFile;
      begin ArqIni := TIniFile.Create(pPath + 'ArqVerifica.INI');
      ArqIni.WriteString('PAFECF', 'Serial', Criptografa(pSerial, 10));
      ArqIni.WriteString('PAFECF', 'GTECF', Criptografa(pTotalizador, 10));
      ArqIni.WriteInteger('PAFECF', 'Modelo', pModeloECF); ArqIni.Free; end;
      function Criptografa(texto: string; chave: Byte): String;
      var buffer: array of Byte; i: Integer; resultado: String;
      begin resultado := ''; SetLength(buffer, Length(texto));
      for i := 1 to Length(texto) do begin buffer[i - 1] := Ord(texto[i]);
      buffer[i - 1] := buffer[i - 1] xor chave;
      resultado := resultado + chr(buffer[i - 1]); end;
      Result := resultado; end; end.
