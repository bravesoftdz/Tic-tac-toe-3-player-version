unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons;

type

  { TGomb }

  TGomb = class(TBitBtn)
    private
    public
      x,y:integer;
  end;

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Megnyom(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

var t:array [-10..10000,-10..10000] of String;
    tobj:array [-10..10000,-10..10000] of TGomb;
    kijon:String;
    i,j:integer; //i=x=vizszintes  j=y=fuggoleges
    holx:integer;
    holy:integer;
    vege:boolean;

{$R *.lfm}

{ TForm1 }

procedure ellenoriz;
var x,y,i,j:integer;
begin
  for i:=holx-4 to holx+4 do begin
    for j:=holy-4 to holy+4 do begin
      //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
      if (t[i,j]='x') and (t[i+1,j]='x') and (t[i+2,j]='x') and (t[i+3,j]='x') then begin      //sor
        ShowMessage('X nyert!');
        vege:=true;
      end;
      if (t[i,j]='x') and (t[i,j+1]='x') and (t[i,j+2]='x') and (t[i,j+3]='x') then begin        //oszlop
        ShowMessage('X nyert!');
        vege:=true;
      end;
      if (t[i,j]='x') and (t[i+1,j+1]='x') and (t[i+2,j+2]='x') and (t[i+3,j+3]='x') then begin     //átlós i+,j+
        ShowMessage('X nyert!');
        vege:=true;
      end;
      if (t[i,j]='x') and (t[i-1,j+1]='x') and (t[i-2,j+2]='x') and (t[i-3,j+3]='x') then begin        //átlós i-,j+
        ShowMessage('X nyert!');
        vege:=true;
      end;
      //ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
      if (t[i,j]='o') and (t[i+1,j]='o') and (t[i+2,j]='o') and (t[i+3,j]='o') then begin      //sor
        ShowMessage('O ');
        vege:=true;
      end;
      if (t[i,j]='o') and (t[i,j+1]='o') and (t[i,j+2]='o') and (t[i,j+3]='o') then begin        //oszlop
        ShowMessage('O nyert!');
        vege:=true;
      end;
      if (t[i,j]='o') and (t[i+1,j+1]='o') and (t[i+2,j+2]='o') and (t[i+3,j+3]='o') then begin     //átlós i+,j+
        ShowMessage('O nyert!');
        vege:=true;
      end;
      if (t[i,j]='o') and (t[i-1,j+1]='o') and (t[i-2,j+2]='o') and (t[i-3,j+3]='o') then begin        //átlós i-,j+
        ShowMessage('O nyert!');
        vege:=true;
      end;
      //vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
      if (t[i,j]='v') and (t[i+1,j]='v') and (t[i+2,j]='v') and (t[i+3,j]='v') then begin      //sor
        ShowMessage('V nyert!');
        vege:=true;
      end;
      if (t[i,j]='v') and (t[i,j+1]='v') and (t[i,j+2]='v') and (t[i,j+3]='v') then begin        //oszlop
        ShowMessage('V nyert!');
        vege:=true;
      end;
      if (t[i,j]='v') and (t[i+1,j+1]='v') and (t[i+2,j+2]='v') and (t[i+3,j+3]='v') then begin     //átlós i+,j+
        ShowMessage('V nyert!');
        vege:=true;
      end;
      if (t[i,j]='v') and (t[i-1,j+1]='v') and (t[i-2,j+2]='v') and (t[i-3,j+3]='v') then begin        //átlós i-,j+
        ShowMessage('V nyert!');
        vege:=true;
      end;
    end;
  end;
end;

procedure TForm1.Megnyom(Sender: TObject);
var x,y:integer;
    gomb:TGomb;
begin
  gomb:=TGomb(Sender);
  x:=gomb.x;
  y:=gomb.y;
  if (t[x,y]='') and (vege=false) then begin
    t[x,y]:=kijon;
    holx:=x;
    holy:=y;
    ellenoriz;
    if kijon='v' then begin
      gomb.Font.Color:=clBlue;
      gomb.font.Size:=12;
      gomb.caption:='v';
      kijon:='x';
      Label1.caption:=kijon;
      exit;
    end;
    if kijon='x' then begin
      gomb.Font.Color:=clGreen;
      gomb.font.Size:=12;
      gomb.caption:='x';
      kijon:='o';
      Label1.caption:=kijon;
      exit;
    end;
    if kijon='o' then begin
      gomb.Font.Color:=clRed;
      gomb.font.Size:=12;
      gomb.caption:='o';
      kijon:='v';
      Label1.caption:=kijon;
      exit;
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  for i:=1 to 25 do
    for j:=1 to 15 do begin
      tobj[i,j].Caption:='';
      t[i,j]:='';
    end;
  vege:=false;
  kijon:='x';
  Label1.caption:=kijon;
end;

procedure TForm1.FormCreate(Sender: TObject);
var x,y:integer;
begin
  Label1.font.size:=30;
  Label1.Font.color:=clBlue;
  vege:=false;
  kijon:='x';
  Label1.caption:=kijon;
  for x:=1 to 25 do
    for y:=1 to 15 do begin
      tobj[x,y]:=TGomb.Create(Form1);
      tobj[x,y].Parent:=Form1;
      tobj[x,y].Width:=40;
      tobj[x,y].Height:=40;
      tobj[x,y].Left:=(x-1)*40;
      tobj[x,y].Top:=(y-1)*40;
      tobj[x,y].caption:='';
      tobj[x,y].x:=x;
      tobj[x,y].y:=y;
      tobj[x,y].onclick:=@megnyom;
    end;
end;


end.

