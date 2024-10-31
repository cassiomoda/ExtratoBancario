unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBManager, ConnectionManager, TransacaoService,
  ListaTransacoes, Transacao, TipoTransacaoEnum, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, Vcl.Grids;

type
  TfrmMain = class(TForm)
    groupFiltros: TGroupBox;
    lblNome: TLabel;
    edtFiltroNome: TEdit;
    lblDataInicial: TLabel;
    edtFiltroDataInicial: TMaskEdit;
    edtFiltroDataFinal: TMaskEdit;
    lblDataFinal: TLabel;
    btnFiltrar: TBitBtn;
    ImageList: TImageList;
    grdTransacoes: TStringGrid;
    pnlBotoes: TPanel;
    btnInserir: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdTransacoesDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure PreencherCabecalhoGridTransacoes;
    procedure PreencherGridTransacoes;
    function GetTransacaoSelecionada: TTransacao;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses TransacaoForm;

procedure TfrmMain.btnAlterarClick(Sender: TObject);
var
  listaTransacoes: TListaTransacoes;
begin
  if frmTransacao = nil then
    Application.CreateForm(TfrmTransacao, frmTransacao);

  frmTransacao.transacao := GetTransacaoSelecionada;
  frmTransacao.ShowModal;

  while (frmTransacao.ModalResult = mrOk) and (frmTransacao.resultadoOperacao <> 'OK') do
    frmTransacao.ShowModal;

  if (frmTransacao.transacao.Id > 0) and (frmTransacao.ModalResult = mrOk) then
  begin
    listaTransacoes := TListaTransacoes.GetInstance;
    listaTransacoes.ExcluirTransacao(frmTransacao.transacao);
    listaTransacoes.InserirTransacao(frmTransacao.transacao);
    PreencherGridTransacoes;
  end;

  FreeAndNil(frmTransacao);
end;

procedure TfrmMain.btnExcluirClick(Sender: TObject);
var
  service: TTransacaoService;
  listaTransacoes: TListaTransacoes;
  transacao: TTransacao;
  resultado: string;
begin
  if MessageDlg('Deseja realmente excluir o registro selecionado?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  service := TTransacaoService.GetInstance;
  listaTransacoes := TListaTransacoes.GetInstance;
  transacao := GetTransacaoSelecionada;
  resultado := service.Excluir(transacao);

  if resultado <> 'OK' then
  begin
    MessageDlg(resultado, mtWarning, [mbOk], 0);
    Exit;
  end;

  listaTransacoes.ExcluirTransacao(transacao);
  PreencherGridTransacoes;
end;

procedure TfrmMain.btnInserirClick(Sender: TObject);
begin
  if frmTransacao = nil then
    Application.CreateForm(TfrmTransacao, frmTransacao);

  frmTransacao.transacao := TTransacao.Create;
  frmTransacao.transacao.Data := Date;
  frmTransacao.transacao.Tipo := TTipoTransacaoEnum.credito;
  frmTransacao.ShowModal;

  while (frmTransacao.ModalResult = mrOk) and (frmTransacao.resultadoOperacao <> 'OK') do
    frmTransacao.ShowModal;

  if frmTransacao.ModalResult = mrOk then
  begin
    TTransacaoService.GetInstance.PreencherListaTransacoes;
    PreencherGridTransacoes;
  end;

  FreeAndNil(frmTransacao);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDBManager.FreeInstance;
  TTransacaoService.FreeInstance;
  TConnectionManager.FreeInstance;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  TDBManager.GetInstance.ValidarObjetosBaseDados;
  TTransacaoService.GetInstance.PreencherListaTransacoes;
  PreencherGridTransacoes;
end;

procedure TfrmMain.grdTransacoesDrawCell(Sender: TObject; ACol, ARow: LongInt;
  Rect: TRect; State: TGridDrawState);
var
  valor: Real;
  repintar: boolean;
begin
  repintar := false;

  if ARow = 0 then
  begin
    grdTransacoes.Canvas.Font.Style := [fsBold];
    repintar := true;
  end
  else if (ACol = 3) and (grdTransacoes.Cells[ACol, ARow] <> '') then
  begin
    valor := StrToFloat(grdTransacoes.Cells[ACol, ARow]);

    if valor < 0 then
    begin
      grdTransacoes.Canvas.Font.Color := clRed;
      repintar := true;
    end;
  end;

  if repintar then
  begin
    grdTransacoes.Canvas.FillRect(Rect);
    grdTransacoes.Canvas.TextOut(Rect.Left + 5, Rect.Top + 5, grdTransacoes.Cells[ACol, ARow]);
  end;
end;

procedure TfrmMain.PreencherCabecalhoGridTransacoes;
begin
  grdTransacoes.ColCount := 5;
  grdTransacoes.RowCount := 2;

  grdTransacoes.ColWidths[0] := -1;
  grdTransacoes.Cells[0,0] := 'Id';

  grdTransacoes.ColWidths[1] := 170;
  grdTransacoes.Cells[1,0] := 'Data';

  grdTransacoes.ColWidths[2] := 350;
  grdTransacoes.Cells[2,0] := 'Nome';

  grdTransacoes.ColWidths[3] := 200;
  grdTransacoes.Cells[3,0] := 'Valor';

    grdTransacoes.ColWidths[4] := -1;
  grdTransacoes.Cells[4,0] := 'Tipo';
end;

procedure TfrmMain.PreencherGridTransacoes;
var
  listaTransacoes: TListaTransacoes;
  transacao: TTransacao;
  linha: integer;
begin
  PreencherCabecalhoGridTransacoes;
  listaTransacoes := TListaTransacoes.GetInstance;

  if listaTransacoes.Transacoes.Count > 0 then
    grdTransacoes.RowCount := listaTransacoes.Transacoes.Count + 1;

  linha := 0;

  for transacao in listaTransacoes.Transacoes.Values do
  begin
    linha := linha + 1;

    grdTransacoes.Cells[0,linha] := transacao.Id.ToString;
    grdTransacoes.Cells[1,linha] := DateTimeToStr(transacao.Data);
    grdTransacoes.Cells[2,linha] := transacao.Nome;
    grdTransacoes.Cells[3,linha] := FloatToStr(transacao.ObterValor);
    grdTransacoes.Cells[4,linha] := IntToStr(Ord(transacao.tipo));
  end;
end;

function TfrmMain.GetTransacaoSelecionada: TTransacao;
begin
  result := TTransacao.Create;
  result.Id := StrToInt(grdTransacoes.Cells[0, grdTransacoes.Row]);
  result.Data := StrToDateTime(grdTransacoes.Cells[1, grdTransacoes.Row]);
  result.Nome := grdTransacoes.Cells[2, grdTransacoes.Row];
  result.Valor := StrToFloat(grdTransacoes.Cells[3, grdTransacoes.Row]);
  result.Tipo := TTipoTransacaoEnum(StrToInt(grdTransacoes.Cells[4, grdTransacoes.Row]));

  if result.Valor < 0 then
    result.Valor := result.Valor * -1;
end;

end.
