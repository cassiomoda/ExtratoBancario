program ExtratoBancario;

uses
  Vcl.Forms,
  untMain in 'src\untMain.pas' {frmMain},
  untTransacao in 'src\model\untTransacao.pas',
  untTipoTransacao in 'src\enums\untTipoTransacao.pas',
  untListaTransacoes in 'src\dto\untListaTransacoes.pas',
  untITransacao in 'src\interfaces\untITransacao.pas',
  untConfig in 'src\config\untConfig.pas',
  untConexao in 'src\config\untConexao.pas',
  untBaseDados in 'src\config\untBaseDados.pas',
  untTransacaoRepository in 'src\repository\untTransacaoRepository.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ExtratoBancario';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
