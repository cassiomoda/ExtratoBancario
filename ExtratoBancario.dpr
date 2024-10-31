program ExtratoBancario;

uses
  Vcl.Forms,
  Main in 'src\Main.pas' {frmMain},
  Transacao in 'src\model\Transacao.pas',
  TipoTransacaoEnum in 'src\enums\TipoTransacaoEnum.pas',
  ListaTransacoes in 'src\dto\ListaTransacoes.pas',
  ITransacao in 'src\interfaces\ITransacao.pas',
  Config in 'src\config\Config.pas',
  ConnectionManager in 'src\config\ConnectionManager.pas',
  DBManager in 'src\config\DBManager.pas',
  TransacaoRepository in 'src\repository\TransacaoRepository.pas',
  TransacaoService in 'src\service\TransacaoService.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ExtratoBancario';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
