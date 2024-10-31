unit Filtro;

interface

type
  TFiltro = class
  private
    FNome: string;
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;

    procedure SetNome(const value: string);
    procedure SetDataInicial(const value: TDateTime);
    procedure SetDataFinal(const value: TDateTime);

  public
    property Nome: string read FNome write SetNome;
    property DataInicial: TDateTime read FDataInicial write SetDataInicial;
    property DataFinal: TDateTime read FDataFinal write SetDataFinal;
  end;

implementation

{TFiltro}

procedure TFiltro.SetNome(const value: string);
begin
  FNome := value;
end;

procedure TFiltro.SetDataInicial(const value: TDateTime);
begin
  FDataInicial := value;
end;

procedure TFiltro.SetDataFinal(const value: TDateTime);
begin
  FDataFinal := value;
end;

end.
