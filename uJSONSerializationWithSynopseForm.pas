unit uJSONSerializationWithSynopseForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, SynCommons, Soap.InvokeRegistry;

{$M+}
type
  TJSONSerializationWithSynopseForm = class(TForm)
    SerializeButton: TButton;
    LogMemo: TMemo;
    procedure SerializeButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$M-}

var
  JSONSerializationWithSynopseForm: TJSONSerializationWithSynopseForm;

implementation

uses
  uJSONSerializationTestObjects;

{$R *.dfm}

procedure TJSONSerializationWithSynopseForm.SerializeButtonClick(Sender: TObject);
var
  LTestObj : TMyRemotableTestObj;
  LTestObj2 : TMyPlainTestObj;
  LTestObj3 : TMyPersistentTestObj;
begin
  LTestObj := TMyRemotableTestObj.Create;
  try
    LTestObj.Name := 'Joe Bloggs';
    LTestObj.BirthDate := EncodeDate (1985, 08, 01);
    LTestObj.Children := 12;
    LogMemo.Lines.Add(ObjectToJSON(LTestObj));
  finally
    LTestObj.Free;
  end;

  LTestObj2 := TMyPlainTestObj.Create;
  try
    LTestObj.Name := 'Joe Bloggs';
    LTestObj.BirthDate := EncodeDate (1985, 08, 01);
    LTestObj.Children := 12;
    LogMemo.Lines.Add(ObjectToJSON(LTestObj2));
  finally
    LTestObj2.Free;
  end;

  LTestObj3 := TMyPersistentTestObj.Create;
  try
    LTestObj.Name := 'Joe Bloggs';
    LTestObj.BirthDate := EncodeDate (1985, 08, 01);
    LTestObj.Children := 12;
    LogMemo.Lines.Add(ObjectToJSON(LTestObj3));
  finally
    LTestObj3.Free;
  end;
end;


end.
