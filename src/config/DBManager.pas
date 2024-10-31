unit DBManager;

interface

uses
  SysUtils, FireDAC.Comp.Client, FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.Stan.Async;

type
  TDBManager = class
  private
    class var FInstance: TDBManager;
    constructor Create;
    function ObterQry: TFDQuery;
    procedure CriarTabela(tabela: string);

  public
    class function GetInstance: TDBManager;
    class procedure FreeInstance;
    procedure ValidarObjetosBaseDados;

  end;

const
  TABELAS: TArray<string> = ['transacao'];


implementation

uses
  ConnectionManager;

{TDBManager}

constructor TDBManager.Create;
begin
  inherited Create;
end;

class function TDBManager.GetInstance: TDBManager;
begin
  if FInstance = nil then
    FInstance := TDBManager.Create;

  result := FInstance;
end;

function TDBManager.ObterQry: TFDQuery;
begin
  result := TFDQuery.Create(nil);
  result.name := 'qryBaseDados';
  result.Connection := TConnectionManager.GetInstance.Connection;
  result.Close;
  result.SQL.Clear;
end;

class procedure TDBManager.FreeInstance;
begin
  FreeAndNil(FInstance);
end;

procedure TDBManager.CriarTabela(tabela: string);
var
  qry: TFDQuery;
begin
  qry := ObterQry;

  try
    if tabela = 'transacao' then
    begin
      qry.Close;
      qry.SQL.Clear;
      qry.SQL.Add(' create table transacao( ');
      qry.SQL.Add('   id integer primary key autoincrement, ');
      qry.SQL.Add('   nome varchar(50) not null, ');
      qry.SQL.Add('   valor real not null, ');
      qry.SQL.Add('   data text not null, ');
      qry.SQL.Add('   tipo integer not null ');
      qry.SQL.Add(' ) ');
      qry.ExecSQL;
    end;
  finally
    FreeAndNil(qry);
  end;
end;

procedure TDBManager.ValidarObjetosBaseDados;
var
  tabela: string;
  qry: TFDQuery;
begin
  qry := ObterQry;

  try
    for tabela in TABELAS do
    begin
      qry.Close;
      qry.SQL.Clear;
      qry.SQL.Add(' select 1 from sqlite_master ');
      qry.SQL.Add(' where type = ' + QuotedStr('table'));
      qry.SQL.Add(' and name = ' + QuotedStr(tabela));
      qry.Open();

      if qry.Eof then
        CriarTabela(tabela);
    end;
  finally
    FreeAndNil(qry);
  end;
end;

end.
