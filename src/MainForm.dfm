object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Extrato Banc'#225'rio'
  ClientHeight = 441
  ClientWidth = 624
  Color = clInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object groupFiltros: TGroupBox
    Left = 0
    Top = 0
    Width = 624
    Height = 113
    Align = alTop
    Caption = ' Filtrar por '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 622
    object lblNome: TLabel
      Left = 16
      Top = 48
      Width = 47
      Height = 23
      Caption = 'Nome'
    end
    object lblDataInicial: TLabel
      Left = 248
      Top = 48
      Width = 85
      Height = 23
      Caption = 'Data Inicial'
    end
    object lblDataFinal: TLabel
      Left = 360
      Top = 46
      Width = 76
      Height = 23
      Caption = 'Data Final'
    end
    object edtFiltroNome: TEdit
      Left = 16
      Top = 72
      Width = 201
      Height = 31
      MaxLength = 50
      TabOrder = 0
    end
    object edtFiltroDataInicial: TMaskEdit
      Left = 248
      Top = 72
      Width = 90
      Height = 31
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object edtFiltroDataFinal: TMaskEdit
      Left = 360
      Top = 72
      Width = 90
      Height = 31
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
    end
    object btnFiltrar: TBitBtn
      Left = 480
      Top = 72
      Width = 97
      Height = 31
      Caption = 'Filtrar'
      ImageIndex = 0
      Images = ImageList
      Layout = blGlyphRight
      TabOrder = 3
      OnClick = btnFiltrarClick
    end
  end
  object grdTransacoes: TStringGrid
    Left = 0
    Top = 113
    Width = 624
    Height = 230
    Align = alClient
    FixedColor = clGray
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goFixedRowDefAlign]
    TabOrder = 1
    OnDrawCell = grdTransacoesDrawCell
    ExplicitWidth = 622
    ExplicitHeight = 263
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 384
    Width = 624
    Height = 57
    Align = alBottom
    Color = clInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 376
    ExplicitWidth = 622
    object btnInserir: TBitBtn
      Left = 143
      Top = 13
      Width = 97
      Height = 31
      Caption = 'Inserir'
      ImageIndex = 1
      Images = ImageList
      TabOrder = 0
      OnClick = btnInserirClick
    end
    object btnAlterar: TBitBtn
      Left = 263
      Top = 13
      Width = 97
      Height = 31
      Caption = 'Alterar'
      ImageIndex = 2
      Images = ImageList
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TBitBtn
      Left = 383
      Top = 13
      Width = 97
      Height = 31
      Caption = 'Excluir'
      ImageIndex = 3
      Images = ImageList
      TabOrder = 2
      OnClick = btnExcluirClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 343
    Width = 624
    Height = 41
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    ExplicitLeft = 544
    ExplicitTop = 336
    ExplicitWidth = 185
    object lblSaldo: TLabel
      Left = 1
      Top = 1
      Width = 622
      Height = 39
      Align = alClient
      Alignment = taRightJustify
      Caption = 'R$ 0.00    '
      Layout = tlCenter
      ExplicitLeft = 548
      ExplicitWidth = 75
      ExplicitHeight = 23
    end
  end
  object ImageList: TImageList
    Left = 576
    Top = 16
    Bitmap = {
      494C010104000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00E7E6EA00FFFFF800FFFFE7009C866A00FFFEF300FFFF
      FB00FFFFFE00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000021016180000000000000000000000000000000000000000000000000000
      00000210161800000000000000000000000000000000C48242FFC48242FFC482
      42FFC48242FFC48242FFC48242FFC48242FFC48242FFC48242FFC48242FFC482
      42FFC48242FF00000000000000000000000000000000C48242FFC48242FFC482
      42FFC48242FFC48242FFC48242FF00000000241FEDFF241FEDFF241FEDFF0000
      00000000000000000000241FEDFF241FEDFFFEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FFFCF500FFFFEE00A7865F00A2866300FFFEF300FEFF
      FD00FDFFFF00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000936131BFC48242FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C48242FF000000000000000000000000936131BFC48242FF000000000000
      00000000000000000000000000000000000000000000241FEDFF241FEDFF241F
      EDFF00000000241FEDFF241FEDFF241FEDFFFEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE007F6B5900D7B59100FFE0AF00B8966B00FFFEF100FCFE
      FE00FAFFFF00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000C87012FF00000000000000000000
      000000000000000000000000000000000000C48242FF936131BF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C48242FF000000000000000000000000C48242FF936131BF000000000000
      0000000000000000000000000000000000000000000000000000241FEDFF241F
      EDFF241FEDFF241FEDFF241FEDFF00000000FCFEFE00FEFDFF00FFFDFF00FFFD
      FE00FFFFFB00FFFFF700A7875E00FFE0AF00FFE0B2009C855F00FFFFEE00FDFF
      F900FBFFFF00FEFEFE00FEFEFE00FEFEFE000000000002101618000000000000
      0000000000000000000000000000C56E12FAC87012FFC56E12FA000000000000
      000000000000000000000000000002101618C48242FF936131BF000000000000
      00000000000000000000000000006C2E28FF431D199F00000000000000000000
      0000C48242FF000000000000000000000000C48242FF936131BF000000000000
      000000000000000000000000000000000000000000000000000000000000241F
      EDFF241FEDFF241FEDFF0000000000000000FEFEFE00FEFEFE00FFFCFF00FFFC
      FF00FFFFFE00FEFFF800AA865E00FFDFAF00FFDFB40098846100FFFFEE00FFFE
      FA00FBFEFF00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000C56E12FAC87012FFC56E12FA000000000000
      000000000000000000000000000000000000C48242FF936131BF000000000000
      00000000000000000000000000006C2E28FF000000006C2E28FF220E0D500000
      0000C48242FF000000000000000000000000C48242FF936131BF000000000000
      0000000000000000000000000000000000000000000000000000241FEDFF241F
      EDFF241FEDFF241FEDFF241FEDFF00000000FFFEFD00FFFEFE00FCFCFF00FAFD
      FF00FBFFFF00FAFFFD00A7846200FFDEB200FFDEB6009C836100FFFFEE00FFFD
      FA00FDFDFF00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000C56E12FAC87012FFC56E12FA000000000000
      000000000000000000000000000000000000C48242FF936131BF000000000000
      0000000000000000000000000000000000006C2E28FF6C2E28FF6C2E28FF431D
      199F00000000000000000000000000000000C48242FF936131BF000000000000
      00000000000000000000000000000000000000000000241FEDFF241FEDFF241F
      EDFF00000000241FEDFF241FEDFF241FEDFFFFFEFD00FFFEFE00F9FDFF00F8FE
      FF00FBFFFF00F5F8F600AD8C7200FFD6AF00F3CFA700A4866300FFFBEA00FFFF
      FB00FCFCFF00FEFEFE00FEFEFE00FEFEFE0003161E2000000000000000001009
      0115C87012FFC87012FFC87012FFC87012FFC87012FFC87012FFC87012FFC870
      12FFC87012FF100901150000000000000000C48242FF936131BF000000000000
      0000000000000000000000000000000000006C2E28FF6C2E28FF6C2E28FF6C2E
      28FF431D199F000000000000000000000000C48242FF936131BF000000000000
      000000000000000000000000000000000000241FEDFF241FEDFF241FEDFF0000
      00000000000000000000241FEDFF241FEDFFFFFDFE00FEFDFF00F9FEFF00F3F8
      F900F4F4EE00F8F3EA00B2907300FFDBB600FFDFB300AA8A5F00FFFFE500FFFF
      F800FBFAFE00FEFEFE00FEFEFE00FEFEFE000212191B0000000000000000C870
      12FFC87012FFC87012FFC87012FFC87012FFC87012FFC87012FFC87012FFC870
      12FFC87012FFC87012FF0000000000000000C48242FF936131BF000000000000
      000000000000000000000000000000000000000000006C2E28FF6C2E28FF6C2E
      28FF6C2E28FF431D199F0000000000000000C48242FF936131BF000000000000
      00000000000000000000000000000000000000000000241FEDFF000000000000
      0000C48242FF0000000000000000241FEDFFFFFCFF00FEFDFF00F9FFFE00FFFF
      FB00FFFFF200E5D4BA00E8C5A300FFE4BA00FFDDA900FCDCA700A08D6A00FFFF
      F100FBFBFB00FEFEFE00FEFEFE00FEFEFE0003171F2100000000000000001009
      0115C87012FFC87012FFC87012FFC87012FFC87012FFC87012FFC87012FFC870
      12FFC87012FF100901150000000000000000C48242FF936131BF000000000000
      00000000000000000000000000000000000000000000000000006C2E28FF6C2E
      28FF6C2E28FF6C2E28FF431D199F00000000C48242FF936131BF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C48242FF000000000000000000000000FEFEFE00FCFEFF00FEFEFE00FFFC
      F700EDDFC8009E886500FFE4C000EDCAA200FFDEAE00FFE9B800EDD7B4009082
      6B00FFFAF100FFFEFD00FEFEFE00FCFEFF000000000000000000000000000000
      0000000000000000000000000000C56E12FAC87012FFC56E12FA000000000000
      000000000000000000000000000000000000C48242FF936131BF000000000000
      0000000000000000000000000000000000000000000000000000000000006C2E
      28FF6C2E28FF6C2E28FF6C2E28FF431D199FC48242FF936131BF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C48242FF000000000000000000000000F6FBFA00FFFFFA00FFFEEB00D9C4
      A800D4BA9500FFE5BC00FEDCB800FEDCB800FEDCB800FEDCB800FCDAB600FFE5
      C100AB8D7000FFF7EB00F8F3F000FCFEFF000000000000000000000000000000
      0000000000000000000000000000C56E12FAC87012FFC56E12FA000000000000
      000000000000000000000000000000000000C48242FFC48242FFC48242FFC482
      42FFC48242FF0000000000000000000000000000000000000000000000000000
      00006C2E28FF6C2E28FF6C2E28FF6C2E28FFC48242FFC48242FFC48242FFC482
      42FFC48242FF0000000000000000000000000000000000000000000000000000
      0000C48242FF000000000000000000000000FFFBFF00FFF7E900D7C99500B8A3
      6600FFE4B300FFDEBE00FFDCB600FFDDB300FFDEB300FFDEB300FCD6AC00FFE9
      BF00F5D1AD009B7D6A00FFFFF400FFFFF6000000000002101618000000000000
      0000000000000000000000000000C56E12FAC87012FFC56E12FA000000000000
      00000000000000000000000000000210161800000000C48242FFC48242FFC482
      42FFC48242FFC48242FF00000000000000000000000000000000000000000000
      0000000000006C2E28FF6C2E28FF6C2E28FF00000000C48242FFC48242FFC482
      42FFC48242FFC48242FF00000000000000000000000000000000000000000000
      0000C48242FF000000000000000000000000FFFFF100B59E8400F2D9AD00F5D9
      AA00FFE1B600FFE2BE00FCDDB600FCDEB500FCDEB500FCDEB500FADCB300FFEB
      C200FFE8BF00FFE0BC009C7E5B00FFF3D1000000000000000000000000000000
      000000000000000000000000000000000000C87012FF00000000000000000000
      0000000000000000000000000000000000000000000000000000C48242FFC482
      42FFC48242FFC48242FF00000000000000000000000000000000000000000000
      00007A51299F000000006C2E28FF5E2823DF0000000000000000C48242FFC482
      42FFC48242FFC48242FF00000000000000000000000000000000000000000000
      0000C48242FF000000000000000000000000A28F6200C6AC8800FFE8D400FDD5
      C200F9DAB900F7DFB100F8DEB600FADCB900F8DDB800F8DDB800F9DBB800F9DB
      B800F9DCB500FCDBAD00FFDAAD00B78B5C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C482
      42FFC48242FFC48242FF00000000000000000000000000000000000000000000
      0000C48242FF000000000000000000000000000000000000000000000000C482
      42FFC48242FFC48242FF00000000000000000000000000000000000000000000
      0000C48242FF000000000000000000000000BB905100FFD9A100FFCFA000FFD9
      AE00FFDBAE00FFDDAB00FFDBAA00FFDAAB00FFDAAB00FFDAAB00FFDBAC00FFDB
      AC00FFDCAB00FAD39F00F9CA9200D49E62000000000000000000000000000000
      0000021016180000000000000000000000000000000000000000000000000000
      0000021016180000000000000000000000000000000000000000000000000000
      0000C48242FFC48242FF936131BF936131BF936131BF936131BF936131BFC482
      42FFC48242FF0000000000000000000000000000000000000000000000000000
      0000C48242FFC48242FF936131BF936131BF936131BF936131BF936131BFC482
      42FFC48242FF000000000000000000000000D28F5600BF7E3900C1863000C38D
      3600BB874500B5815300BC844D00BF864900BF864900BF864900BE854800BE85
      4800BB854900B5855100BE8A4E00C28C4B000000000000000000000000000000
      000000000000000000000000000003161E2003141B1D03161E20000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C48242FFC48242FFC48242FFC48242FFC48242FFC48242FF6E49
      258F000000000000000000000000000000000000000000000000000000000000
      000000000000C48242FFC48242FFC48242FFC48242FFC48242FFC48242FF6E49
      258F00000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
