unit TransacaoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Buttons, Transacao, TipoTransacaoEnum, TransacaoService;

type
  TfrmTransacao = class(TForm)
    lblNome: TLabel;
    edtNome: TEdit;
    lblValor: TLabel;
    edtValor: TEdit;
    lblData: TLabel;
    edtData: TMaskEdit;
    radioTipo: TRadioGroup;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    transacao: TTransacao;
    resultadoOperacao: string;
  end;

var
  frmTransacao: TfrmTransacao;

implementation

{$R *.dfm}

procedure TfrmTransacao.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', ',', #8]) then
    Key := #0;
end;

procedure TfrmTransacao.FormShow(Sender: TObject);
begin
  edtNome.Text := transacao.Nome;
  edtValor.Text := FloatToStr(transacao.Valor);
  edtData.Text := DateTimeToStr(transacao.Data);
  radioTipo.ItemIndex := Ord(transacao.Tipo) - 1;
end;

procedure TfrmTransacao.btnSalvarClick(Sender: TObject);
var
  service: TTransacaoService;
begin
  transacao.Nome := edtNome.Text;
  transacao.Valor := StrToFloat(edtValor.Text);
  transacao.Data := StrToDateTime(edtData.Text);
  transacao.Tipo := TTipoTransacaoEnum(radioTipo.ItemIndex + 1);

  service := TTransacaoService.GetInstance;
  resultadoOperacao := service.Validar(transacao);

  if resultadoOperacao <> 'OK' then
  begin
    MessageDlg(resultadoOperacao, mtWarning, [mbOk], 0);
    Exit;
  end;

  if transacao.id > 0 then
    resultadoOperacao := service.Alterar(transacao)
  else
    resultadoOperacao := service.Inserir(transacao);
end;

end.
