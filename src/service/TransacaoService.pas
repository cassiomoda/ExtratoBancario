unit TransacaoService;

interface

uses
  SysUtils, System.Generics.Collections, Transacao;

type
  TTransacaoService = class
  private
    class var FInstance: TTransacaoService;
    constructor Create;
    function AdicionarQuebraLinha(str: string): string;

  public
    class function GetInstance: TTransacaoService;
    class procedure FreeInstance;
    function Validar(transacao: TTransacao): string;
    function Inserir(transacao: TTransacao): string;
    function Alterar(transacao: TTransacao): string;
    function Excluir(transacao: TTransacao): string;
    procedure PreencherListaTransacoes;

  end;

implementation

uses
  TipoTransacaoEnum, TransacaoRepository, ListaTransacoes;

{TTransacaoService}

constructor TTransacaoService.Create;
begin
  inherited Create;
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
  if str.Trim <> '' then
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
    try
      repository.Inserir(transacao);
    except
      result := 'Ocorreu um erro ao tentar inserir a transação.';
    end;
  finally
    FreeAndNil(repository);
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
    try
      repository.Alterar(transacao);
    except
      result := 'Ocorreu um erro ao tentar inserir a transação.';
    end;
  finally
    FreeAndNil(repository);
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
    try
      repository.Excluir(transacao.Id);
      result := 'OK';
    except
      result := 'Ocorreu um erro ao tentar inserir a transação.';
    end;
  finally
    FreeAndNil(repository);
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

  try
    lista := repository.ListarTodas;

    for transacao in lista do
    begin
      listaTransacoes.InserirTransacao(transacao);
    end;

    transacao := TTransacao.Create;
    transacao.Id := 1;
    transacao.Nome := 'teste';
    transacao.Valor := 12.5;
    transacao.Data := now;
    transacao.Tipo := TTipoTransacaoEnum.credito;
    listaTransacoes.InserirTransacao(transacao);

    transacao := TTransacao.Create;
    transacao.Id := 2;
    transacao.Nome := 'Teste 2';
    transacao.Valor := 255.5;
    transacao.Data := now;
    transacao.Tipo := TTipoTransacaoEnum.debito;
    listaTransacoes.InserirTransacao(transacao);

  finally
    FreeAndNil(repository);
    FreeAndNil(lista);
  end;
end;

end.
