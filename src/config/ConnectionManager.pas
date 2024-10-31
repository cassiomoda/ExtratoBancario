unit ConnectionManager;

interface

uses
  SysUtils, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Stan.Def, Config;

type
  TConnectionManager = class
  private
    FConnection: TFDConnection;
    class var FInstance: TConnectionManager;
    constructor Create;

  public
    property Connection: TFDConnection read FConnection;
    destructor Destroy; override;
    class function GetInstance: TConnectionManager;
    class procedure FreeInstance;

  end;

implementation

{TConnectionManager}

constructor TConnectionManager.Create;
begin
  inherited Create;

  FConnection := TFDConnection.Create(nil);
  FConnection.Name := 'conexao';
  FConnection.DriverName := DRIVER_NAME;
  FConnection.Params.Database := DATABASE;
  FConnection.Connected := true;
end;

destructor TConnectionManager.Destroy;
begin
  FreeAndNil(FConnection);
  inherited Destroy;
end;

class function TConnectionManager.GetInstance: TConnectionManager;
begin
  if FInstance = nil then
    FInstance := TConnectionManager.Create;

  result := FInstance;
end;

class procedure TConnectionManager.FreeInstance;
begin
  FreeAndNil(FInstance);
end;

end.
