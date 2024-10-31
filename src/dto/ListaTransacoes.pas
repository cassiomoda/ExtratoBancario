unit ListaTransacoes;

interface

uses
  SysUtils, System.Generics.Collections, ITransacao, Transacao;

type
  TListaTransacoes = class(TInterfacedObject, TITransacao)
  private
    FTransacoes: TDictionary<Integer, TTransacao>;
    class var FInstance: TListaTransacoes;

  public
    property Transacoes: TDictionary<Integer, TTransacao> read FTransacoes;
    constructor Create;
    destructor Destroy; override;
    class function GetInstance: TListaTransacoes;
    class procedure FreeInstance;
    procedure InserirTransacao(transacao: TTransacao);
    procedure ExcluirTransacao(id: Integer) overload;
    procedure ExcluirTransacao(transacao: TTransacao) overload;
    procedure LimparLista;
    function ObterValor: Real;

  end;

implementation

{TListaTransacoes}

constructor TListaTransacoes.Create;
begin
  inherited Create;
  FTransacoes := TDictionary<Integer, TTransacao>.Create;
end;

destructor TListaTransacoes.Destroy;
begin
  LimparLista;
  FreeAndNil(FTransacoes);
  inherited Destroy;
end;

class function TListaTransacoes.GetInstance: TListaTransacoes;
begin
  if FInstance = nil then
    FInstance := TListaTransacoes.Create;

  result := FInstance;
end;

class procedure TListaTransacoes.FreeInstance;
begin
  FreeAndNil(FInstance);
end;

procedure TListaTransacoes.InserirTransacao(transacao: TTransacao);
var
  novaTransacao: TTransacao;
begin
  if not FTransacoes.ContainsKey(transacao.Id) then
  begin
    novaTransacao := TTransacao.Create;
    novaTransacao.Id := transacao.Id;
    novaTransacao.Nome := transacao.Nome;
    novaTransacao.Valor := transacao.Valor;
    novaTransacao.Data := transacao.Data;
    novaTransacao.Tipo := transacao.Tipo;

    FTransacoes.Add(novaTransacao.id, novaTransacao);
  end;
end;

procedure TListaTransacoes.ExcluirTransacao(id: Integer);
begin
  FTransacoes.Remove(id);
end;

procedure TListaTransacoes.ExcluirTransacao(transacao: TTransacao);
var
  transacaoOld: TTransacao;
begin
  transacaoOld := FTransacoes[transacao.Id];
  FreeAndNil(transacaoOld);
  FTransacoes.Remove(transacao.Id);
end;

procedure TListaTransacoes.LimparLista;
var
  transacao: TTransacao;
begin
  for transacao in FTransacoes.Values do
    FreeAndNil(transacao);

  FreeAndNil(FTransacoes);
  FTransacoes := TDictionary<Integer, TTransacao>.Create;
end;

function TListaTransacoes.ObterValor: Real;
var
  transacao: TTransacao;
begin
  result := 0;

  for transacao in FTransacoes.Values do
  begin
    result := result + transacao.ObterValor;
  end;
end;

end.
