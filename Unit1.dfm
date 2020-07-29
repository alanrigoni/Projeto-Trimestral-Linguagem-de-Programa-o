object Formulario: TFormulario
  Left = 0
  Top = 0
  Caption = 'M'#250'sicas'
  ClientHeight = 363
  ClientWidth = 706
  Color = clGrayText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Lb_Musicas: TLabel
    Left = 24
    Top = 24
    Width = 674
    Height = 32
    Caption = 'Grave o Nome, Artista e Album de suas m'#250'sicas favoritas!!!'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Matura MT Script Capitals'
    Font.Style = [fsStrikeOut]
    ParentFont = False
  end
  object Ed_nomemusica: TEdit
    Left = 144
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 0
    TextHint = 'Nome da M'#250'sica'
  end
  object Bt_Inserir: TButton
    Left = 327
    Top = 144
    Width = 75
    Height = 25
    Caption = 'INSERIR'
    TabOrder = 1
    OnClick = Bt_InserirClick
  end
  object Bt_Remover: TButton
    Left = 328
    Top = 206
    Width = 75
    Height = 25
    Caption = 'REMOVER'
    TabOrder = 2
    OnClick = Bt_RemoverClick
  end
  object Bt_Atualizar: TButton
    Left = 327
    Top = 175
    Width = 75
    Height = 25
    Caption = 'ATUALIZAR'
    TabOrder = 3
    OnClick = Bt_AtualizarClick
  end
  object ListBox_Dados: TListBox
    Left = 32
    Top = 144
    Width = 185
    Height = 153
    ItemHeight = 13
    TabOrder = 4
    OnClick = ListBox_DadosClick
  end
  object Ed_artista: TEdit
    Left = 303
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 5
    TextHint = 'Artista da M'#250'sica'
  end
  object Ed_album: TEdit
    Left = 462
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 6
    TextHint = 'Album da M'#250'sica'
  end
  object Bt_Salvar: TButton
    Left = 328
    Top = 237
    Width = 75
    Height = 25
    Caption = 'SALVAR'
    TabOrder = 7
    OnClick = Bt_SalvarClick
  end
  object Bt_Carregar: TButton
    Left = 327
    Top = 268
    Width = 75
    Height = 25
    Caption = 'CARREGAR'
    TabOrder = 8
    OnClick = Bt_CarregarClick
  end
end
