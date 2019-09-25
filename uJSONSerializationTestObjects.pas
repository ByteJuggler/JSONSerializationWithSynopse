unit uJSONSerializationTestObjects;

interface

uses
  Soap.InvokeRegistry, System.Classes;

{$M+}
type
  TMyRemotableTestObj = class(TRemotable)
  private
    FBirthDate: TDateTime;
    FName: String;
    FChildren: Integer;
    procedure SetBirthDate(const Value: TDateTime);
    procedure SetChildren(const Value: Integer);
    procedure SetName(const Value: String);
  public
  published
    property Name : String read FName write SetName;
    property BirthDate : TDateTime read FBirthDate write SetBirthDate;
    property Children : Integer read FChildren write SetChildren;
  end;

type
  TMyPlainTestObj = class
  private
    FBirthDate: TDateTime;
    FName: String;
    FChildren: Integer;
    procedure SetBirthDate(const Value: TDateTime);
    procedure SetChildren(const Value: Integer);
    procedure SetName(const Value: String);
  published
    property Name : String read FName write SetName;
    property BirthDate : TDateTime read FBirthDate write SetBirthDate;
    property Children : Integer read FChildren write SetChildren;
  end;

type
  TMyPersistentTestObj = class(TPersistent)
  private
    FBirthDate: TDateTime;
    FName: String;
    FChildren: Integer;
    procedure SetBirthDate(const Value: TDateTime);
    procedure SetChildren(const Value: Integer);
    procedure SetName(const Value: String);
  published
    property Name : String read FName write SetName;
    property BirthDate : TDateTime read FBirthDate write SetBirthDate;
    property Children : Integer read FChildren write SetChildren;
  end;
{$M-}

implementation





{ TMyPersistentTestObj }

procedure TMyPersistentTestObj.SetBirthDate(const Value: TDateTime);
begin
  FBirthDate := Value;
end;

procedure TMyPersistentTestObj.SetChildren(const Value: Integer);
begin
  FChildren := Value;
end;

procedure TMyPersistentTestObj.SetName(const Value: String);
begin
  FName := Value;
end;

{ TMyPlainTestObj }

procedure TMyPlainTestObj.SetBirthDate(const Value: TDateTime);
begin
  FBirthDate := Value;
end;

procedure TMyPlainTestObj.SetChildren(const Value: Integer);
begin
  FChildren := Value;
end;

procedure TMyPlainTestObj.SetName(const Value: String);
begin
  FName := Value;
end;

{ TMyRemotableTestObj }

procedure TMyRemotableTestObj.SetBirthDate(const Value: TDateTime);
begin
  FBirthDate := Value;
end;

procedure TMyRemotableTestObj.SetChildren(const Value: Integer);
begin
  FChildren := Value;
end;

procedure TMyRemotableTestObj.SetName(const Value: String);
begin
  FName := Value;
end;

end.
