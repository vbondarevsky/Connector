// BSLLS-off
#If Server Or ThickClientOrdinaryApplication Or ExternalConnection Then

#Region Public

// Return tests list
//
Function TestsList() Export

	Tests = New Array;
	Tests.Add("Test_ParseURLWithEqualSignInRequestParameterValue");
	Tests.Add("Test_ParseURLWithRequestParameterWithoutValue");
	Tests.Add("Test_ParseURLWithPortDefinedExplicit");
	Tests.Add("Test_ParseURLWithRequestParametersWithSomeValues");
	Tests.Add("Test_ParseURLWithFragment");
	Tests.Add("Test_ParseURLWithHostInIPv6Format");
	Tests.Add("Test_ParseSimpleURL");
	Tests.Add("Test_ParseURLWithEncodedURLInParameter");
	Tests.Add("Test_ParseURLWithUsernameAndPassword");
	Tests.Add("Test_ParseURLWithUsernameWithoutPassword");
	
	Tests.Add("Test_HMAC");
	
	If TestConnectionViaProxy Then
		Tests.Add("Test_ConnectionViaProxy");
	EndIf;
	If TestReceivingReleasesListFrom1CSite Then
		Tests.Add("Test_ReceivingReleasesListFrom1CSite");
	EndIf;
	Tests.Add("Тест_JsonWritingSettings");
	Tests.Add("Test_URLWithoutScheme");
	Tests.Add("Test_TransferParametersToRequestString");
	Tests.Add("Test_TransferParametersToRequestStringCombined");
	Tests.Add("Test_ResultAsJsonGet");
	Tests.Add("Test_ResultAsJsonPost");
	Tests.Add("Test_ResultAsBinaryData");
	Tests.Add("Test_ResultAsText");
	Tests.Add("Test_TransferArbitraryHeaders");
	Tests.Add("Test_FormDataSending");
	Tests.Add("Test_JsonSending");
	Tests.Add("Test_Timeout");
	Tests.Add("Test_BasicAuth");
	Tests.Add("Test_DigestAuth");
#If Not MobileAppServer Then
	Tests.Add("Test_SendGZip");
	Tests.Add("Test_ReceiveGZip");
	Tests.Add("Test_PackGZip");
	Tests.Add("Test_UnpackGZip");
#EndIf
	Tests.Add("Test_GetJson");
	Tests.Add("Test_PostJson");
	Tests.Add("Test_PostAndRedirect");
	Tests.Add("Тест_GetJsonСтруктура");
	Tests.Add("Test_PutJson");
	Tests.Add("Test_DeleteJson");
	Tests.Add("Test_GetSuccessfullRedirectRelativeAddress");
	Tests.Add("Test_GetSuccessfullRedirectAbsoluteAddress");
	Tests.Add("Test_GetLoopedRedirect");
	Tests.Add("Test_GetRedirectIsOff");
	Tests.Add("Test_RedirectWithURLDefining");
	Tests.Add("Test_Error404");
	Tests.Add("Test_WorkingWithSessions");
	Tests.Add("Test_Options");
	Tests.Add("Test_Head");
	Tests.Add("Test_Delete");
	Tests.Add("Test_Patch");
	Tests.Add("Test_ArbitraryMethod");
	Tests.Add("Test_SetCookies");
	Tests.Add("Test_SendCookies");
	Tests.Add("Тест_POST_MultipartFormData_FileOnly");
	Tests.Add("Тест_POST_MultipartFormData_FilesAndFormFields");
	Tests.Add("Test_POST_MultipartFormData_FilesAndFornFields_ParametersConstructor");
	Tests.Add("Test_RequestParametersKeyOnly");
	Tests.Add("Test_XmlSending");
	Tests.Add("Test_ReadResponseAsXDTO");
	Tests.Add("Test_ComplexRequestParameters");
	Tests.Add("Test_PostEmptyJson");
	If TestAuthentificationAWS4_HMAC_SHA256 Then
		Tests.Add("Тест_AuthentificationAWS4_HMAC_SHA256");
	EndIf;
	
	Tests.Add("Test_AuthentificationAWS4_HMAC_SHA256_EmptyBodyPortNotDefined");
	Tests.Add("Test_AuthentificationAWS4_HMAC_SHA256_EmptyBodyStandardPort");
	Tests.Add("Test_AuthentificationAWS4_HMAC_SHA256_EmptyBodyNonStandardPort");
	
	If TestRetries Then
		Tests.Add("Test_RetryBasedOnHeaderRetryAfterDate");
		Tests.Add("Test_RetryBasedOnHeaderRetryAfterDuration");
		Tests.Add("Test_RetryAfterError502");
		Tests.Add("Test_RetryAfterConnectionError");
		Tests.Add("Test_Ping");
	EndIf;

	Tests.Add("Test_HTTPStatusCodePresentation");
	Tests.Add("Test_UnknownHTTPStatusCodePresentation");
	Tests.Add("Test_CorrectExceptionInMethodAsJson");
	Tests.Add("Test_VerifyConversionToJsonNotSerializedValues");
	Tests.Add("Test_VerifyConversionJSONDateWritingVariant");
	Tests.Add("Test_VerifyOfRestoringUnsupportedValuesTypes");

	Tests.Add("Test_RequestSendingCorruptsPassedSettings_GitHub_Issue_33");

	Return Tests;
	
EndFunction

// Run test cases
//
Function ExecuteTestsAtServer(Tests) Export

	For Each TableRow In Tests Do
		If Not TableRow.Use Then
			Continue;
		EndIf;
		
		Try
			Execute(TableRow.Test + "()");
			TableRow.Result = 
				NStr("ru = 'OK';
					|en = 'OK';");
			TableRow.Error = "";
		Except
			TableRow.Result =
				NStr("ru = 'FAIL';
					|en = 'FAIL';");
			TableRow.Error = DetailErrorDescription(ErrorInfo());
		EndTry;
	EndDo;
	
	Return Tests;
	
EndFunction

#EndRegion

#Region Private

#Region Tests

Procedure Test_ParseURLWithEqualSignInRequestParameterValue() Export
	
	URLComposition = HTTPConnector.ParseURL(
		"https://httpbin.org/anything?jql=worklogDate >= 2017-04-01 AND worklogDate <= 2017-05-01&j&i=2"); //@non-nls-1
	
	AssertEquals(URLComposition.Scheme, "https"); //@non-nls-1
	AssertEquals(URLComposition.Host, "httpbin.org"); //@non-nls-1
	AssertEquals(URLComposition.Path, "/anything"); //@non-nls-1
	AssertEquals(URLComposition.Port, 0);
	AssertEquals(URLComposition.Fragment, "");
	AssertEquals(URLComposition.Authentication.User, "");
	AssertEquals(URLComposition.Authentication.Password, "");
	AssertEquals(URLComposition.RequestParameters["jql"], "worklogDate >= 2017-04-01 AND worklogDate <= 2017-05-01"); //@non-nls-1 //@non-nls-2
	AssertEquals(URLComposition.RequestParameters["j"], Undefined); //@non-nls-1
	AssertEquals(URLComposition.RequestParameters["i"], "2"); //@non-nls-1
	
EndProcedure

Procedure Test_ParseURLWithRequestParameterWithoutValue() Export
	
	URLComposition = HTTPConnector.ParseURL("https://httpbin.org/get?key"); //@non-nls-1
	
	AssertEquals(URLComposition.Scheme, "https"); //@non-nls-1
	AssertEquals(URLComposition.Host, "httpbin.org"); //@non-nls-1
	AssertEquals(URLComposition.Path, "/get"); //@non-nls-1
	AssertEquals(URLComposition.Port, 0);
	AssertEquals(URLComposition.Fragment, "");
	AssertEquals(URLComposition.Authentication.User, "");
	AssertEquals(URLComposition.Authentication.Password, "");
	AssertEquals(URLComposition.RequestParameters["key"], Undefined); //@non-nls-1
	
EndProcedure

Procedure Test_ParseURLWithPortDefinedExplicit() Export
	
	URLComposition = HTTPConnector.ParseURL("https://httpbin.org:443/get?key"); //@non-nls-1
	
	AssertEquals(URLComposition.Scheme, "https"); //@non-nls-1
	AssertEquals(URLComposition.Host, "httpbin.org"); //@non-nls-1
	AssertEquals(URLComposition.Path, "/get"); //@non-nls-1
	AssertEquals(URLComposition.Port, 443);
	AssertEquals(URLComposition.Fragment, "");
	AssertEquals(URLComposition.Authentication.User, "");
	AssertEquals(URLComposition.Authentication.Password, "");
	AssertEquals(URLComposition.RequestParameters["key"], Undefined); //@non-nls-1
	
EndProcedure

Procedure Test_ParseURLWithRequestParametersWithSomeValues() Export
	
	URLComposition = HTTPConnector.ParseURL("http://httpbin.org/anything?i=v1&j=w1&j=w2&i=v2&i=v3"); //@non-nls-1
	
	AssertEquals(URLComposition.Scheme, "http"); //@non-nls-1
	AssertEquals(URLComposition.Host, "httpbin.org"); //@non-nls-1
	AssertEquals(URLComposition.Path, "/anything"); //@non-nls-1
	AssertEquals(URLComposition.Port, 0);
	AssertEquals(URLComposition.Fragment, "");
	AssertEquals(URLComposition.Authentication.User, "");
	AssertEquals(URLComposition.Authentication.Password, "");
	AssertEquals(StrConcat(URLComposition.RequestParameters["i"], ", "), "v1, v2, v3"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(StrConcat(URLComposition.RequestParameters["j"], ", "), "w1, w2"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	
EndProcedure

Procedure Test_ParseURLWithFragment() Export
	
	URLComposition = HTTPConnector.ParseURL("https://en.wikipedia.org/wiki/1C_Company#Products"); //@non-nls-1
	
	AssertEquals(URLComposition.Scheme, "https"); //@non-nls-1
	AssertEquals(URLComposition.Host, "en.wikipedia.org"); //@non-nls-1
	AssertEquals(URLComposition.Path, "/wiki/1C_Company"); //@non-nls-1
	AssertEquals(URLComposition.Port, 0);
	AssertEquals(URLComposition.Fragment, "Products"); //@non-nls-1
	AssertEquals(URLComposition.Authentication.User, "");
	AssertEquals(URLComposition.Authentication.Password, "");
	AssertEquals(URLComposition.RequestParameters.Count(), 0);
	
EndProcedure

Procedure Test_ParseURLWithHostInIPv6Format() Export
	
	URLComposition = HTTPConnector.ParseURL("http://[2001:0db8:11a3:09d7:1f34:8a2e:07a0:765d]:8080/test"); //@non-nls-1
	
	AssertEquals(URLComposition.Scheme, "http"); //@non-nls-1
	AssertEquals(URLComposition.Host, "[2001:0db8:11a3:09d7:1f34:8a2e:07a0:765d]"); //@non-nls-1
	AssertEquals(URLComposition.Path, "/test"); //@non-nls-1
	AssertEquals(URLComposition.Port, 8080);
	AssertEquals(URLComposition.Fragment, "");
	AssertEquals(URLComposition.Authentication.User, "");
	AssertEquals(URLComposition.Authentication.Password, "");
	AssertEquals(URLComposition.RequestParameters.Count(), 0);
	
EndProcedure

Procedure Test_ParseSimpleURL() Export
	
	URLComposition = HTTPConnector.ParseURL("http://1c.ru"); //@non-nls-1
	
	AssertEquals(URLComposition.Scheme, "http"); //@non-nls-1
	AssertEquals(URLComposition.Host, "1c.ru"); //@non-nls-1
	AssertEquals(URLComposition.Path, "/");
	AssertEquals(URLComposition.Port, 0);
	AssertEquals(URLComposition.Fragment, "");
	AssertEquals(URLComposition.Authentication.User, "");
	AssertEquals(URLComposition.Authentication.Password, "");
	AssertEquals(URLComposition.RequestParameters.Count(), 0);
	
EndProcedure

Procedure Test_ParseURLWithEncodedURLInParameter() Export
	
	URLComposition = HTTPConnector.ParseURL(
		"https://www.example.ru?url=http%3A%2F%2Fwww.kuku.ru%2F%3Fs%3D1%26b%3D2&OTHER=1"); //@non-nls-1
	
	AssertEquals(URLComposition.Scheme, "https"); //@non-nls-1
	AssertEquals(URLComposition.Host, "www.example.ru"); //@non-nls-1
	AssertEquals(URLComposition.Path, "/");
	AssertEquals(URLComposition.Port, 0);
	AssertEquals(URLComposition.Fragment, "");
	AssertEquals(URLComposition.Authentication.User, "");
	AssertEquals(URLComposition.Authentication.Password, "");
	AssertEquals(URLComposition.RequestParameters.Count(), 2);
	AssertEquals(URLComposition.RequestParameters["url"], "http://www.kuku.ru/?s=1&b=2"); //@non-nls-1 //@non-nls-2
	AssertEquals(URLComposition.RequestParameters["OTHER"], "1"); //@non-nls-1
	
EndProcedure

Procedure Test_ParseURLWithUsernameAndPassword() Export

	URLComposition = HTTPConnector.ParseURL("http://user:pass@1c.ru"); //@non-nls-1

	AssertEquals(URLComposition.Scheme, "http"); //@non-nls-1
	AssertEquals(URLComposition.Host, "1c.ru"); //@non-nls-1
	AssertEquals(URLComposition.Path, "/");
	AssertEquals(URLComposition.Port, 0);
	AssertEquals(URLComposition.Fragment, "");
	AssertEquals(URLComposition.Authentication.User, "user"); //@non-nls-1
	AssertEquals(URLComposition.Authentication.Password, "pass"); //@non-nls-1
	AssertEquals(URLComposition.RequestParameters.Count(), 0);

EndProcedure

Procedure Test_ParseURLWithUsernameWithoutPassword() Export

	URLComposition = HTTPConnector.ParseURL("http://user@1c.ru"); //@non-nls-1

	AssertEquals(URLComposition.Scheme, "http"); //@non-nls-1
	AssertEquals(URLComposition.Host, "1c.ru"); //@non-nls-1
	AssertEquals(URLComposition.Path, "/");
	AssertEquals(URLComposition.Port, 0);
	AssertEquals(URLComposition.Fragment, "");
	AssertEquals(URLComposition.Authentication.User, "user"); //@non-nls-1
	AssertEquals(URLComposition.Authentication.Password, "");
	AssertEquals(URLComposition.RequestParameters.Count(), 0);

EndProcedure

Procedure Test_HMAC() Export
	
	Var_Key = GetBinaryDataFromString("Секретный ключ", TextEncoding.UTF8, False); //@non-nls-1
	KeyGreaterThan64 = GetBinaryDataFromString(
		"1234567890123456789012345678901234567890123456789012345678901234567890", TextEncoding.UTF8, False); //@non-nls-1
	
	EmptyData = GetBinaryDataFromString("", TextEncoding.UTF8, False);
	Data = GetBinaryDataFromString("Какие-то данные", TextEncoding.UTF8, False); //@non-nls-1
	
	AssertEquals(
		HTTPConnector.HMAC(Var_Key, EmptyData, HashFunction.MD5), 
		GetBinaryDataFromHexString("1b1ec4166a11c03b3afefaea442e7709")); //@non-nls-1
	AssertEquals(
		HTTPConnector.HMAC(KeyGreaterThan64, Data, HashFunction.MD5), 
		GetBinaryDataFromHexString("ed5b2d6b9f573cd46e8f8d1d1e8b70e3")); //@non-nls-1
		
	AssertEquals(
		HTTPConnector.HMAC(Var_Key, EmptyData, HashFunction.SHA1), 
		GetBinaryDataFromHexString("355aa0587050d711f4ca9af6930c736363a88d34")); //@non-nls-1
	AssertEquals(
		HTTPConnector.HMAC(KeyGreaterThan64, Data, HashFunction.SHA1), 
		GetBinaryDataFromHexString("7e8f9d7ebbe81e508a39f410e157fc6e714b3371")); //@non-nls-1
		
	AssertEquals(
		HTTPConnector.HMAC(Var_Key, EmptyData, HashFunction.SHA256),
		GetBinaryDataFromHexString("70907d03476d72b7276897718590a49f6ce56991112fb5a0e9ed41652b2aab6c")); //@non-nls-1
	AssertEquals(
		HTTPConnector.HMAC(KeyGreaterThan64, Data, HashFunction.SHA256),
		GetBinaryDataFromHexString("80be8107de7879f028c8bfe97e10b859785530dd19dfc41a4d6962ce4c2fc130")); //@non-nls-1

EndProcedure

Procedure Test_ConnectionViaProxy() Export
	
	Proxy = New InternetProxy;
	Proxy.Set("http", ProxyHost, ProxyPort); //@non-nls-1
	HTTPConnector.GetJson(
		"http://httpbin.org/headers", //@non-nls-1
		Undefined,
		New Structure("Proxy", Proxy)
	);

EndProcedure

Procedure Тест_JsonWritingSettings() Export
	
	JSONWriterSettings = New Structure("NewLines", JSONLineBreak.None);
	Json = New Structure;
	Json.Insert("field", "value"); //@non-nls-1 //@non-nls-2
	Json.Insert("field2", "value2"); //@non-nls-1 //@non-nls-2
	Result = HTTPConnector.PostJson(
		"http://httpbin.org/anything", //@non-nls-1
		Json,
		New Structure("JSONWriterSettings", JSONWriterSettings)
	);
	AssertEquals(Result["data"], "{""field"":""value"",""field2"":""value2""}"); //@non-nls-1 //@non-nls-2
	
EndProcedure

Procedure Test_URLWithoutScheme() Export
	
	Response = HTTPConnector.Get("httpbin.org/get"); //@non-nls-1
	HTTPConnector.AsJson(Response);
 	AssertEquals(Response.URL, "http://httpbin.org/get"); //@non-nls-1
	
EndProcedure

Procedure Test_TransferParametersToRequestString() Export
	
	RequestParameters = New Structure;
	RequestParameters.Insert("name", StrSplit("Иванов,Петров", ",")); //@non-nls-1 //@non-nls-2
	RequestParameters.Insert("salary", Format(100000, "NG=")); //@non-nls-1
	RequestParameters.Insert("time", "01:47"); //@non-nls-1
	
	Response = HTTPConnector.Get("https://httpbin.org/anything/params", RequestParameters);//@non-nls-1
	Result = HTTPConnector.AsJson(Response);
	
	AssertEquals(Response.URL, "https://httpbin.org/anything/params?name=%D0%98%D0%B2%D0%B0%D0%BD%D0%BE%D0%B2&name=%D0%9F%D0%B5%D1%82%D1%80%D0%BE%D0%B2&salary=100000&time=01%3A47"); //@non-nls-1
	AssertEquals(Result["url"], "https://httpbin.org/anything/params?name=Иванов&name=Петров&salary=100000&time=01%3A47"); //@non-nls-1 //@non-nls-2
	AssertEquals(Result["args"]["salary"], "100000"); //@non-nls-1 //@non-nls-2
	AssertEquals(StrConcat(Result["args"]["name"], ","), "Иванов,Петров"); //@non-nls-1 //@non-nls-2 //@non-nls-4
	AssertEquals(Result["args"]["time"], "01:47"); //@non-nls-1 //@non-nls-2
	
EndProcedure

Procedure Test_TransferParametersToRequestStringCombined() Export
	
	RequestParameters = New Structure;
	RequestParameters.Insert("name", StrSplit("Иванов,Петров", ",")); //@non-nls-1 //@non-nls-2
	RequestParameters.Insert("salary", Format(100000, "NG=")); //@non-nls-1
	
	Result = HTTPConnector.GetJson("https://httpbin.org/anything/params?post=Программист", RequestParameters); //@non-nls-1
	
	AssertEquals(Result["args"]["salary"], "100000"); //@non-nls-1 //@non-nls-2
	AssertEquals(Result["args"]["post"], "Программист"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(StrConcat(Result["args"]["name"], ","), "Иванов,Петров"); //@non-nls-1 //@non-nls-2 //@non-nls-4
	
EndProcedure

Procedure Test_ResultAsJsonGet() Export
	
	Result = HTTPConnector.GetJson("https://httpbin.org/get"); //@non-nls-1
	AssertEquals(Result["url"], "https://httpbin.org/get"); //@non-nls-1 //@non-nls-2
	
EndProcedure

Procedure Test_ResultAsJsonPost() Export
	
	Result = HTTPConnector.AsJson(HTTPConnector.Post("https://httpbin.org/post")); //@non-nls-1
	AssertEquals(Result["url"], "https://httpbin.org/post"); //@non-nls-1 //@non-nls-2
	
EndProcedure

Procedure Test_ResultAsBinaryData() Export
	
	Result = HTTPConnector.AsBinaryData(HTTPConnector.Get("http://httpbin.org/image/png")); //@non-nls-1
	
	AssertEquals(TypeOf(Result), Type("BinaryData"));
	AssertEquals(CalculateMD5(Result), "5cca6069f68fbf739fce37e0963f21e7"); //@non-nls-1
	
EndProcedure

Procedure Test_ResultAsText() Export
	
	Result = HTTPConnector.AsText(HTTPConnector.Get("http://httpbin.org/encoding/utf8")); //@non-nls-1
	AssertEquals(StrFind(Result, "Зарегистрируйтесь сейчас на Десятую Международную"), 3931); //@non-nls-1
	
EndProcedure

Procedure Test_TransferArbitraryHeaders() Export
	
	Headers = New Map;
	Headers.Insert("X-My-Header", "Hello"); //@non-nls-1 //@non-nls-2
	Result = HTTPConnector.GetJson(
		"http://httpbin.org/headers", //@non-nls-1
		Undefined,
		New Structure("Headers", Headers)
	);
	
	AssertEquals(Result["headers"]["X-My-Header"], "Hello"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	
EndProcedure

Procedure Test_FormDataSending() Export
	
	Data = New Structure;
	Data.Insert("comments", "Постучать в дверь"); //@non-nls-1 //@non-nls-2
	Data.Insert("custemail", "vasya@mail.ru"); //@non-nls-1 //@non-nls-2
	Data.Insert("custname", "Вася"); //@non-nls-1 //@non-nls-2
	Data.Insert("custtel", "112"); //@non-nls-1
	Data.Insert("delivery", "20:20"); //@non-nls-1
	Data.Insert("size", "medium"); //@non-nls-1 //@non-nls-2
	Data.Insert("topping", StrSplit("bacon,mushroom", ",")); //@non-nls-1 //@non-nls-2
	
	Response = HTTPConnector.Post("http://httpbin.org/post", Data); //@non-nls-1
	AssertEquals(Response.URL, "http://httpbin.org/post"); //@non-nls-1
	Result = HTTPConnector.AsJson(Response);
	AssertEquals(Result["form"]["size"], "medium"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(Result["form"]["comments"], "Постучать в дверь"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(Result["form"]["custemail"], "vasya@mail.ru"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(Result["form"]["delivery"], "20:20"); //@non-nls-1 //@non-nls-2
	AssertEquals(Result["form"]["custtel"], "112");	//@non-nls-1 //@non-nls-2
	
EndProcedure

Procedure Test_JsonSending() Export
	
	Json = New Structure;
	Json.Insert("Сотрудник", "Иванов Иван Петрович"); //@non-nls-1 //@non-nls-2
	Json.Insert("Должность", "Разнорабочий"); //@non-nls-1 //@non-nls-2
	
	Result = HTTPConnector.PostJson("http://httpbin.org/post", Json); //@non-nls-1
	
	AssertEquals(Result["json"]["Сотрудник"], "Иванов Иван Петрович"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(Result["json"]["Должность"], "Разнорабочий"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	
	Result = HTTPConnector.PutJson("http://httpbin.org/put", Json); //@non-nls-1
	AssertEquals(Result["json"]["Сотрудник"], "Иванов Иван Петрович"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(Result["json"]["Должность"], "Разнорабочий"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	
EndProcedure

Procedure Test_Timeout() Export
	
	Try
		HTTPConnector.Get(
			"https://httpbin.org/delay/10", //@non-nls-1
			Undefined,
			New Structure("Timeout", 1)
		);
	Except
		ExceptionIsCorrect(
			ErrorInfo(),
			StrSplit("Превышено время ожидания|Timeout exceeded", "|") //@non-nls-1
		);
	EndTry;
	
EndProcedure

Procedure Test_ReceiveGZip() Export
	
	Result = HTTPConnector.GetJson("http://httpbin.org/gzip"); //@non-nls-1
	AssertEquals(Result["gzipped"], True); //@non-nls-1
	
EndProcedure

Procedure Test_SendGZip() Export
	
	Json = New Structure;
	Json.Insert("field", "value"); //@non-nls-1 //@non-nls-2
	Json.Insert("field2", "value2"); //@non-nls-1 //@non-nls-2
	Headers = New Map;
	Headers.Insert("Content-Encoding", "gzip"); //@non-nls-1 //@non-nls-2
	Result = HTTPConnector.PostJson(
		"http://httpbin.org/anything", //@non-nls-1
		Json,
		New Structure("Headers", Headers)
	);
	
	DataWriter = GetBinaryDataFromBase64String(
		StrSplit(Result["data"], ",")[1] //@non-nls-1
	);
	InitialValue = HTTPConnector.JsonToObject(HTTPConnector.ReadGZip(DataWriter));
	
	AssertEquals(Result["headers"]["Content-Encoding"], "gzip"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(InitialValue["field"], Json["field"]); //@non-nls-1 //@non-nls-2
	AssertEquals(InitialValue["field2"], Json["field2"]); //@non-nls-1 //@non-nls-2
	
EndProcedure

Procedure Test_BasicAuth() Export
	
	Result = HTTPConnector.GetJson("https://user:pass@httpbin.org/basic-auth/user/pass"); //@non-nls-1
	AssertEquals(Result["authenticated"], True); //@non-nls-1
	AssertEquals(Result["user"], "user"); //@non-nls-1 //@non-nls-2

	Authentication = HTTPConnector.NewAuthenticationBasic();
	Authentication.User = "user"; //@non-nls-1
	Authentication.Password = "pass"; //@non-nls-1
	
	Result = HTTPConnector.GetJson(
		"https://httpbin.org/basic-auth/user/pass", //@non-nls-1
		Undefined,
		New Structure("Authentication", Authentication));
	AssertEquals(Result["authenticated"], True); //@non-nls-1
	AssertEquals(Result["user"], "user"); //@non-nls-1 //@non-nls-2

	Authentication = New Structure("User, Password, Type");
	Authentication.Type = "Basic"; //@non-nls-1
	Authentication.User = "user"; //@non-nls-1
	Authentication.Password = "pass"; //@non-nls-1
	
	Result = HTTPConnector.GetJson(
		"https://httpbin.org/basic-auth/user/pass", //@non-nls-1
		Undefined,
		New Structure("Authentication", Authentication));
	AssertEquals(Result["authenticated"], True); //@non-nls-1
	AssertEquals(Result["user"], "user"); //@non-nls-1 //@non-nls-2
	
EndProcedure

Procedure Test_DigestAuth() Export
	
	Authentication = HTTPConnector.NewAuthenticationDigest();
	Authentication.User = "user"; //@non-nls-1
	Authentication.Password = "pass"; //@non-nls-1
	
	Result = HTTPConnector.GetJson(
		"https://httpbin.org/digest-auth/auth/user/pass", //@non-nls-1
		Undefined,
		New Structure("Authentication", Authentication)
	);
	AssertEquals(Result["authenticated"], True); //@non-nls-1
	AssertEquals(Result["user"], "user"); //@non-nls-1 //@non-nls-2
	
	Authentication = HTTPConnector.NewAuthenticationDigest();
	Authentication.User = "guest"; //@non-nls-1
	Authentication.Password = "guest"; //@non-nls-1
	
	Result = HTTPConnector.Get(
		"https://jigsaw.w3.org/HTTP/Digest/", //@non-nls-1
		Undefined,
		New Structure("Authentication", Authentication));
	AssertEquals(Result.StatusCode, 200);
	
EndProcedure

Procedure Test_GetJson() Export
	
	Result = HTTPConnector.GetJson("https://httpbin.org/get"); //@non-nls-1
	AssertEquals(Result["url"], "https://httpbin.org/get"); //@non-nls-1 //@non-nls-2
	
EndProcedure

Procedure Тест_GetJsonСтруктура() Export
	
	JSONConversionParameters = New Structure("ReadToMap", False);
	Result = HTTPConnector.GetJson(
		"http://httpbin.org/json", //@non-nls-1
		Undefined,
		New Structure("JSONConversionParameters", JSONConversionParameters)
	);
	AssertEquals(Result.slideshow.author, "Yours Truly"); //@non-nls-1
	AssertEquals(Result.slideshow.date, "date of publication"); //@non-nls-1
	AssertEquals(Result.slideshow.slides.Count(), 2); //@non-nls-1
	AssertEquals(Result.slideshow.title, "Sample Slide Show"); //@non-nls-1
	
EndProcedure

Procedure Test_PostJson() Export
	
	JSONConversionParameters = New Structure;
	JSONConversionParameters.Insert("PropertiesNamesWithDateValues", "Дата"); //@non-nls-2
	
	Json = New Structure;
	Json.Insert("Дата", '20190121002400'); //@non-nls-1
	Json.Insert("Число", 5); //@non-nls-1
	Json.Insert("Булево", True); //@non-nls-1
	Json.Insert("Строка", "Привет"); //@non-nls-1 //@non-nls-2
		
	Result = HTTPConnector.PostJson(
		"https://httpbin.org/post", //@non-nls-1
		Json, 
		New Structure("JSONConversionParameters", JSONConversionParameters)
	);
	AssertEquals(Result["url"], "https://httpbin.org/post"); //@non-nls-1 //@non-nls-2
	AssertEquals(Result["json"]["Дата"], '20190121002400'); //@non-nls-1 //@non-nls-2
	AssertEquals(Result["json"]["Число"], 5); //@non-nls-1 //@non-nls-2
	AssertEquals(Result["json"]["Булево"], True); //@non-nls-1 //@non-nls-2
	AssertEquals(Result["json"]["Строка"], "Привет"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	
EndProcedure

Procedure Test_VerifyConversionJSONDateWritingVariant() Export

	UniversalCheckDate = CurrentUniversalDate();
	LocalCheckDate = ToLocalTime(UniversalCheckDate, TimeZone());
	Json = New Structure;
	Json.Insert("Дата", LocalCheckDate); //@non-nls-1

	JSONParameters = New Structure;
	JSONParameters.Insert("JSONDateWritingVariant", PredefinedValue("JSONDateWritingVariant.UniversalDate"));

	Result = HTTPConnector.PostJson(
		"https://httpbin.org/post", //@non-nls-1
		Json,
		New Structure("JSONConversionParameters", JSONParameters)
	);

	AssertEquals(
		Result["json"]["Дата"], //@non-nls-1 //@non-nls-2
		Format(UniversalCheckDate, "ДФ=yyyy-MM-ddTHH:mm:ssZ")
	);

EndProcedure

Procedure Test_VerifyConversionToJsonNotSerializedValues() Export

	Json = New Structure;
	Json.Insert("УникальныйИдентификатор", New UUID("be4ee795-7f5e-4d1a-be43-a6d6902f5cfd")); //@non-nls-1
	Json.Insert("ДвоичныеДанные", GetBinaryDataFromString("test", "utf-8", False)); //@non-nls-1 //@non-nls-2

	JSONParameters = New Structure;
	JSONParameters.Insert("ConvertionFunctionName", "JsonConversion");
	JSONParameters.Insert("ConvertionFunctionModule", HTTPConnector);

	Result = HTTPConnector.PostJson(
		"https://httpbin.org/post", //@non-nls-1
		Json,
		New Structure("JSONConversionParameters", JSONParameters));

	AssertEquals(Result["json"]["УникальныйИдентификатор"], "be4ee795-7f5e-4d1a-be43-a6d6902f5cfd"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(Result["json"]["ДвоичныеДанные"], "dGVzdA=="); //@non-nls-1 //@non-nls-2 //@non-nls-3

EndProcedure

Procedure Test_VerifyOfRestoringUnsupportedValuesTypes() Export

	UUID = New UUID("be4ee795-7f5e-4d1a-be43-a6d6902f5cfd"); //@non-nls-1
	BinaryData = GetBinaryDataFromString("test", "utf-8", False); //@non-nls-1 //@non-nls-2

	Json = New Structure;
	Json.Insert("УникальныйИдентификатор", String(UUID)); //@non-nls-1
	Json.Insert("ДвоичныеДанные", GetBase64StringFromBinaryData(BinaryData)); //@non-nls-1
	Json.Insert("ДругиеДанные", 1); //@non-nls-1

	JSONParameters = New Structure;
	JSONParameters.Insert("ReviverFunctionModule", HTTPConnector);
	JSONParameters.Insert("ReviverFunctionName", "RestoreJson");
	PropertiesTypes = New Map;
	PropertiesTypes.Insert("UUID", Type("UUID"));
	PropertiesTypes.Insert("BinaryData", Type("BinaryData"));
	JSONParameters.Insert("ReviverFunctionAdditionalParameters", PropertiesTypes);
	JSONParameters.Insert("RetriverPropertiesNames", StrSplit("UUID,BinaryData", ","));

	Result = HTTPConnector.PostJson(
		"https://httpbin.org/post", //@non-nls-1
		Json,
		New Structure("JSONConversionParameters", JSONParameters));

	AssertEquals(Result["json"]["УникальныйИдентификатор"], UUID); //@non-nls-1 //@non-nls-2
	AssertEquals(Result["json"]["ДвоичныеДанные"], BinaryData); //@non-nls-1 //@non-nls-2
	AssertEquals(Result["json"]["ДругиеДанные"], 1); //@non-nls-1 //@non-nls-2

EndProcedure

Procedure Test_PostAndRedirect() Export
	
	Response = HTTPConnector.Get("https://httpbin.org/redirect-to?url=https%3A%2F%2Fya.ru&status_code=301"); //@non-nls-1
	AssertEquals(Response.StatusCode, 200);
	
	Response = HTTPConnector.Post("https://httpbin.org/redirect-to?url=https%3A%2F%2Fya.ru&status_code=301"); //@non-nls-1
	AssertEquals(Response.StatusCode, 403);
	
EndProcedure

Procedure Test_PutJson() Export
	
	Result = HTTPConnector.PutJson(
		"https://httpbin.org/put", //@non-nls-1
		New Structure("Название", "КоннекторHTTP") //@non-nls-1 //@non-nls-2
	);
	AssertEquals(Result["url"], "https://httpbin.org/put"); //@non-nls-1 //@non-nls-2
	AssertEquals(Result["json"]["Название"], "КоннекторHTTP"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	
EndProcedure

Procedure Test_DeleteJson() Export
	
	Result = HTTPConnector.DeleteJson(
		"https://httpbin.org/delete", //@non-nls-1
		New Structure("Название", "КоннекторHTTP") //@non-nls-2
	);
	AssertEquals(Result["url"], "https://httpbin.org/delete"); //@non-nls-1 //@non-nls-2
	AssertEquals(Result["json"]["Название"], "КоннекторHTTP"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	
EndProcedure

Procedure Test_GetSuccessfullRedirectRelativeAddress() Export
	
	Response = HTTPConnector.Get("https://httpbin.org/relative-redirect/6"); //@non-nls-1
	Result = HTTPConnector.AsJson(Response);
	
	AssertEquals(Response.StatusCode, 200);
	AssertEquals(Result["url"], "https://httpbin.org/get"); //@non-nls-1 //@non-nls-2
	
EndProcedure

Procedure Test_GetSuccessfullRedirectAbsoluteAddress() Export
	
	Response = HTTPConnector.Get("http://httpbin.org/absolute-redirect/6"); //@non-nls-1
	Result = HTTPConnector.AsJson(Response);
	
	AssertEquals(Response.StatusCode, 200);
	AssertEquals(Result["url"], "http://httpbin.org/get"); //@non-nls-1 //@non-nls-2
	
EndProcedure

Procedure Test_GetLoopedRedirect() Export
	
	Try
		HTTPConnector.AsJson(HTTPConnector.Get("http://httpbin.org/redirect/31")); //@non-nls-1
	Except
		ExceptionIsCorrect(ErrorInfo(), "СлишкомМногоПеренаправлений"); //@non-nls-1
	EndTry;
	
EndProcedure

Procedure Test_GetRedirectIsOff() Export
	
	Parameters = New Structure("AllowRedirect", False);
	Response = HTTPConnector.Get(
		"http://httpbin.org/redirect-to?url=http%3A%2F%2Fhttpbin.org%2Fget&status_code=307", //@non-nls-1
		Undefined,
		Parameters);
	
	AssertEquals(Response.StatusCode, 307);
	
EndProcedure

Procedure Test_RedirectWithURLDefining() Export
	
	RequestParameters = New Structure;
	RequestParameters.Insert("url", "https://httpbin.org:443/anything"); //@non-nls-1 //@non-nls-2
	RequestParameters.Insert("status_code", "307"); //@non-nls-1 //@non-nls-2

	Response = HTTPConnector.Get("http://httpbin.org:80/redirect-to", RequestParameters); //@non-nls-1
	HTTPConnector.AsJson(Response);

	AssertEquals(Response.StatusCode, 200);
	AssertEquals(Response.URL, "https://httpbin.org:443/anything"); //@non-nls-1
	
EndProcedure

Procedure Test_Error404() Export
	
	Response = HTTPConnector.Get("http://httpbin.org/status/404"); //@non-nls-1
	
	AssertEquals(Response.StatusCode, 404);
	
EndProcedure

Procedure Test_WorkingWithSessions() Export
	
	Session = HTTPConnector.NewSession();
	
	HTTPConnector.Get("https://httpbin.org/cookies/set/key/value", Undefined, Undefined, Session); //@non-nls-1
	Result = HTTPConnector.GetJson("https://httpbin.org/cookies", Undefined, Undefined, Session); //@non-nls-1
	
	AssertEquals(Result["cookies"]["key"], "value"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	
EndProcedure

Procedure Test_ReceivingReleasesListFrom1CSite() Export
	
	Session = HTTPConnector.NewSession();
	Response = HTTPConnector.Get("https://releases.1c.ru/total", Undefined, Undefined, Session); //@non-nls-1
	
	Data = New Structure;
	Data.Insert("execution", ExtractExecution(Response)); //@non-nls-1
	Data.Insert("username", Login); //@non-nls-1
	Data.Insert("password", Password); //@non-nls-1
	Data.Insert("_eventId", "submit"); //@non-nls-1 //@non-nls-2
	Data.Insert("geolocation", ""); //@non-nls-1
	Data.Insert("submit", "Войти"); //@non-nls-1 //@non-nls-2
	Data.Insert("rememberMe", "on"); //@non-nls-1 //@non-nls-2
	
	Response = HTTPConnector.Post(Response.URL, Data, Undefined, Session);
	
	AssertEquals(Response.URL, "https://releases.1c.ru/total"); //@non-nls-1
	AssertEquals(Response.StatusCode, 200);
	
EndProcedure

Procedure Test_Options() Export
	
	Response = HTTPConnector.Options("http://httpbin.org/anything"); //@non-nls-1
	
	AssertEquals(Response.StatusCode, 200);
	
EndProcedure

Procedure Test_Head() Export
	
	Response = HTTPConnector.Head("http://httpbin.org/anything"); //@non-nls-1
	
	AssertEquals(Response.StatusCode, 200);
	
EndProcedure

Procedure Test_Delete() Export
	
	Response = HTTPConnector.Delete("http://httpbin.org/delete"); //@non-nls-1
	
	AssertEquals(Response.StatusCode, 200);
	
EndProcedure

Procedure Test_Patch() Export
	
	Response = HTTPConnector.Patch("http://httpbin.org/patch"); //@non-nls-1
	
	AssertEquals(Response.StatusCode, 200);
	
EndProcedure

Procedure Test_ArbitraryMethod() Export
	
	Response = HTTPConnector.CallMethod("PATCH", "http://httpbin.org/patch"); //@non-nls-1 //@non-nls-2
	
	AssertEquals(Response.StatusCode, 200);
	
EndProcedure

Procedure Test_SetCookies() Export
	
	Result = HTTPConnector.GetJson(
		"http://httpbin.org/cookies/set?PHPSESSID=72a68cc1e55&cookie1=1&cookie2=2&other=test"); //@non-nls
	
	AssertEquals(Result["cookies"]["PHPSESSID"], "72a68cc1e55"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(Result["cookies"]["cookie1"], "1"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(Result["cookies"]["cookie2"], "2"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(Result["cookies"]["other"], "test"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	
EndProcedure

Procedure Test_SendCookies() Export
	
	Cookies = New Array;
	Cookies.Add(New Structure("Наименование,Значение", "k1", String(New UUID))); //@non-nls-1 //@non-nls-2
	Cookies.Add(New Structure("Наименование,Значение", "k2", String(New UUID))); //@non-nls-1 //@non-nls-2
	
	Response = HTTPConnector.Get(
		"http://httpbin.org/cookies", //@non-nls-1
		,
		New Structure("Cookies", Cookies)
	);
	Result = HTTPConnector.AsJson(Response);
	
	AssertEquals(Result["cookies"]["k1"], Cookies[0].Value); //@non-nls-1 //@non-nls-2
	AssertEquals(Result["cookies"]["k2"], Cookies[1].Value); //@non-nls-1 //@non-nls-2
	
EndProcedure

Procedure Тест_POST_MultipartFormData_FileOnly() Export
	
	Files = New Structure;
	Files.Insert("Имя", "f1"); //@non-nls-1 //@non-nls-2
	Files.Insert("ИмяФайла", "file1.txt"); //@non-nls-1 //@non-nls-2
	Files.Insert("Данные", Base64Value("0J/RgNC40LLQtdGCLCDQnNC40YA=")); //@non-nls-1 //@non-nls-2
	Files.Insert("Тип", "text/plain"); //@non-nls-1 //@non-nls-2
	
	Result = HTTPConnector.PostJson(
		"https://httpbin.org/post", //@non-nls-1
		Undefined,
		New Structure("Files", Files)
	);
	
	AssertEquals(Result["files"]["f1"], "Привет, Мир"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	
EndProcedure

Procedure Тест_POST_MultipartFormData_FilesAndFormFields() Export
	
	Files = New Array;
	Files.Add(New Structure("Имя,Данные,ИмяФайла", "f1", Base64Value("ZmlsZTE="), "file1.txt")); //@non-nls-1 //@non-nls-2 //@non-nls-3 //@non-nls-4
	Files.Add(New Structure("Имя,Данные,ИмяФайла", "f2", Base64Value("ZmlsZTI="), "file2.txt")); //@non-nls-1 //@non-nls-2 //@non-nls-3 //@non-nls-4
	
	Data = New Structure("field1,field2", "value1", "Значение2"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	
	Result = HTTPConnector.PostJson(
		"https://httpbin.org/post", //@non-nls-1
		Undefined,
		New Structure("Files,Data", Files, Data)
	);
	
	AssertEquals(Result["files"]["f1"], "file1"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(Result["files"]["f2"], "file2"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(Result["form"]["field1"], "value1"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(Result["form"]["field2"], "Значение2"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	
EndProcedure

Procedure Test_POST_MultipartFormData_FilesAndFornFields_ParametersConstructor() Export
	
	AdditionalParameters = HTTPConnector.NewParameters();
	AdditionalParameters.Files.Add(
		HTTPConnector.NewFileToSend("f1", "file1.txt", Base64Value("ZmlsZTE=")) //@non-nls-1 //@non-nls-2 //@non-nls-3
	);
	AdditionalParameters.Files.Add(
		HTTPConnector.NewFileToSend("f2", "file2.txt", Base64Value("ZmlsZTI=")) //@non-nls-1 //@non-nls-2 //@non-nls-3
	);
	AdditionalParameters.Files.Add(
		HTTPConnector.NewFileToSend(
			"f3", //@non-nls-1
			"file3.txt", //@non-nls-1
			Base64Value("Z0J/RgNC40LLQtdGCLCDQnNC40YA="), //@non-nls-1
			"text/plain" //@non-nls-1
		)
	);
	File = HTTPConnector.NewFileToSend("f4", "file4.txt"); //@non-nls-1 //@non-nls-2
	File.Headers.Insert("X-ID", String(New UUID));
	AdditionalParameters.Files.Add(File);
	
	AdditionalParameters.Data = New Structure;
	AdditionalParameters.Data.Insert("field1", "value1"); //@non-nls-1 //@non-nls-2
	AdditionalParameters.Data.Insert("field2", "Значение2"); //@non-nls-1 //@non-nls-2
	
	Result = HTTPConnector.PostJson(
		"https://httpbin.org/post", //@non-nls-1
		Undefined,
		AdditionalParameters
	);
	
	AssertEquals(Result["files"]["f1"], "file1"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(Result["files"]["f2"], "file2"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(Result["files"]["f3"], "data:text/plain;base64,Z0J/RgNC40LLQtdGCLCDQnNC40YA"); // Должно быть "Привет, Мир" //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(Result["files"]["f4"], ""); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(Result["form"]["field1"], "value1"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	AssertEquals(Result["form"]["field2"], "Значение2"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	
EndProcedure

Procedure Test_RequestParametersKeyOnly() Export

	Result = HTTPConnector.GetJson("https://httpbin.org/get?key"); //@non-nls-1
	AssertEquals(Result["args"]["key"], ""); //@non-nls-1 //@non-nls-2
	
EndProcedure

Procedure Test_XmlSending() Export
	
	XML = 
	"<?xml version=""1.0"" encoding=""utf-8""?>
	|<soap:Envelope xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" xmlns:soap=""http://schemas.xmlsoap.org/soap/envelope/"">
	|  <soap:Body>
	|    <GetCursOnDate xmlns=""http://web.cbr.ru/"">
	|      <On_date>2019-07-05</On_date>
	|    </GetCursOnDate>
	|  </soap:Body>
	|</soap:Envelope>"; //@non-nls-1
	
	Headers = New Map;
	Headers.Insert("Content-Type", "text/xml; charset=utf-8"); //@non-nls-1 //@non-nls-2
	Headers.Insert("SOAPAction", "http://web.cbr.ru/GetCursOnDate"); //@non-nls-1 //@non-nls-2
	Response = HTTPConnector.Post(
		"https://www.cbr.ru/DailyInfoWebServ/DailyInfo.asmx", //@non-nls-1
		XML, 
		New Structure("Headers", Headers));
	
	AssertEquals(Response.StatusCode, 200);
	AssertEquals(Response.Headers.Get("Content-Type"), "text/xml; charset=utf-8"); //@non-nls-1 //@non-nls-2
	
EndProcedure

Procedure Test_ReadResponseAsXDTO() Export
	
	TextResponseXML = Test_ReadResponseAsXDTO_ResponseTextXML();
	
	FullFileName = GetTempFileName("xml"); //@non-nls-1
	
	FileText = New TextWriter(FullFileName, TextEncoding.UTF8); 
	FileText.WriteLine(TextResponseXML); 	
	FileText.Close(); 
	
	BinaryDataResponse = New BinaryData(FullFileName);
	DeleteFiles(FullFileName);
	
	Headers = New Map;
	Headers.Insert("Content-Type", "text/xml; charset=utf-8"); //@non-nls-1 //@non-nls-2
	
	PreparedResponse = HTTPConnector.NewResponse();
	PreparedResponse.Body = BinaryDataResponse;
	PreparedResponse.Headers = Headers;
	
	XDTOResponse = HTTPConnector.AsXDTO(PreparedResponse);
	
	XDTOResponse_Attachment = XDTOResponse.Attachments.Attachment;
	
	AssertEquals(TypeOf(XDTOResponse), Type("XDTODataObject"));
	AssertEquals(XDTOResponse.Id, "1642606"); //@non-nls-1
	AssertEquals(TypeOf(XDTOResponse_Attachment), Type("СписокXDTO"));
	AssertEquals(XDTOResponse_Attachment.Count(), 2);		
	
EndProcedure 

Function Test_ReadResponseAsXDTO_ResponseTextXML() 
	
	TextResponseXML = "
	|<Document>
	|<Id>1642606</Id>
	|<TypeId>65</TypeId>
	|<TypeName>Документ</TypeName>
	|<DocumentTypeCode>DOCUMENT</DocumentTypeCode>
	|<Description>Документ тест 00001 от 21.05.2021</Description>
	|<BarcodeType>None</BarcodeType>
	|<SenderId>12776</SenderId>
	|<ReceiverId>48519</ReceiverId>
	|<ParticipantId>12776</ParticipantId>
	|<Status>Received</Status>
	|<Date>2021-05-21T00:00:00</Date>
	|<RequestSign>true</RequestSign>
	|<Number>ТЕСТ 00001</Number>
	|<IsMarked>false</IsMarked>
	|<Created>2021-05-21T10:32:02</Created>
	|<SendDate>2021-05-21T10:32:43</SendDate>
	|<ReceiveDate>2021-05-21T10:32:43</ReceiveDate>
	|<IsDocflowCompleted>false</IsDocflowCompleted>
	|<Comment>ТЕСТ Документ </Comment>
	|<Type>Document</Type>
	|<FormType>Document</FormType>
	|<SellerCode>ИдентификаторЭДООтправитель</SellerCode>
	|<BuyerCode>ИдентификаторЭДОПолучатель</BuyerCode>
	|<Filename>ФайлОсновной.xlsx</Filename>
	|<ContractDescription />
	|<IsRoaming>false</IsRoaming>
	|<IsPrintable>false</IsPrintable>
	|<Relations>
	|    <DocumentRelation>
	|        <Id>1642606</Id>
	|        <Description>Документ №ТЕСТ 00002 от 21.05.2021</Description>
	|    </DocumentRelation>
	|</Relations>
	|<StatusName>Получен</StatusName>
	|<SenderName>ООО Отправитель</SenderName>
	|<ReceiverName>ООО Получатель</ReceiverName>
	|<ExistRouteSigner>false</ExistRouteSigner>
	|<DocumentRelationType>Productive</DocumentRelationType>
	|<Attachments>
	|    <Attachment>
	|        <Id>44624</Id>
	|        <Uuid>8711ca1b76794467ba74529d2bb01e3e</Uuid>
	|        <DocumentId>0</DocumentId>
	|        <Filename>ТестФайл.xlsx</Filename>
	|        <Content />
	|    </Attachment>
	|    <Attachment>
	|        <Id>44625</Id>
	|        <Uuid>f6d8e6cdcbf846f4b97d5ab8e18d1b79</Uuid>
	|        <DocumentId>0</DocumentId>
	|        <Filename>ТестФайл2.pdf</Filename>
	|        <Content />
	|    </Attachment>
	|</Attachments>
	|<StatusChanged>2021-05-21T10:32:44</StatusChanged>
	|</Document>	
	|"; //@non-nls-1
	
	Return TextResponseXML;
	
EndFunction 

Procedure Test_ComplexRequestParameters() Export

	Result = HTTPConnector.GetJson(
		"https://httpbin.org/anything?jql=worklogDate >= 2017-04-01 AND worklogDate <= 2017-05-01&j&i=2"); //@non-nls-1
	AssertEquals(
		Result["args"]["jql"], //@non-nls-1 //@non-nls-2
		"worklogDate >= 2017-04-01 AND worklogDate <= 2017-05-01" //@non-nls-1
	);
	AssertEquals(Result["args"]["j"], ""); //@non-nls-1 //@non-nls-2
	AssertEquals(Result["args"]["i"], "2"); //@non-nls-1 //@non-nls-2
	
EndProcedure

Procedure Test_PostEmptyJson() Export
	
	Json = New Structure;
	Result = HTTPConnector.PostJson("https://httpbin.org/post", Json); //@non-nls-1
	AssertEquals(Result["url"], "https://httpbin.org/post"); //@non-nls-1 //@non-nls-2
	AssertEquals(
		TypeOf(Result["json"]), //@non-nls-1
		Type("Соответствие")
	);
	
EndProcedure

Procedure Тест_AuthentificationAWS4_HMAC_SHA256() Export
	
	Authentication = HTTPConnector.NewAuthenticationAWS4();
	Authentication.AccessKeyID = AccessKeyID;
	Authentication.SecretKey = SecretKey;
	Authentication.Region = Region;
	Authentication.Service = "sqs"; //@non-nls-1
	
	URL = StrTemplate("https://sqs.%1.amazonaws.com:443%2", Region, Queue); //@non-nls-1
	
	RequestParameters = New Map;
	RequestParameters.Insert("Action", "SendMessage"); //@non-nls-1 //@non-nls-2
	RequestParameters.Insert("MessageBody", "This is a test message"); //@non-nls-1 //@non-nls-2
	RequestParameters.Insert("MessageAttribute.1.Name", "my_attribute_name_1"); //@non-nls-1 //@non-nls-2
	RequestParameters.Insert("MessageAttribute.1.Value.StringValue", "my_attribute_value_1"); //@non-nls-1 //@non-nls-2
	RequestParameters.Insert("MessageAttribute.1.Value.DataType", "String"); //@non-nls-1 //@non-nls-2
	RequestParameters.Insert("MessageAttribute.2.Name", "my_attribute_name_2"); //@non-nls-1 //@non-nls-2
	RequestParameters.Insert("MessageAttribute.2.Value.StringValue", "my_attribute_value_2"); //@non-nls-1 //@non-nls-2
	RequestParameters.Insert("MessageAttribute.2.Value.DataType", "String"); //@non-nls-1 //@non-nls-2
	RequestParameters.Insert("Expires", "2020-05-05T22%3A52%3A43PST"); //@non-nls-1 //@non-nls-2
	RequestParameters.Insert("Version", "2012-11-05"); //@non-nls-1 //@non-nls-2
	
	AdditionalParameters = New Structure;
	AdditionalParameters.Insert("Authentication", Authentication);
	Response = HTTPConnector.Get(URL, RequestParameters, AdditionalParameters);
	
	AssertEquals(Response.StatusCode, 200);
	
EndProcedure

Procedure Test_PackGZip() Export
	
	InitialData = GetBinaryDataFromString("Привет, Мир!", TextEncoding.UTF8, False); //@non-nls-1
	CompressedData = GetBinaryDataFromBase64String("H4sIAAAAAAAA/wEVAOr/0J/RgNC40LLQtdGCLCDQnNC40YAhilS6PhUAAAA="); //@non-nls-1
	
	AssertEquals(HTTPConnector.WriteGZip(InitialData), CompressedData);

EndProcedure

Procedure Test_UnpackGZip() Export
	
	CompressedData = GetBinaryDataFromBase64String("H4sIAAAAAAAA/wEVAOr/0J/RgNC40LLQtdGCLCDQnNC40YAhilS6PhUAAAA="); //@non-nls-1
	Data = HTTPConnector.ReadGZip(CompressedData);
	
	AssertEquals(GetStringFromBinaryData(Data, TextEncoding.UTF8), "Привет, Мир!"); //@non-nls-1
	
EndProcedure

Procedure Test_AuthentificationAWS4_HMAC_SHA256_EmptyBodyPortNotDefined() Export
	
	URL = "https://sqs.eu-north-1.amazonaws.com/123456789101/test"; //@non-nls-1
	
	Authentication = New Structure;
	Authentication.Insert("Type", "AWS4-HMAC-SHA256"); //@non-nls-2
	Authentication.Insert("AccessKeyID", "ACCESS_KEY"); //@non-nls-2
	Authentication.Insert("SecretKey", "SECRET_KEY"); //@non-nls-2
	Authentication.Insert("Region", "eu-north-1"); //@non-nls-2
	Authentication.Insert("Service", "sqs"); //@non-nls-2

	Headers = New Map;
	Headers.Insert("x-amz-date", "20200426T122000Z"); //@non-nls-1 //@non-nls-2
	
	Session = HTTPConnector.NewSession();
	Session.Headers = Headers;
	Session.Authentication = Authentication;
	
	PreparedRequest = HTTPConnector.PrepareRequest(Session, "GET", URL, New Structure);  //@non-nls-1
	
	AssertEquals(PreparedRequest.Headers["x-amz-date"], "20200426T122000Z");  //@non-nls-1 //@non-nls-2
	AssertEquals(
		PreparedRequest.Headers["x-amz-content-sha256"], //@non-nls-1
		"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" //@non-nls-1
	);
	AssertEquals(
		PreparedRequest.Headers["Authorization"], //@non-nls-1
		"AWS4-HMAC-SHA256 Credential=ACCESS_KEY/20200426/eu-north-1/sqs/aws4_request, SignedHeaders=host;x-amz-content-sha256;x-amz-date, Signature=ad98a02ef5df6b5337128ccdac1e5a279846c0d1c4b409e713a75dae0c9e4cb3" //@non-nls-1
	);
	
EndProcedure

Procedure Test_AuthentificationAWS4_HMAC_SHA256_EmptyBodyStandardPort() Export
	
	URL = "https://sqs.eu-north-1.amazonaws.com:443/123456789101/test"; //@non-nls-1
	
	Authentication = New Structure;
	Authentication.Insert("Type", "AWS4-HMAC-SHA256"); //@non-nls-2
	Authentication.Insert("AccessKeyID", "ACCESS_KEY"); //@non-nls-2
	Authentication.Insert("SecretKey", "SECRET_KEY"); //@non-nls-2
	Authentication.Insert("Region", "eu-north-1"); //@non-nls-2
	Authentication.Insert("Service", "sqs"); //@non-nls-2

	Headers = New Map;
	Headers.Insert("x-amz-date", "20200426T122000Z"); //@non-nls-1 //@non-nls-2
	
	Session = HTTPConnector.NewSession();
	Session.Headers = Headers;
	Session.Authentication = Authentication;
	
	PreparedRequest = HTTPConnector.PrepareRequest(Session, "GET", URL, New Structure); //@non-nls-1
	
	AssertEquals(PreparedRequest.Headers["x-amz-date"], "20200426T122000Z"); //@non-nls-1 //@non-nls-2
	AssertEquals(PreparedRequest.Headers["x-amz-content-sha256"], "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"); //@non-nls-1 //@non-nls-2
	AssertEquals(
		PreparedRequest.Headers["Authorization"], //@non-nls-1
		"AWS4-HMAC-SHA256 Credential=ACCESS_KEY/20200426/eu-north-1/sqs/aws4_request, SignedHeaders=host;x-amz-content-sha256;x-amz-date, Signature=ad98a02ef5df6b5337128ccdac1e5a279846c0d1c4b409e713a75dae0c9e4cb3" //@non-nls-1
	);
	
EndProcedure

Procedure Test_AuthentificationAWS4_HMAC_SHA256_EmptyBodyNonStandardPort() Export
	
	URL = "https://sqs.eu-north-1.amazonaws.com:444/123456789101/test"; //@non-nls-1
	
	Authentication = New Structure;
	Authentication.Insert("Type", "AWS4-HMAC-SHA256"); //@non-nls-2
	Authentication.Insert("AccessKeyID", "ACCESS_KEY"); //@non-nls-2
	Authentication.Insert("SecretKey", "SECRET_KEY"); //@non-nls-2
	Authentication.Insert("Region", "eu-north-1"); //@non-nls-2
	Authentication.Insert("Service", "sqs"); //@non-nls-2

	Headers = New Map;
	Headers.Insert("x-amz-date", "20200426T122000Z"); //@non-nls-1 //@non-nls-2
	
	Session = HTTPConnector.NewSession();
	Session.Headers = Headers;
	Session.Authentication = Authentication;
	
	PreparedRequest = HTTPConnector.PrepareRequest(Session, "GET", URL, New Structure); //@non-nls-1
	
	AssertEquals(PreparedRequest.Headers["x-amz-date"], "20200426T122000Z"); //@non-nls-1 //@non-nls-2
	AssertEquals(PreparedRequest.Headers["x-amz-content-sha256"], "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"); //@non-nls-1 //@non-nls-2
	AssertEquals(
		PreparedRequest.Headers["Authorization"], //@non-nls-1
		"AWS4-HMAC-SHA256 Credential=ACCESS_KEY/20200426/eu-north-1/sqs/aws4_request, SignedHeaders=host;x-amz-content-sha256;x-amz-date, Signature=96df4fab493e08b8a72965acf7a6d2fd651a883a2766a2b0e4c0cd113dea7d8c" //@non-nls-1
	);
	
EndProcedure

Procedure Test_RetryBasedOnHeaderRetryAfterDuration() Export
	
	Headers = New Map;
	Headers.Insert("X-ID", String(New UUID)); //@non-nls-1
	
	AdditionalParameters = New Structure;
	AdditionalParameters.Insert("MaximumNumberOfRetries", 5);
	AdditionalParameters.Insert("ExponentialDelayRatio", 2);
	
	AdditionalParameters.Insert("Headers", Headers);
		
	URL = "http://127.0.0.1:5000/retry_after_duration"; //@non-nls-1
	Response = HTTPConnector.Get(URL, Undefined, AdditionalParameters);
	AssertEquals(Response.StatusCode, 200);
	
EndProcedure

Procedure Test_RetryBasedOnHeaderRetryAfterDate() Export
	
	Headers = New Map;
	Headers.Insert("X-ID", String(New UUID)); //@non-nls-1
	
	AdditionalParameters = New Structure;
	AdditionalParameters.Insert("MaximumNumberOfRetries", 5);
	AdditionalParameters.Insert("ExponentialDelayRatio", 2);
	
	AdditionalParameters.Insert("Headers", Headers);
		
	URL = "http://127.0.0.1:5000/retry_after_date"; //@non-nls-1
	Response = HTTPConnector.Get(URL, Undefined, AdditionalParameters);
	AssertEquals(Response.StatusCode, 200);
	
EndProcedure

Procedure Test_RetryAfterError502() Export

	ToRetryForStatusesCodes = New Array;
	ToRetryForStatusesCodes.Add(HTTPConnector.HTTPStatusCodes().BadGateway_502);
	
	Headers = New Map;
	Headers.Insert("X-ID", String(New UUID)); //@non-nls-1
	
	AdditionalParameters = New Structure;
	AdditionalParameters.Insert("MaximumNumberOfRetries", 5);
	AdditionalParameters.Insert("ToRetryForStatusesCodes", ToRetryForStatusesCodes);
	
	AdditionalParameters.Insert("Headers", Headers);
		
	URL = "http://127.0.0.1:5000/retry_502"; //@non-nls-1
	Response = HTTPConnector.Get(URL, Undefined, AdditionalParameters);
	AssertEquals(Response.StatusCode, 200);
	
EndProcedure

Procedure Test_RetryAfterConnectionError() Export

	ToRetryForStatusesCodes = New Array;
	ToRetryForStatusesCodes.Add(HTTPConnector.HTTPStatusCodes().BadGateway_502);
	
	Headers = New Map;
	Headers.Insert("X-ID", String(New UUID)); //@non-nls-1
	
	AdditionalParameters = New Structure;
	AdditionalParameters.Insert("Timeout", 1);
	AdditionalParameters.Insert("MaximumNumberOfRetries", 2);
	AdditionalParameters.Insert("ToRetryForStatusesCodes", ToRetryForStatusesCodes);
	
	AdditionalParameters.Insert("Headers", Headers);
	
	Start = CurrentUniversalDateInMilliseconds();
	URL = "http://127.0.0.1:5001/non_existent_resource"; //@non-nls-1
	Try
		HTTPConnector.Get(URL, Undefined, AdditionalParameters);
	Except
		Duration = CurrentUniversalDateInMilliseconds() - Start;
	EndTry;
	AssertEquals(Duration >= 3000 And Duration < 7000, True);
	
EndProcedure

Procedure Test_Ping() Export

	URL = "http://127.0.0.1:5000/ping"; //@non-nls-1
	Response = HTTPConnector.Get(URL);
	AssertEquals(Response.StatusCode, 200);
	
EndProcedure

Procedure Test_HTTPStatusCodePresentation() Export

	AssertEquals(HTTPConnector.HTTPStatusCodePresentation(400), "400: Bad Request"); //@non-nls-1

EndProcedure

Procedure Test_UnknownHTTPStatusCodePresentation() Export

	Try
		HTTPConnector.HTTPStatusCodePresentation(488);
	Except
		ExceptionIsCorrect(ErrorInfo(), "Неизвестный код состояния HTTP: 488"); //@non-nls-1
	EndTry;
	
EndProcedure

Procedure Test_CorrectExceptionInMethodAsJson() Export

	Try
		HTTPConnector.GetJson("https://en.wikipedia.org/wiki/1C_Company#Products");//@non-nls-1
	Except
		ExceptionIsCorrect(ErrorInfo(), "1C Company"); //@non-nls-1
	EndTry;
	
EndProcedure

Procedure Test_RequestSendingCorruptsPassedSettings_GitHub_Issue_33() Export
	
	Settings = New Structure; 
	Headers = New Map;
	Headers.Insert("Content-Type","application/json"); //@non-nls-1 //@non-nls-2
	Settings.Insert("Заголовки", Headers);
	
	RequestParameters = New Structure("username, password", "anonymous", "hrgesf7HDR67Bd"); //@non-nls-1 //@non-nls-2 //@non-nls-3
	
	CopyOfSettingsBeforeSending = ValueFromStringInternal(ValueToStringInternal(Settings));
	
	HTTPConnector.Post("https://jsonplaceholder.typicode.com/posts", RequestParameters, Settings); //@non-nls-1
	
	AssertEquals(HTTPConnector.ObjectToJson(Settings), HTTPConnector.ObjectToJson(CopyOfSettingsBeforeSending));
	
EndProcedure

#EndRegion

Function ExtractExecution(Response)
	
	HTML = HTTPConnector.AsText(Response);
	
	Start = StrFind(HTML, "name=""execution"""); //@non-nls-1
	End = StrFind(HTML, ">", SearchDirection.FromBegin, Start);
	ShortString = Mid(HTML, Start, End - Start);
	
	Start = StrFind(ShortString, "value=""") + StrLen("value="""); //@non-nls-1 //@non-nls-2
	End = StrFind(ShortString, """", SearchDirection.FromBegin, Start); 
	
	Return Mid(ShortString, Start, End - Start);
	
EndFunction

Function CalculateMD5(Data)
	
	Hashing = New DataHashing(HashFunction.MD5);
	Hashing.Append(Data);
	
	Return Lower(GetHexStringFromBinaryData(Hashing.HashSum));
	
EndFunction

Procedure AssertEquals(LeftValue, RightValue, Explanation = "")
	
	If LeftValue <> RightValue Then
		Raise(StrTemplate(NStr("ru = '<%1> не равно <%2>: %3';
										|en = '<%1> not equal<%2>: %3';"), LeftValue, RightValue, Explanation));
	EndIf;
	
EndProcedure

Procedure ExceptionIsCorrect(ErrorInfo, ExpectedException)
	
	ExceptionText = DetailErrorDescription(ErrorInfo);
	If TypeOf(ExpectedException) = Type("Array") Then
		TextFound = False;
		For Each Item In ExpectedException Do
			If StrFind(ExceptionText, Item) Then
				TextFound = True;
				Break;
			EndIf;
		EndDo;
		
		If Not TextFound Then
			Raise(ExceptionText);
		EndIf;
	Else
		If Not StrFind(ExceptionText, ExpectedException) Then
			Raise(ExceptionText);
		EndIf;
	EndIf;
	
EndProcedure

#EndRegion

#EndIf
