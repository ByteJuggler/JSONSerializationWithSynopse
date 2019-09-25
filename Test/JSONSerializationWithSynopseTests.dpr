program JSONSerializationWithSynopseTests;

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  DUnitTestRunner,
  TestObjectToJSON in 'TestObjectToJSON.pas',
  uJSONSerializationWithSynopseForm in '..\uJSONSerializationWithSynopseForm.pas' {JSONSerializationWithSynopseForm},
  uJSONSerializationTestObjects in '..\uJSONSerializationTestObjects.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

