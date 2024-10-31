unit ListaTransacoes;

interface

uses
  SysUtils, System.Generics.Collections, ITransacao, Transacao;

type
  TListaTransacoes = class(TInterfacedObject, TITransacao)
  private
    FTransacoes: TDictionary<int64, TTransacao>;
    class var FInstance: TListaTransacoes;

  public
    property Transacoes: TDictionary<int64, TTransacao> read FTransacoes;
    constructor Create;
    class function GetInstance: TListaTransacoes;
    class procedure FreeInstance;
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
  FTransacoes := TDictionary<int64, TTransacao>.Create;
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
begin
  if not FTransacoes.ContainsKey(transacao.Id) then
    FTransacoes.Add(transacao.id, transacao);
end;

procedure TListaTransacoes.ExcluirTransacao(id: Int64);
begin
  FTransacoes.Remove(id);
end;

procedure TListaTransacoes.ExcluirTransacao(transacao: TTransacao);
begin
  FTransacoes.Remove(transacao.Id);
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