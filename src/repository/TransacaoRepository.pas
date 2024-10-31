unit TransacaoRepository;

interface

uses
  System.Generics.Collections, SysUtils, FireDAC.Comp.Client, FireDAC.DApt,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Async, ConnectionManager, Transacao,
  TipoTransacaoEnum, Filtro;

type
  TTransacaoRepository = class
  private
    class var FInstance: TTransacaoRepository;
    constructor Create;
    function ObterQry: TFDQuery;
    function ConverterStrToDateTime(dataStr: string): TDateTime;
    function RowToTransacaoObj(qry: TFDQuery): TTransacao;
    function AddWhereAnd(str: string): string;

  public
    class function GetInstance: TTransacaoRepository;
    class procedure FreeInstance;
    procedure Inserir(transacao: TTransacao);
    procedure Alterar(transacao: TTransacao);
    procedure Excluir(id: Integer);
    function ListarTodas: TObjectList<TTransacao>;
    function Localizar(filtro: TFiltro): TObjectList<TTransacao>;

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

class procedure  TTransacaoRepository.FreeInstance;
begin
  FreeAndNil(FInstance);
end;

function TTransacaoRepository.ObterQry: TFDQuery;
begin
  result := TFDQuery.Create(nil);
  result.name := 'qryBaseDados';
  result.Connection := TConnectionManager.GetInstance.Connection;
  result.close;
  result.SQL.Clear;
end;

function TTransacaoRepository.ConverterStrToDateTime(dataStr: string): TDateTime;
var
  format: TFormatSettings;
begin
  if dataStr <> '' then
  begin
    format := TFormatSettings.Create;
    format.DateSeparator := '-';
    format.ShortDateFormat := 'yyyy-MM-dd';
    result := StrToDateTime(dataStr, format);
  end;
end;

function TTransacaoRepository.RowToTransacaoObj(qry: TFDQuery): TTransacao;
begin
  result := TTransacao.Create;
  result.Id := qry.FieldByName('id').AsInteger;
  result.Nome := qry.FieldByName('nome').AsString;
  result.Valor := qry.FieldByName('valor').AsFloat;
  result.Data := ConverterStrToDateTime(qry.FieldByName('data').AsString);
  result.Tipo := TTipoTransacaoEnum(qry.FieldByName('tipo').AsInteger);
end;

function TTransacaoRepository.AddWhereAnd(str: string): string;
begin
  result := str;

  if result = '' then
    result := ' where '
  else
    result := result + ' and '
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
    qry.SQL.Add('   nome = :nome, ');
    qry.SQL.Add('   valor = :valor, ');
    qry.SQL.Add('   data = :data, ');
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

procedure TTransacaoRepository.Excluir(id: Integer);
var
  qry: TFDQuery;
begin
  qry := ObterQry;

  try
    qry.SQL.Add(' delete from ' + TABLE_NAME);
    qry.SQL.Add(' where id = :id ');
    qry.ParamByName('id').AsInteger := id;
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
    qry.SQL.Add(' select * from ' + TABLE_NAME + ' order by data desc ');
    qry.Open();
    qry.First;

    if not qry.Eof then
    begin
      while not qry.Eof do
      begin
        transacao := RowToTransacaoObj(qry);
        result.Add(transacao);
        qry.Next;
      end;
    end;
  finally
    FreeAndNil(qry);
  end;
end;

function TTransacaoRepository.Localizar(filtro: TFiltro): TObjectList<TTransacao>;
var
  qry: TFDQuery;
  transacao: TTransacao;
  where: string;
begin
  result := TObjectList<TTransacao>.Create;
  qry := ObterQry;

  try
    if filtro.Nome.Trim <> '' then
      where := ' where nome = :nome ';

    if (filtro.DataInicial <> 0) and (filtro.DataFinal = 0) then
    begin
      where := AddWhereAnd(where);
      where := where + ' data >= :dataInicial ';
    end
    else if (filtro.DataInicial = 0) and (filtro.DataFinal <> 0) then
    begin
      where := AddWhereAnd(where);
      where := where + ' data <= :dataFinal ';
    end
    else if (filtro.DataInicial <> 0) and (filtro.DataFinal <> 0) then
    begin
      where := AddWhereAnd(where);
      where := where + ' data between :dataInicial and :dataFinal ';
    end;

    qry.SQL.Add(' select * from ' + TABLE_NAME);
    qry.SQL.Add(where);

    if filtro.Nome.Trim <> '' then
      qry.ParamByName('nome').AsString := filtro.Nome;

    if (filtro.DataInicial <> 0) and (filtro.DataFinal = 0) then
      qry.ParamByName('dataInicial').AsDateTime := filtro.DataInicial
    else if (filtro.DataInicial = 0) and (filtro.DataFinal <> 0) then
      qry.ParamByName('dataFinal').AsDateTime := filtro.DataFinal
    else if (filtro.DataInicial <> 0) and (filtro.DataFinal <> 0) then
    begin
      qry.ParamByName('dataInicial').AsDateTime := filtro.DataInicial;
      qry.ParamByName('dataFinal').AsDateTime := filtro.DataFinal;
    end;

    qry.Open();
    qry.First;

    if not qry.Eof then
    begin
      while not qry.Eof do
      begin
        transacao := RowToTransacaoObj(qry);
        result.Add(transacao);
        qry.Next;
      end;
    end;
  finally
    FreeAndNil(qry);
  end;
end;

end.
