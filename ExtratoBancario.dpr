program ExtratoBancario;

uses
  Vcl.Forms,
  MainForm in 'src\MainForm.pas' {frmMain},
  Transacao in 'src\model\Transacao.pas',
  TipoTransacaoEnum in 'src\enums\TipoTransacaoEnum.pas',
  ListaTransacoes in 'src\dto\ListaTransacoes.pas',
  ITransacao in 'src\interfaces\ITransacao.pas',
  Config in 'src\config\Config.pas',
  ConnectionManager in 'src\config\ConnectionManager.pas',
  DBManager in 'src\config\DBManager.pas',
  TransacaoRepository in 'src\repository\TransacaoRepository.pas',
  TransacaoService in 'src\service\TransacaoService.pas',
  TransacaoForm in 'src\TransacaoForm.pas' {frmTransacao},
  Filtro in 'src\dto\Filtro.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ExtratoBancario';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
