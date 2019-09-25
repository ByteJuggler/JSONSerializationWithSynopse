program JSONSerializationWithSynopse;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  uJSONSerializationWithSynopseForm in 'uJSONSerializationWithSynopseForm.pas' {JSONSerializationWithSynopseForm},
  uJSONSerializationTestObjects in 'uJSONSerializationTestObjects.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TJSONSerializationWithSynopseForm, JSONSerializationWithSynopseForm);
  Application.Run;
end.
