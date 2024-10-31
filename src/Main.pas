unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBManager, ConnectionManager, TransacaoService,
  ListaTransacoes, Transacao, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, System.ImageList,
  Vcl.ImgList, Vcl.Grids;

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
  private
    { Private declarations }
    procedure PreencherCabecalhoGridTransacoes;
    procedure PreencherGridTransacoes;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

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
  else if ACol = 2 then
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
  grdTransacoes.ColCount := 3;
  grdTransacoes.RowCount := 2;

  grdTransacoes.ColWidths[0] := 170;
  grdTransacoes.Cells[0,0] := 'Data';

  grdTransacoes.ColWidths[1] := 350;
  grdTransacoes.Cells[1,0] := 'Nome';

  grdTransacoes.ColWidths[2] := 200;
  grdTransacoes.Cells[2,0] := 'Valor';
end;

procedure TfrmMain.PreencherGridTransacoes;
var
  listaTransacoes: TListaTransacoes;
  transacao: TTransacao;
  linha: integer;
begin
  PreencherCabecalhoGridTransacoes;
  listaTransacoes := TListaTransacoes.GetInstance;

  try
    if listaTransacoes.Transacoes.Count > 0 then
      grdTransacoes.RowCount := listaTransacoes.Transacoes.Count + 1;

    linha := 0;

    for transacao in listaTransacoes.Transacoes.Values do
    begin
      linha := linha + 1;

      grdTransacoes.Cells[0,linha] := DateTimeToStr(transacao.Data);
      grdTransacoes.Cells[1,linha] := transacao.Nome;
      grdTransacoes.Cells[2,linha] := FloatToStr(transacao.ObterValor);

      FreeAndNil(transacao);
    end;
  finally
    FreeAndNil(listaTransacoes);
  end;
end;

end.
