unit untListaTransacoes;

interface

uses
  System.Generics.Collections, untITransacao, untTransacao;

type
  TListaTransacoes = class(TInterfacedObject, ITransacao)
  private
    Transacoes: TDictionary<int64, TTransacao>;

  public
    constructor Create;
    procedure InserirTransacao(transacao: TTransacao);
    procedure ExcluirTransacao(id: int64) overload;
    procedure ExcluirTransacao(transacao: TTransacao) overload;

    function ObterValor: Real;

  end;

implementation

{TListaTransacoes}

constructor TListaTransacoes.Create;
begin
  inherited Create;
  Transacoes := TDictionary<int64, TTransacao>.Create;
end;

procedure TListaTransacoes.InserirTransacao(transacao: TTransacao);
begin
  if not Transacoes.ContainsKey(transacao.Id) then
    Transacoes.Add(transacao.id, transacao);
end;

procedure TListaTransacoes.ExcluirTransacao(id: Int64);
begin
  Transacoes.Remove(id);
end;

procedure TListaTransacoes.ExcluirTransacao(transacao: TTransacao);
begin
  Transacoes.Remove(transacao.Id);
end;

function TListaTransacoes.ObterValor: Real;
var
  transacao: TTransacao;
begin
  result := 0;

  for transacao in Transacoes.Values do
  begin
    result := result + transacao.ObterValor;
  end;
end;

end.
