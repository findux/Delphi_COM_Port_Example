object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 522
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 89
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 633
      Height = 13
      Align = alTop
      Caption = 'COM Port '#304'leti'#351'im Program'#305
      ExplicitWidth = 127
    end
    object btnAygitSec: TButton
      Left = 1
      Top = 14
      Width = 72
      Height = 74
      Align = alLeft
      Caption = 'Ayg'#305't Se'#231
      TabOrder = 0
      OnClick = btnAygitSecClick
    end
    object btnAygitaBaglan: TButton
      Left = 73
      Top = 14
      Width = 75
      Height = 74
      Align = alLeft
      Caption = 'Ayg'#305'ta Ba'#287'lan'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnAygitaBaglanClick
    end
    object btnAygitiKapat: TButton
      Left = 148
      Top = 14
      Width = 75
      Height = 74
      Align = alLeft
      Caption = 'Ayg'#305't'#305' Kapat'
      Enabled = False
      TabOrder = 2
      OnClick = btnAygitiKapatClick
      ExplicitLeft = 142
      ExplicitTop = 9
    end
    object CheckBox1: TCheckBox
      Left = 223
      Top = 14
      Width = 106
      Height = 74
      Align = alLeft
      Caption = 'Veriyi Data Paketi'
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 3
      OnClick = CheckBox1Click
    end
  end
  object MemoLog: TMemo
    Left = 0
    Top = 89
    Width = 635
    Height = 433
    Align = alClient
    Lines.Strings = (
      'MemoLog')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object ComPort: TComPort
    BaudRate = br38400
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    OnRxChar = ComPortRxChar
    Left = 360
    Top = 24
  end
  object ComDataPacket1: TComDataPacket
    OnPacket = ComDataPacket1Packet
    Left = 424
    Top = 24
  end
end
