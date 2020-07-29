unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormulario = class(TForm)
    Ed_nomemusica: TEdit;
    Bt_Inserir: TButton;
    Bt_Remover: TButton;
    Bt_Atualizar: TButton;
    ListBox_Dados: TListBox;
    Ed_artista: TEdit;
    Ed_album: TEdit;
    Bt_Salvar: TButton;
    Bt_Carregar: TButton;
    Lb_Musicas: TLabel;
    procedure Bt_InserirClick(Sender: TObject);
    procedure Bt_RemoverClick(Sender: TObject);
    procedure Bt_AtualizarClick(Sender: TObject);
    procedure Bt_SalvarClick(Sender: TObject);
    procedure Bt_CarregarClick(Sender: TObject);
    procedure ListBox_DadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
 TMusica = class(TObject)
    Nome:string;
    Artista:string;
    Album:string;
  end;
var
  Formulario: TFormulario;

implementation

{$R *.dfm}

procedure TFormulario.Bt_AtualizarClick(Sender: TObject);
var musica2:TMusica;
var nome, artista, album: string;
begin
  nome:=Ed_nomemusica.Text;
  artista:=Ed_artista.Text;
  album:= Ed_album.Text;

  if (nome.Length<>0) and (artista.Length<>0) and (album.Length<>0)  then
  begin
    musica2 :=ListBox_Dados.Items.Objects[ListBox_Dados.ItemIndex] as TMusica;
    musica2.nome:= nome;
    musica2.artista:= artista;
    musica2.album:= album;
    ListBox_Dados.Items[ListBox_Dados.ItemIndex]:= Ed_nomemusica.Text ;
  end
  else
  begin
    ShowMessage('Campo Vazio!!! Por favor preencha todos os campos :)');
  end;

end;

procedure TFormulario.Bt_RemoverClick(Sender: TObject);
begin
      ListBox_Dados.DeleteSelected;
end;

procedure TFormulario.Bt_CarregarClick(Sender: TObject);
var linha, nome, artista, album: string;
var i:integer;
var arq:TextFile;
var musica2:TMusica;
begin
  AssignFile(arq, 'tabela_das_musicas.txt');
  Reset(arq);
  musica2:=TMusica.Create;
  while (not Eof(arq)) do
  begin
      Readln(arq, linha);


      i:= pos('|', linha);
      nome:= copy(linha, 1, i-1);
      delete(linha, 1, i);

      i:= pos('|', linha);
      artista:= copy(linha, 1, i-1);
      delete(linha, 1, i);

      i:= pos('|', linha);
      album:= copy(linha, 1, i-1);

      musica2.nome:=nome;
      musica2.artista:=artista;
      musica2.album:=album;
      ListBox_Dados.Items.AddObject(musica2.nome, musica2);
  end;
    CloseFile(arq);

end;

procedure TFormulario.Bt_InserirClick(Sender: TObject);
var musica:TMusica;
var nome, artista, album: string;
begin
  nome:=Ed_nomemusica.Text;
  artista:=Ed_artista.Text;
  album:= Ed_album.Text;

  if (nome.Length<>0) and (artista.Length<>0) and (album.Length<>0)  then
  begin
    musica := TMusica.Create;
    musica.nome := nome;
    musica.artista := artista;
    musica.album:= album;

    ListBox_Dados.Items.AddObject(musica.nome, musica);
  end
  else
  begin
    ShowMessage('Campo Vazio!!! Por favor preencha todos os campos :)');
  end;

end;

procedure TFormulario.Bt_SalvarClick(Sender: TObject);
var arq : TextFile;
var musica2:TMusica;
var i: integer;
begin
      if ListBox_Dados.Items.Count<>0 then
      begin
      AssignFile(arq, 'tabela_das_musicas.txt');
      Rewrite(arq);
      for i:=0 to Pred(ListBox_Dados.Items.Count) do
      begin
        musica2:= ListBox_Dados.Items.Objects[i] as TMusica;
        writeln(arq, musica2.nome+'|'+musica2.artista+'|'+musica2.album+'|');
      end;

      CloseFile(arq);
    end
    else
    begin
      ShowMessage('Nenhum item para salvar!');
    end;
end;
procedure TFormulario.ListBox_DadosClick(Sender: TObject);
begin
Bt_Remover.Enabled:=true;
Bt_Atualizar.Enabled:=true;
end;

end.
