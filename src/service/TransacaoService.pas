unit TransacaoService;

interface

uses
  SysUtils, System.Generics.Collections, Transacao, Filtro;

type
  TTransacaoService = class
  private
    class var FInstance: TTransacaoService;
    constructor Create;
    function AdicionarQuebraLinha(str: string): string;

  public
    destructor Destroy; override;
    class function GetInstance: TTransacaoService;
    class procedure FreeInstance;
    function Validar(transacao: TTransacao): string;
    function Inserir(transacao: TTransacao): string;
    function Alterar(transacao: TTransacao): string;
    function Excluir(transacao: TTransacao): string;
    procedure PreencherListaTransacoes; overload;
    procedure PreencherListaTransacoes(filtro: TFiltro); overload;

  end;

implementation

uses
  TipoTransacaoEnum, TransacaoRepository, ListaTransacoes;

{TTransacaoService}

constructor TTransacaoService.Create;
begin
  inherited Create;
end;

destructor TTransacaoService.Destroy;
begin
  inherited Destroy;
end;

class function TTransacaoService.GetInstance: TTransacaoService;
begin
  if FInstance = nil then
    FInstance := TTransacaoService.Create;

  result := FInstance;
end;

class procedure TTransacaoService.FreeInstance;
begin
  FreeAndNil(FInstance);
end;

function TTransacaoService.AdicionarQuebraLinha(str: string): string;
begin
  result := str;

  if (str.Trim <> '') and (str <> 'OK') then
    result := str + #13#10;
end;

function TTransacaoService.Validar(transacao: TTransacao): string;
begin
  result := 'OK';

  if transacao.Nome.Trim = '' then
    result := 'O Nome precisa ser informado.';

  result := AdicionarQuebraLinha(result);

  if transacao.Valor = 0 then
    result := result + 'O Valor precisa ser informado.';

  result := AdicionarQuebraLinha(result);

  if transacao.Data = 0 then
    result := result + 'A Data precisa ser informada.';

  result := AdicionarQuebraLinha(result);

  if (transacao.Tipo <> TTipoTransacaoEnum.credito)
  and (transacao.Tipo <> TTipoTransacaoEnum.debito) then
    result := result + 'O Tipo precisa ser informado.';
end;

function TTransacaoService.Inserir(transacao: TTransacao): string;
var
  repository: TTransacaoRepository;
begin
  result := Validar(transacao);

  if result <> 'OK' then
    Exit;

  repository := TTransacaoRepository.GetInstance;

  try
    repository.Inserir(transacao);
  except
    result := 'Ocorreu um erro ao tentar inserir a transação.';
  end;
end;

function TTransacaoService.Alterar(transacao: TTransacao): string;
var
  repository: TTransacaoRepository;
begin
  result := Validar(transacao);

  if result <> 'OK' then
    Exit;

  if not transacao.id > 0 then
  begin
    result := 'O Id da transação precisa ser informado.';
    Exit;
  end;

  repository := TTransacaoRepository.GetInstance;

  try
    repository.Alterar(transacao);
  except
    result := 'Ocorreu um erro ao tentar inserir a transação.';
  end;
end;

function TTransacaoService.Excluir(transacao: TTransacao): string;
var
  repository: TTransacaoRepository;
begin
  if not transacao.id > 0 then
  begin
    result := 'O Id da transação precisa ser informado.';
    Exit;
  end;

  repository := TTransacaoRepository.GetInstance;

  try
    repository.Excluir(transacao.Id);
    result := 'OK';
  except
    result := 'Ocorreu um erro ao tentar inserir a transação.';
  end;
end;

procedure TTransacaoService.PreencherListaTransacoes;
var
  repository: TTransacaoRepository;
  listaTransacoes: TListaTransacoes;
  lista: TObjectList<TTransacao>;
  transacao: TTransacao;
begin
  repository := TTransacaoRepository.GetInstance;
  listaTransacoes := TListaTransacoes.GetInstance;
  listaTransacoes.LimparLista;
  lista := repository.ListarTodas;

  for transacao in lista do
  begin
    listaTransacoes.InserirTransacao(transacao);
  end;

  FreeAndNil(lista);
end;

procedure TTransacaoService.PreencherListaTransacoes(filtro: TFiltro);
var
  repository: TTransacaoRepository;
  listaTransacoes: TListaTransacoes;
  lista: TObjectList<TTransacao>;
  transacao: TTransacao;
begin
  repository := TTransacaoRepository.GetInstance;
  listaTransacoes := TListaTransacoes.GetInstance;
  listaTransacoes.LimparLista;
  lista := repository.Localizar(filtro);

  for transacao in lista do
  begin
    listaTransacoes.InserirTransacao(transacao);
  end;

  FreeAndNil(lista);
end;

end.
