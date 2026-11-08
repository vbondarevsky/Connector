#Region FormEventHandlers

&AtServer
Procedure OnCreateAtServer(Cancel, StandardProcessing)

	FillTestsList();

EndProcedure

&AtServer
Procedure OnLoadDataFromSettingsAtServer(Settings)

	FillTestsList();

EndProcedure

#EndRegion

#Region FormHeaderItemsEventHandlers

&AtClient
Procedure TestConnectionViaProxyOnChange(Item)
	TestConnectionViaProxyOnChangeAtServer();
EndProcedure

&AtClient
Procedure TestReceivingReleasesListFrom1CSiteOnChange(Item)
	TestReceivingReleasesListFrom1CSiteOnChangeAtServer();
EndProcedure

&AtClient
Procedure TestAuthenticationAWS4_HMAC_SHA256OnChange(Item)
	TestAuthenticationAWS4_HMAC_SHA256OnChangeAtServer();
EndProcedure

&AtClient
Procedure TestRetriesOnChange(Item)
	TestRetriesOnChangeAtServer();
EndProcedure

#EndRegion

#Region FormCommandsEventHandlers

&AtClient
Procedure ExecuteTests(Command)
	
	ExecuteTestsAtServer();
	
EndProcedure

&AtClient
Procedure Check(Command)
	
	For Each TableRow In Tests Do
		TableRow.Use = True;
	EndDo;
	
EndProcedure

&AtClient
Procedure Uncheck(Command)
	
	For Each TableRow In Tests Do
		TableRow.Use = False;
	EndDo;
	
EndProcedure

#EndRegion

#Region Private

&AtServer
Procedure FillTestsList()
	
	Tests.Clear();
	For Each Test In FormAttributeToValue("Object").TestsList() Do
		NewRow = Tests.Add();
		NewRow.Use = True;
		NewRow.Test = Test;
	EndDo;
	TestsNumber = Tests.Count();

EndProcedure

&AtServer
Procedure TestConnectionViaProxyOnChangeAtServer()
	
	FillTestsList();
	
EndProcedure

&AtServer
Procedure TestReceivingReleasesListFrom1CSiteOnChangeAtServer()

	FillTestsList();

EndProcedure

&AtServer
Procedure TestAuthenticationAWS4_HMAC_SHA256OnChangeAtServer()

	FillTestsList();

EndProcedure

&AtServer
Procedure TestRetriesOnChangeAtServer()

	FillTestsList();

EndProcedure

&AtServer
Procedure ExecuteTestsAtServer()
	
	If CheckFilling() Then
		ExecutionResult = FormAttributeToValue("Object").ExecuteTestsAtServer(FormAttributeToValue("Tests"));
		ValueToFormAttribute(ExecutionResult, "Tests");
	EndIf;
	
EndProcedure

#EndRegion
