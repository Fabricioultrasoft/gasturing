object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Turing'
  ClientHeight = 587
  ClientWidth = 1073
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object gbCliente: TGroupBox
    Left = 8
    Top = 8
    Width = 815
    Height = 129
    Caption = ' Cliente '
    TabOrder = 0
    object sbBuscaCliente: TSpeedButton
      Left = 375
      Top = 26
      Width = 23
      Height = 22
    end
    object leNome: TLabeledEdit
      Left = 120
      Top = 27
      Width = 249
      Height = 21
      Hint = 'Para localizar digite um nome e tecle em busca'
      EditLabel.Width = 34
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome :'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object leCpf: TLabeledEdit
      Left = 404
      Top = 27
      Width = 121
      Height = 21
      EditLabel.Width = 26
      EditLabel.Height = 13
      EditLabel.Caption = 'CPF :'
      TabOrder = 1
    end
    object leEndereco: TLabeledEdit
      Left = 120
      Top = 64
      Width = 405
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = 'Endere'#231'o :'
      TabOrder = 2
    end
  end
  object gbAbastecimentos: TGroupBox
    Left = 8
    Top = 143
    Width = 385
    Height = 351
    Caption = ' Abastecimentos '
    TabOrder = 1
    object dbgBicos: TDBGrid
      Left = 2
      Top = 15
      Width = 381
      Height = 334
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object gbVenda: TGroupBox
    Left = 399
    Top = 143
    Width = 299
    Height = 351
    Caption = ' Venda '
    TabOrder = 2
  end
  object gbImpressora: TGroupBox
    Left = 704
    Top = 143
    Width = 273
    Height = 351
    Caption = ' Impressora '
    TabOrder = 3
    object pnEstado: TPanel
      Left = 2
      Top = 15
      Width = 269
      Height = 26
      Align = alTop
      Caption = 'em Projeto'
      TabOrder = 0
    end
    object mmBobina: TMemo
      Left = 2
      Top = 41
      Width = 269
      Height = 308
      Align = alClient
      Color = 12777717
      Lines.Strings = (
        '')
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 500
    Width = 969
    Height = 47
    Caption = ' Comandos '
    TabOrder = 4
    object BitBtn1: TBitBtn
      Left = 3
      Top = 16
      Width = 100
      Height = 25
      Caption = 'Caixa'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 109
      Top = 16
      Width = 100
      Height = 25
      Caption = 'Sangrias'
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 215
      Top = 16
      Width = 100
      Height = 25
      Caption = 'Recebimentos'
      TabOrder = 2
    end
    object BitBtn4: TBitBtn
      Left = 321
      Top = 16
      Width = 100
      Height = 25
      Caption = 'Despesas'
      TabOrder = 3
    end
    object BitBtn5: TBitBtn
      Left = 427
      Top = 16
      Width = 100
      Height = 25
      Caption = 'Cancelar Cupom'
      TabOrder = 4
    end
    object BitBtn6: TBitBtn
      Left = 533
      Top = 16
      Width = 100
      Height = 25
      Caption = 'Cancelar '#205'tem'
      TabOrder = 5
    end
    object BitBtn7: TBitBtn
      Left = 640
      Top = 16
      Width = 100
      Height = 25
      Caption = 'Menu Fiscal'
      TabOrder = 6
    end
    object BitBtn8: TBitBtn
      Left = 746
      Top = 16
      Width = 100
      Height = 25
      Caption = 'Configura'#231#245'es'
      TabOrder = 7
    end
    object BitBtn9: TBitBtn
      Left = 852
      Top = 16
      Width = 100
      Height = 25
      Caption = 'Sair'
      TabOrder = 8
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 568
    Width = 1073
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'Operador'
        Width = 100
      end
      item
        Width = 120
      end
      item
        Alignment = taCenter
        Text = 'Abertura'
        Width = 100
      end
      item
        Width = 120
      end
      item
        Alignment = taCenter
        Text = 'Troco'
        Width = 100
      end
      item
        Width = 120
      end>
  end
  object PAF: TACBrPAF
    Path = 'C:\Program Files\Embarcadero\RAD Studio\9.0\bin\'
    Left = 784
    Top = 248
  end
  object ECF: TACBrECF
    Porta = 'COM1'
    MsgAguarde = 'Aguardando a resposta da Impressora: %d segundos'
    MsgTrabalhando = 'Impressora est'#225' trabalhando'
    MsgRelatorio = 'Imprimindo %s  %d'#170' Via '
    MsgPausaRelatorio = 'Destaque a %d'#170' via, <ENTER> proxima, %d seg.'
    PaginaDeCodigo = 0
    FormMsgFonte.Charset = DEFAULT_CHARSET
    FormMsgFonte.Color = clWindowText
    FormMsgFonte.Height = -11
    FormMsgFonte.Name = 'Tahoma'
    FormMsgFonte.Style = []
    FormMsgColor = clHighlight
    MemoBobina = mmBobina
    MemoParams.Strings = (
      '[Cabecalho]'
      'LIN000=<center><b>Nome da Empresa</b></center>'
      'LIN001=<center>Nome da Rua , 1234  -  Bairro</center>'
      'LIN002=<center>Cidade  -  UF  -  99999-999</center>'
      
        'LIN003=<center>CNPJ: 01.234.567/0001-22    IE: 012.345.678.90</c' +
        'enter>'
      
        'LIN004=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>COO: <b><code>NumCupom</code' +
        '></b></td></tr></table>'
      'LIN005=<hr>'
      ' '
      '[Cabecalho_Item]'
      'LIN000=ITEM   CODIGO      DESCRICAO'
      'LIN001=QTD         x UNITARIO       Aliq     VALOR (R$)'
      'LIN002=<hr>'
      
        'MascaraItem=III CCCCCCCCCCCCCC DDDDDDDDDDDDDDDDDDDDDDDDDDDDDQQQQ' +
        'QQQQ UU x VVVVVVVVVVVVV AAAAAA TTTTTTTTTTTTT'
      ' '
      '[Rodape]'
      'LIN000=<hr>'
      
        'LIN001=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>Projeto ACBr: <b><code>ACBR<' +
        '/code></b></td></tr></table>'
      'LIN002=<center>Obrigado Volte Sempre</center>'
      'LIN003=<hr>'
      ' '
      '[Formato]'
      'Colunas=48'
      'HTML=1'
      'HTML_Title_Size=2'
      'HTML_Font=<font size="2" face="Lucida Console">')
    RFD = RFD
    ConfigBarras.MostrarCodigo = True
    ConfigBarras.LarguraLinha = 3
    ConfigBarras.Altura = 10
    InfoRodapeCupom.CupomMania = False
    InfoRodapeCupom.MinasLegal = False
    InfoRodapeCupom.ParaibaLegal = False
    InfoRodapeCupom.NotaLegalDF.Imprimir = False
    InfoRodapeCupom.NotaLegalDF.ProgramaDeCredito = False
    Left = 824
    Top = 248
  end
  object RFD: TACBrRFD
    ECF = ECF
    Left = 864
    Top = 248
  end
end
