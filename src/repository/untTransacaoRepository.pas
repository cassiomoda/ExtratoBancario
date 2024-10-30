unit untTransacaoRepository;

interface

uses
  System.Generics.Collections, SysUtils, FireDAC.Comp.Client, FireDAC.DApt,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Async, untConexao, untTransacao, untTipoTransacao;

type
  TTransacaoRepository = class
  private
    class var FInstance: TTransacaoRepository;
    constructor Create;
    function ObterQry: TFDQuery;
    function RowToTransacaoObj(qry: TFDQuery): TTransacao;

  public
    class function GetInstance: TTransacaoRepository;
    procedure Inserir(transacao: TTransacao);
    procedure Alterar(transacao: TTransacao);
    procedure Excluir(transacao: TTransacao);
    function ListarTodas: TObjectList<TTransacao>;
    function Localizar(id: integer): TTransacao; overload;
    function Localizar(nome: string): TObjectList<TTransacao>; overload;
    function Localizar(data: TDateTime): TObjectList<TTransacao>; overload;
    function Localizar(dataInicial, dataFinal: TDateTime): TObjectList<TTransacao>; overload;

  end;

const
  TABLE_NAME = 'transacao';

implementation

{TTransacaoRepository}

constructor TTransacaoRepository.Create;
begin
  inherited Create;
end;

class function TTransacaoRepository.GetInstance: TTransacaoRepository;
begin
  if FInstance = nil then
    FInstance := TTransacaoRepository.Create;

  result := FInstance;
end;

function TTransacaoRepository.ObterQry: TFDQuery;
begin
  result := TFDQuery.Create(nil);
  result.name := 'qryBaseDados';
  result.Connection := TConexao.GetInstance.Conexao;
  result.close;
  result.SQL.Clear;
end;

function TTransacaoRepository.RowToTransacaoObj(qry: TFDQuery): TTransacao;
begin
  result := TTransacao.Create;
  result.Id := qry.FieldByName('id').AsInteger;
  result.Nome := qry.FieldByName('nome').AsString;
  result.Valor := qry.FieldByName('valor').AsFloat;
  result.Data := qry.FieldByName('data').AsDateTime;
  result.Tipo := TTipoTransacao(qry.FieldByName('tipo').AsInteger);
end;

procedure TTransacaoRepository.Inserir(transacao: TTransacao);
var
  qry: TFDQuery;
begin
  qry := ObterQry;

  try
    qry.SQL.Add(' insert into ' + TABLE_NAME + ' (nome, valor, data, tipo) ');
    qry.SQL.Add(' values (:nome, :valor, :data, :tipo) ');
    qry.ParamByName('nome').AsString := transacao.Nome;
    qry.ParamByName('valor').AsFloat := transacao.Valor;
    qry.ParamByName('data').AsDateTime := transacao.Data;
    qry.ParamByName('tipo').AsInteger := Ord(transacao.Tipo);
    qry.ExecSQL;
  finally
    FreeAndNil(qry);
  end;
end;

procedure TTransacaoRepository.Alterar(transacao: TTransacao);
var
  qry: TFDQuery;
begin
  qry := ObterQry;

  try
    qry.SQL.Add(' update ' + TABLE_NAME + ' set ');
    qry.SQL.Add('   nome = :nome ');
    qry.SQL.Add('   valor = :valor ');
    qry.SQL.Add('   data = :data ');
    qry.SQL.Add('   tipo = :tipo ');
    qry.SQL.Add(' where id = :id ');
    qry.ParamByName('nome').AsString := transacao.Nome;
    qry.ParamByName('valor').AsFloat := transacao.Valor;
    qry.ParamByName('data').AsDateTime := transacao.Data;
    qry.ParamByName('tipo').AsInteger := Ord(transacao.Tipo);
    qry.ParamByName('id').AsInteger := transacao.id;
    qry.ExecSQL;
  finally
    FreeAndNil(qry);
  end;
end;

procedure TTransacaoRepository.Excluir(transacao: TTransacao);
var
  qry: TFDQuery;
begin
  qry := ObterQry;

  try
    qry.SQL.Add(' delete from ' + TABLE_NAME);
    qry.SQL.Add(' where id = :id ');
    qry.ParamByName('id').AsInteger := transacao.Id;
    qry.ExecSQL;
  finally
    FreeAndNil(qry);
  end;
end;

function TTransacaoRepository.ListarTodas: TObjectList<TTransacao>;
var
  qry: TFDQuery;
  transacao: TTransacao;
begin
  result := TObjectList<TTransacao>.Create;
  qry := ObterQry;

  try
    qry.SQL.Add(' select * from ' + TABLE_NAME);
    qry.Open();
    qry.First;

    if not qry.Eof then
    begin
      while not qry.Eof do
      begin
        transacao := RowToTransacaoObj(qry);
        result.Add(transacao);
        FreeAndNil(transacao);
        qry.Next;
      end;
    end;
  finally
    FreeAndNil(qry);
  end;
end;

function TTransacaoRepository.Localizar(id: Integer): TTransacao;
var
  qry: TFDQuery;
begin
  qry := ObterQry;

  try
    qry.SQL.Add(' select * from ' + TABLE_NAME);
    qry.SQL.Add(' where id = :id ');
    qry.ParamByName('id').AsInteger := id;
    qry.Open();
    qry.First;

    if not qry.Eof then
      result := RowToTransacaoObj(qry);
  finally
    FreeAndNil(qry);
  end;
end;

function TTransacaoRepository.Localizar(nome: string): TObjectList<TTransacao>;
var
  qry: TFDQuery;
  transacao: TTransacao;
begin
  result := TObjectList<TTransacao>.Create;
  qry := ObterQry;

  try
    qry.SQL.Add(' select * from ' + TABLE_NAME);
    qry.SQL.Add(' where nome = :nome ');
    qry.ParamByName('nome').AsString := nome;
    qry.Open();
    qry.First;

    if not qry.Eof then
    begin
      while not qry.Eof do
      begin
        transacao := RowToTransacaoObj(qry);
        result.Add(transacao);
        FreeAndNil(transacao);
        qry.Next;
      end;
    end;
  finally
    FreeAndNil(qry);
  end;
end;

function TTransacaoRepository.Localizar(data: TDateTime): TObjectList<TTransacao>;
var
  qry: TFDQuery;
  transacao: TTransacao;
begin
  result := TObjectList<TTransacao>.Create;
  qry := ObterQry;

  try
    qry.SQL.Add(' select * from ' + TABLE_NAME);
    qry.SQL.Add(' where data = :data ');
    qry.ParamByName('data').AsDateTime := data;
    qry.Open();
    qry.First;

    if not qry.Eof then
    begin
      while not qry.Eof do
      begin
        transacao := RowToTransacaoObj(qry);
        result.Add(transacao);
        FreeAndNil(transacao);
        qry.Next;
      end;
    end;
  finally
    FreeAndNil(qry);
  end;
end;

function TTransacaoRepository.Localizar(dataInicial: TDateTime; dataFinal: TDateTime): TObjectList<TTransacao>;
var
  qry: TFDQuery;
  transacao: TTransacao;
begin
  result := TObjectList<TTransacao>.Create;
  qry := ObterQry;

  try
    qry.SQL.Add(' select * from ' + TABLE_NAME);
    qry.SQL.Add(' where data between :dataInicial and :dataFinal ');
    qry.ParamByName('dataInicial').AsDateTime := dataInicial;
    qry.ParamByName('dataFinal').AsDateTime := dataFinal;
    qry.Open();
    qry.First;

    if not qry.Eof then
    begin
      while not qry.Eof do
      begin
        transacao := RowToTransacaoObj(qry);
        result.Add(transacao);
        FreeAndNil(transacao);
        qry.Next;
      end;
    end;
  finally
    FreeAndNil(qry);
  end;
end;

end.
