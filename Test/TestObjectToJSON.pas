unit TestObjectToJSON;

interface

uses
  TestFramework, System.SysUtils, Vcl.Graphics, uJSONSerializationWithSynopseForm,
  Winapi.Windows, System.Variants, Soap.InvokeRegistry, Vcl.StdCtrls, Vcl.Dialogs,
  Vcl.Controls, Vcl.Forms, Winapi.Messages, SynCommons, System.Classes, uJSONSerializationTestObjects;

type
  TTestObjectToJSON = class(TTestCase)
  strict private
    FMyPlainTestObj : TMyPlainTestObj;
    FMyPersistentTestObj : TMyPersistentTestObj;
    FMyRemotableTestObj : TMyRemotableTestObj;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestSynopse_ObjectToJSON_WithPlainObjectMustSucceedAndReturnCorrectJSONRepr;
    procedure TestSynopse_ObjectToJSON_WithPersistentObjectMustSucceedAndReturnCorrectJSONRepr;
    procedure TestSynopse_ObjectToJSON_WithRemotableObjectMustSucceedAndReturnCorrectJSONRepr;

    procedure TestAlternate_ObjectToJSON_WithPlainObjectMustSucceedAndReturnCorrectJSONRepr;
    procedure TestAlternate_ObjectToJSON_WithPersistentObjectMustSucceedAndReturnCorrectJSONRepr;
    procedure TestAlternate_ObjectToJSON_WithRemotableObjectMustSucceedAndReturnCorrectJSONRepr;
  end;

implementation

uses REST.JsonReflect, System.JSON
;

procedure TTestObjectToJSON.SetUp;
begin
  FMyPlainTestObj := TMyPlainTestObj.Create;
  FMyPlainTestObj.Name := 'Joe Bloggs';
  FMyPlainTestObj.BirthDate := EncodeDate (1985, 08, 01);
  FMyPlainTestObj.Children := 12;

  FMyPersistentTestObj := TMyPersistentTestObj.Create;
  FMyPersistentTestObj.Name := 'Joe Bloggs';
  FMyPersistentTestObj.BirthDate := EncodeDate (1985, 08, 01);
  FMyPersistentTestObj.Children := 12;

  FMyRemotableTestObj := TMyRemotableTestObj.Create;
  FMyRemotableTestObj.Name := 'Joe Bloggs';
  FMyRemotableTestObj.BirthDate := EncodeDate (1985, 08, 01);
  FMyRemotableTestObj.Children := 12;
end;

procedure TTestObjectToJSON.TearDown;
begin

  FMyPlainTestObj.Free;
  FMyPersistentTestObj.Free;
  FMyRemotableTestObj.Free;
end;

procedure TTestObjectToJSON.TestSynopse_ObjectToJSON_WithPlainObjectMustSucceedAndReturnCorrectJSONRepr;
var json : String;
begin
  //Why is ObjectToJSON returning "null" here? It seems broken.
  //This is similar to the following SO question:
  //https://stackoverflow.com/questions/48847065/automatically-serializing-a-tobject-to-json-using-mormot?rq=1
  //It seems that as of this writing SynCommons.ObjectToJSON() will only convert
  //container like objects, and will return "null" for any other object due to the following lines in SynCommons.pas:
    //51629:
    //    end else
    //    if not(woFullExpand in Options) or
    //       not(Value.InheritsFrom(TList)
    //       {$ifndef LVCL} or Value.InheritsFrom(TCollection){$endif}) then
    //      Value := nil;    //*** This overrides the incoming object to being nil in effectively most cases.
    //  if Value=nil then begin
    //    AddShort('null');
    //    exit;
    //  end;
  json := SynCommons.ObjectToJSON(FMyPlainTestObj);
  CheckEquals('{"birthDate":"1985-08-01T00:00:00.000Z","name":"Joe Bloggs","children":12}', json);
end;

procedure TTestObjectToJSON.TestSynopse_ObjectToJSON_WithPersistentObjectMustSucceedAndReturnCorrectJSONRepr;
var json : String;
begin
  //Why is ObjectToJSON returning "null" here? It seems broken.
  json := SynCommons.ObjectToJSON(FMyPersistentTestObj);
  CheckEquals('{"birthDate":"1985-08-01T00:00:00.000Z","name":"Joe Bloggs","children":12}', json);
end;

procedure TTestObjectToJSON.TestSynopse_ObjectToJSON_WithRemotableObjectMustSucceedAndReturnCorrectJSONRepr;
var json : String;
begin
  //Why is ObjectToJSON returning "null" here? It seems broken.
  json := SynCommons.ObjectToJSON(FMyRemotableTestObj);
  CheckEquals('{"birthDate":"1985-08-01T00:00:00.000Z","name":"Joe Bloggs","children":12,"dataContext":null}', json);
end;

function ObjectToJSON(obj : TObject): String;
//Alternate ObjectToJSON implementation using Delphi provided units, for comparison.
var
  Mar: TJSONMarshal;
  SerializedObj: TJSONObject;
begin
  SerializedObj := nil;
  Mar := TJSONMarshal.Create(TJSONConverter.Create);
  try
    SerializedObj := Mar.Marshal(obj) as TJSONObject;
    result := SerializedObj.ToString;
  finally
    Mar.Free;
    SerializedObj.Free;
  end;
end;

procedure TTestObjectToJSON.TestAlternate_ObjectToJSON_WithPlainObjectMustSucceedAndReturnCorrectJSONRepr;
var json : String;
begin
  //Same test as before, but using the alternate ObjectToJSON implementation.
  json := TestObjectToJSON.ObjectToJSON(FMyPlainTestObj);
  CheckEquals('{"birthDate":"1985-08-01T00:00:00.000Z","name":"Joe Bloggs","children":12}', json);
end;

procedure TTestObjectToJSON.TestAlternate_ObjectToJSON_WithPersistentObjectMustSucceedAndReturnCorrectJSONRepr;
var json : String;
begin
  //Same test as before, but using the alternate ObjectToJSON implementation.
  json := TestObjectToJSON.ObjectToJSON(FMyPersistentTestObj);
  CheckEquals('{"birthDate":"1985-08-01T00:00:00.000Z","name":"Joe Bloggs","children":12}', json);
end;

procedure TTestObjectToJSON.TestAlternate_ObjectToJSON_WithRemotableObjectMustSucceedAndReturnCorrectJSONRepr;
var json : String;
begin
  //Same test as before, but using the alternate ObjectToJSON implementation.
  json := TestObjectToJSON.ObjectToJSON(FMyRemotableTestObj);
  CheckEquals('{"birthDate":"1985-08-01T00:00:00.000Z","name":"Joe Bloggs","children":12,"dataContext":null}', json);
end;


initialization
  // Register any test cases with the test runner
  RegisterTest(TTestObjectToJSON.Suite);
end.

