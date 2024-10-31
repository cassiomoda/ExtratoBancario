object frmTransacao: TfrmTransacao
  Left = 0
  Top = 0
  Caption = 'Transa'#231#227'o'
  ClientHeight = 250
  ClientWidth = 481
  Color = clInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 23
  object lblNome: TLabel
    Left = 32
    Top = 32
    Width = 47
    Height = 23
    Caption = 'Nome'
  end
  object lblValor: TLabel
    Left = 256
    Top = 32
    Width = 39
    Height = 23
    Caption = 'Valor'
  end
  object lblData: TLabel
    Left = 32
    Top = 104
    Width = 36
    Height = 23
    Caption = 'Data'
  end
  object edtNome: TEdit
    Left = 32
    Top = 56
    Width = 200
    Height = 31
    MaxLength = 50
    TabOrder = 0
  end
  object edtValor: TEdit
    Left = 256
    Top = 56
    Width = 150
    Height = 31
    MaxLength = 10
    NumbersOnly = True
    TabOrder = 1
  end
  object edtData: TMaskEdit
    Left = 32
    Top = 133
    Width = 199
    Height = 31
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 2
    Text = '  /  /    '
  end
  object radioTipo: TRadioGroup
    Left = 256
    Top = 104
    Width = 209
    Height = 60
    Caption = ' Tipo '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Cr'#233'dito'
      'D'#233'bito')
    TabOrder = 3
  end
  object btnCancelar: TBitBtn
    Left = 102
    Top = 191
    Width = 120
    Height = 41
    Caption = 'Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
  end
  object btnSalvar: TBitBtn
    Left = 258
    Top = 191
    Width = 120
    Height = 41
    Caption = 'Salvar'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 5
    OnClick = btnSalvarClick
  end
end
