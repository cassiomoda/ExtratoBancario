unit untConexao;

interface

uses
  FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Stan.Def, untConfig;

type
  TConexao = class
  private
    FConexao: TFDConnection;
    class var FInstance: TConexao;
    constructor Create;

  public
    property Conexao: TFDConnection read FConexao;
    class function GetInstance: TConexao;

  end;

implementation

{TConexao}

constructor TConexao.Create;
begin
  inherited Create;

  FConexao := TFDConnection.Create(nil);
  FConexao.Name := 'conexao';
  FConexao.DriverName := DRIVER_NAME;
  FConexao.Params.Database := DATABASE;
  FConexao.Connected := true;
end;

class function TConexao.GetInstance: TConexao;
begin
  if FInstance = nil then
    FInstance := TConexao.Create;

  result := FInstance;
end;

end.
