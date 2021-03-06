unit Serial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, CPort, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    btnAygitSec: TButton;
    ComPort: TComPort;
    MemoLog: TMemo;
    btnAygitaBaglan: TButton;
    btnAygitiKapat: TButton;
    CheckBox1: TCheckBox;
    ComDataPacket1: TComDataPacket;
    procedure btnAygitSecClick(Sender: TObject);
    procedure btnAygitaBaglanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComPortRxChar(Sender: TObject; Count: Integer);
    procedure FormShow(Sender: TObject);
    procedure btnAygitiKapatClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComDataPacket1Packet(Sender: TObject; const Str: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnAygitaBaglanClick(Sender: TObject);
begin
  try
    ComPort.Open;
    if ComPort.Connected then
    begin
      MemoLog.Text := MemoLog.Text + '(' + ComPort.Port + ') �leti�im Ba�ar�l�...';
      MemoLog.Lines.Add('');
      // Gambi para ir para proxima linha, nao lembro como usar #13
      btnAygitaBaglan.Font.Color := clLime;
      btnAygitSec.Enabled := False;
      btnAygitiKapat.Caption := ComPort.Port + ' ' + btnAygitiKapat.Caption;
      btnAygitiKapat.Enabled := True;
      CheckBox1.Enabled := True;
      // btnComunicar.Enabled := True;
      // btnClosePort.Enabled := True;
    end
    else
    begin
      MemoLog.Text := MemoLog.Text + '(' + ComPort.Port + ') �leti�im Ba�ar�s�z';
      btnAygitaBaglan.Font.Color := clRed;
    end;
  Except
    on E: Exception do
    begin
      MemoLog.Text := MemoLog.Text + 'ERROR-> ' + E.Message;
      btnAygitaBaglan.Font.Color := clRed;
    end
  end
end;

procedure TForm1.btnAygitiKapatClick(Sender: TObject);
begin
  ComPort.Close;
  CheckBox1.Checked := False;
  CheckBox1.Enabled := False;
  btnAygitSec.Enabled := True;
  btnAygitaBaglan.Enabled := False;
  btnAygitiKapat.Enabled := False;
end;

procedure TForm1.btnAygitSecClick(Sender: TObject);
begin
  ComPort.ShowSetupDialog;
  btnAygitaBaglan.Enabled := True;
  btnAygitaBaglan.Caption := ComPort.Port + ' ' + btnAygitaBaglan.Caption;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin

  if CheckBox1.Checked then
  begin
    ComDataPacket1.ComPort := ComPort;
    ComDataPacket1.StartString := #13;
    ComDataPacket1.StopString := #13;
    ComDataPacket1.onPacket := ComDataPacket1Packet;
  end
  else
  begin
    //
  end;
end;

procedure TForm1.ComDataPacket1Packet(Sender: TObject; const Str: string);
begin
  MemoLog.Lines.Add(Str);
  // MemoLog.Text := MemoLog.Text + Str;
end;

procedure TForm1.ComPortRxChar(Sender: TObject; Count: Integer);
var
  RxCount: Integer;
  RxComport: String;
begin
  if not CheckBox1.Checked then
  begin
    // Primeiro, neste componente devemos saber
    // a quantidade de bytes recebidos
    RxCount := ComPort.InputCount;

    // Agora iremos chamar a fun��o que ira receber o conteudo
    // e informar onde sera armazenado e a quantidade com a variavel
    // acima
    ComPort.ReadStr(RxComport, RxCount);

    // Enviando para o MemoLog
    MemoLog.Text := MemoLog.Text + RxComport;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ComPort.Close;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  {
    example:

    ...
    ComDataPacket1.Comport := Comport1;
    ComDataPacket1.StartString := '!';
    ComDataPacket1.StopString := '#';
    ComDataPacket1.onPacket := ComDataPacket1Packet;
    ...

    //this is real code from one of my applications where I use it for barcode reader service
    procedure TDM.ComDataPacket1Packet(Sender: TObject; const Str: string);
    begin
    BarCodeReader.Barcode := Str;
    end;
  }

  if CheckBox1.Checked then
  begin
    ComDataPacket1.ComPort := ComPort;
    ComDataPacket1.StartString := #13;
    ComDataPacket1.StopString := #13;
    ComDataPacket1.onPacket := ComDataPacket1Packet;
  end
  else
  begin
    //
  end;
end;

end.
