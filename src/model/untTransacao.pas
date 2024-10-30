unit untTransacao;

interface

uses
  untITransacao, untTipoTransacao;

type
  TTransacao = class(TInterfacedObject, ITransacao)
  private
    FId: Integer;
    FNome: String;
    FValor: Real;
    FData: TDateTime;
    FTipo: TTipoTransacao;

    procedure SetId(const value: Integer);
    procedure SetNome(const value: string);
    procedure SetValor(const value: Real);
    procedure SetData(const value: TDateTime);
    procedure SetTipo(const value: TTipoTransacao);

  public
    property Id: Integer read FId write SetId;
    property Nome: string read FNome write SetNome;
    property Valor: Real read FValor write SetValor;
    property Data: TDateTime read FData write SetData;
    property Tipo: TTipoTransacao read FTipo write SetTipo;

    function ObterValor: Real;

  end;

implementation

{TTransacao}

procedure TTransacao.SetId(const value: Integer);
begin
  FId := value;
end;

procedure TTransacao.SetNome(const value: string);
begin
  FNome := value;
end;

procedure TTransacao.SetValor(const value: Real);
begin
  FValor := value;
end;

procedure TTransacao.SetData(const value: TDateTime);
begin
  FData := value;
end;

procedure TTransacao.SetTipo(const value: TTipoTransacao);
begin
  FTipo := value;
end;

function TTransacao.ObterValor: Real;
begin
  result := FValor;

  if FTipo = debito then
    result := result * -1;
end;

end.