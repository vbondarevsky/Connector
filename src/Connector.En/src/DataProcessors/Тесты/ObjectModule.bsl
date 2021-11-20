// BSLLS-off
#If Server Or ThickClientOrdinaryApplication Or ExternalConnection Then

#Region Public

// Возвращает список тестов
//
Function ПолучитьСписокТестов() Export

	Тесты = New Array;
	Тесты.Add("Тест_РазобратьURLСоЗнакомРавноВЗначенииПараметраЗапроса");
	Тесты.Add("Тест_РазобратьURLСПараметромЗапросаБезЗначения");
	Тесты.Add("Тест_РазобратьURLСЯвноЗаданнымПортом");
	Тесты.Add("Тест_РазобратьURLСПараметрамиЗапросаСНесколькимиЗначениями");
	Тесты.Add("Тест_РазобратьURLСФрагментом");
	Тесты.Add("Тест_РазобратьURLСХостомВФорматеIPv6");
	Тесты.Add("Тест_РазобратьПростойURL");
	Тесты.Add("Тест_РазобратьURLСЗакодированнымURLВПараметре");
	Тесты.Add("Тест_РазобратьURLСИменемПользователяИПаролем");
	Тесты.Add("Тест_РазобратьURLСИменемПользователяБезПароля");
	
	Тесты.Add("Тест_HMAC");
	
	If ТестироватьСоединениеЧерезПрокси Then
		Тесты.Add("Тест_СоединениеЧерезПрокси");
	EndIf;
	If ТестироватьПолучениеСпискаРелизовВСайта1С Then
		Тесты.Add("Тест_ПолучениеСпискаРелизовВСайта1С");
	EndIf;
	Тесты.Add("Тест_ПараметрыЗаписиJson");
	Тесты.Add("Тест_URLБезСхемы");
	Тесты.Add("Тест_ПередачаПараметровВСтрокуЗапроса");
	Тесты.Add("Тест_ПередачаПараметровВСтрокуЗапросаКомбинированный");
	Тесты.Add("Тест_РезультатКакJsonGet");
	Тесты.Add("Тест_РезультатКакJsonPost");
	Тесты.Add("Тест_РезультатКакДвоичныеДанные");
	Тесты.Add("Тест_РезультатКакТекст");
	Тесты.Add("Тест_ПередачаПроизвольныхЗаголовков");
	Тесты.Add("Тест_ОтправкаДанныхФормы");
	Тесты.Add("Тест_ОтправкаJson");
	Тесты.Add("Тест_Таймаут");
	Тесты.Add("Тест_BasicAuth");
	Тесты.Add("Тест_DigestAuth");
#If Not MobileAppServer Then
	Тесты.Add("Тест_ОтправитьGZip");
	Тесты.Add("Тест_ПолучитьGZip");
	Тесты.Add("Тест_УпаковатьGZip");
	Тесты.Add("Тест_РаспаковатьGZip");
#EndIf
	Тесты.Add("Тест_GetJson");
	Тесты.Add("Тест_PostJson");
	Тесты.Add("Тест_PostИРедирект");
	Тесты.Add("Тест_GetJsonСтруктура");
	Тесты.Add("Тест_PutJson");
	Тесты.Add("Тест_DeleteJson");
	Тесты.Add("Тест_GetУспешныйРедиректОтносительныйАдрес");
	Тесты.Add("Тест_GetУспешныйРедиректАбсолютныйАдрес");
	Тесты.Add("Тест_GetЗацикленныйРедирект");
	Тесты.Add("Тест_GetОтключенныйРедирект");
	Тесты.Add("Тест_РедиректСУказаниемURL");
	Тесты.Add("Тест_Ошибка404");
	Тесты.Add("Тест_РаботаССессиями");
	Тесты.Add("Тест_Options");
	Тесты.Add("Тест_Head");
	Тесты.Add("Тест_Delete");
	Тесты.Add("Тест_Patch");
	Тесты.Add("Тест_ПроизвольныйМетод");
	Тесты.Add("Тест_УстановкаCookies");
	Тесты.Add("Тест_ОтправитьCookies");
	Тесты.Add("Тест_POST_MultipartFormData_ТолькоФайл");
	Тесты.Add("Тест_POST_MultipartFormData_ФайлыИПоляФормы");
	Тесты.Add("Тест_POST_MultipartFormData_ФайлыИПоляФормы_КонструкторПараметров");
	Тесты.Add("Тест_ПараметрыЗапросаТолькоКлюч");
	Тесты.Add("Тест_ОтправкаXml");
	Тесты.Add("Тест_ПрочитатьОтветКакXDTO");
	Тесты.Add("Тест_СложныеПараметрыЗапроса");
	Тесты.Add("Тест_PostПустойJson");
	If ТестироватьАутентификациюAWS4_HMAC_SHA256 Then
		Тесты.Add("Тест_АутентификацияAWS4_HMAC_SHA256");
	EndIf;
	
	Тесты.Add("Тест_АутентификацияAWS4_HMAC_SHA256_ПустоеТелоПортНеУказан");
	Тесты.Add("Тест_АутентификацияAWS4_HMAC_SHA256_ПустоеТелоУказанСтандартныйПорт");
	Тесты.Add("Тест_АутентификацияAWS4_HMAC_SHA256_ПустоеТелоУказанНеСтандартныйПорт");
	
	If ТестироватьПовторы Then
		Тесты.Add("Тест_ПовторСУчетомЗаголовкаRetryAfterDate");
		Тесты.Add("Тест_ПовторСУчетомЗаголовкаRetryAfterDuration");
		Тесты.Add("Тест_ПовторПослеОшибки502");
		Тесты.Add("Тест_ПовторПослеОшибкиПодключения");
		Тесты.Add("Тест_Ping");
	EndIf;

	Тесты.Add("Тест_ПредставлениеКодаСостоянияHTTP");
	Тесты.Add("Тест_ПредставлениеНеизвестногоКодаСостоянияHTTP");
	Тесты.Add("Тест_КорректноеИсключениеВМетодеКакJson");
	Тесты.Add("Тест_ПроверкаПреобразованияВJsonНеСериализуемыхЗначений");
	Тесты.Add("Тест_ПроверкаПреобразованияВариантаЗаписиДатыJSON");
	Тесты.Add("Тест_ПроверкаВосстановленияНеподдерживаемыхТиповЗначений");

	Тесты.Add("Тест_ОтправкаЗапросаПортитПереданныеНастройки_GitHub_Issue_33");

	Return Тесты;
	
EndFunction

// Запускает прогон тестов
//
Function ВыполнитьТестыНаСервере(Тесты) Export

	For Each СтрокаТаблицы In Тесты Do
		If Not СтрокаТаблицы.Use Then
			Continue;
		EndIf;
		
		Try
			Execute(СтрокаТаблицы.Тест + "()");
			СтрокаТаблицы.Result = "OK";
			СтрокаТаблицы.Error = "";
		Except
			СтрокаТаблицы.Result = "FAIL";
			СтрокаТаблицы.Error = DetailErrorDescription(ErrorInfo());
		EndTry;
	EndDo;
	
	Return Тесты;
	
EndFunction

#EndRegion

#Region СлужебныеПроцедурыИФункции

#Region Тесты

Procedure Тест_РазобратьURLСоЗнакомРавноВЗначенииПараметраЗапроса() Export
	
	URLComposition = HTTPConnector.ParseURL(
		"https://httpbin.org/anything?jql=worklogDate >= 2017-04-01 AND worklogDate <= 2017-05-01&j&i=2");
	
	УтверждениеВерно(URLComposition.Scheme, "https");
	УтверждениеВерно(URLComposition.Host, "httpbin.org");
	УтверждениеВерно(URLComposition.Path, "/anything");
	УтверждениеВерно(URLComposition.Port, 0);
	УтверждениеВерно(URLComposition.Fragment, "");
	УтверждениеВерно(URLComposition.Authentication.User, "");
	УтверждениеВерно(URLComposition.Authentication.Password, "");
	УтверждениеВерно(URLComposition.RequestParameters["jql"], "worklogDate >= 2017-04-01 AND worklogDate <= 2017-05-01");
	УтверждениеВерно(URLComposition.RequestParameters["j"], Undefined);
	УтверждениеВерно(URLComposition.RequestParameters["i"], "2");
	
EndProcedure

Procedure Тест_РазобратьURLСПараметромЗапросаБезЗначения() Export
	
	URLComposition = HTTPConnector.ParseURL("https://httpbin.org/get?key");
	
	УтверждениеВерно(URLComposition.Scheme, "https");
	УтверждениеВерно(URLComposition.Host, "httpbin.org");
	УтверждениеВерно(URLComposition.Path, "/get");
	УтверждениеВерно(URLComposition.Port, 0);
	УтверждениеВерно(URLComposition.Fragment, "");
	УтверждениеВерно(URLComposition.Authentication.User, "");
	УтверждениеВерно(URLComposition.Authentication.Password, "");
	УтверждениеВерно(URLComposition.RequestParameters["key"], Undefined);
	
EndProcedure

Procedure Тест_РазобратьURLСЯвноЗаданнымПортом() Export
	
	URLComposition = HTTPConnector.ParseURL("https://httpbin.org:443/get?key");
	
	УтверждениеВерно(URLComposition.Scheme, "https");
	УтверждениеВерно(URLComposition.Host, "httpbin.org");
	УтверждениеВерно(URLComposition.Path, "/get");
	УтверждениеВерно(URLComposition.Port, 443);
	УтверждениеВерно(URLComposition.Fragment, "");
	УтверждениеВерно(URLComposition.Authentication.User, "");
	УтверждениеВерно(URLComposition.Authentication.Password, "");
	УтверждениеВерно(URLComposition.RequestParameters["key"], Undefined);
	
EndProcedure

Procedure Тест_РазобратьURLСПараметрамиЗапросаСНесколькимиЗначениями() Export
	
	URLComposition = HTTPConnector.ParseURL("http://httpbin.org/anything?i=v1&j=w1&j=w2&i=v2&i=v3");
	
	УтверждениеВерно(URLComposition.Scheme, "http");
	УтверждениеВерно(URLComposition.Host, "httpbin.org");
	УтверждениеВерно(URLComposition.Path, "/anything");
	УтверждениеВерно(URLComposition.Port, 0);
	УтверждениеВерно(URLComposition.Fragment, "");
	УтверждениеВерно(URLComposition.Authentication.User, "");
	УтверждениеВерно(URLComposition.Authentication.Password, "");
	УтверждениеВерно(StrConcat(URLComposition.RequestParameters["i"], ", "), "v1, v2, v3");
	УтверждениеВерно(StrConcat(URLComposition.RequestParameters["j"], ", "), "w1, w2");
	
EndProcedure

Procedure Тест_РазобратьURLСФрагментом() Export
	
	URLComposition = HTTPConnector.ParseURL("https://en.wikipedia.org/wiki/1C_Company#Products");
	
	УтверждениеВерно(URLComposition.Scheme, "https");
	УтверждениеВерно(URLComposition.Host, "en.wikipedia.org");
	УтверждениеВерно(URLComposition.Path, "/wiki/1C_Company");
	УтверждениеВерно(URLComposition.Port, 0);
	УтверждениеВерно(URLComposition.Fragment, "Products");
	УтверждениеВерно(URLComposition.Authentication.User, "");
	УтверждениеВерно(URLComposition.Authentication.Password, "");
	УтверждениеВерно(URLComposition.RequestParameters.Count(), 0);
	
EndProcedure

Procedure Тест_РазобратьURLСХостомВФорматеIPv6() Export
	
	URLComposition = HTTPConnector.ParseURL("http://[2001:0db8:11a3:09d7:1f34:8a2e:07a0:765d]:8080/test");
	
	УтверждениеВерно(URLComposition.Scheme, "http");
	УтверждениеВерно(URLComposition.Host, "[2001:0db8:11a3:09d7:1f34:8a2e:07a0:765d]");
	УтверждениеВерно(URLComposition.Path, "/test");
	УтверждениеВерно(URLComposition.Port, 8080);
	УтверждениеВерно(URLComposition.Fragment, "");
	УтверждениеВерно(URLComposition.Authentication.User, "");
	УтверждениеВерно(URLComposition.Authentication.Password, "");
	УтверждениеВерно(URLComposition.RequestParameters.Count(), 0);
	
EndProcedure

Procedure Тест_РазобратьПростойURL() Export
	
	URLComposition = HTTPConnector.ParseURL("http://1c.ru");
	
	УтверждениеВерно(URLComposition.Scheme, "http");
	УтверждениеВерно(URLComposition.Host, "1c.ru");
	УтверждениеВерно(URLComposition.Path, "/");
	УтверждениеВерно(URLComposition.Port, 0);
	УтверждениеВерно(URLComposition.Fragment, "");
	УтверждениеВерно(URLComposition.Authentication.User, "");
	УтверждениеВерно(URLComposition.Authentication.Password, "");
	УтверждениеВерно(URLComposition.RequestParameters.Count(), 0);
	
EndProcedure

Procedure Тест_РазобратьURLСЗакодированнымURLВПараметре() Export
	
	URLComposition = HTTPConnector.ParseURL(
		"https://www.example.ru?url=http%3A%2F%2Fwww.kuku.ru%2F%3Fs%3D1%26b%3D2&OTHER=1");
	
	УтверждениеВерно(URLComposition.Scheme, "https");
	УтверждениеВерно(URLComposition.Host, "www.example.ru");
	УтверждениеВерно(URLComposition.Path, "/");
	УтверждениеВерно(URLComposition.Port, 0);
	УтверждениеВерно(URLComposition.Fragment, "");
	УтверждениеВерно(URLComposition.Authentication.User, "");
	УтверждениеВерно(URLComposition.Authentication.Password, "");
	УтверждениеВерно(URLComposition.RequestParameters.Count(), 2);
	УтверждениеВерно(URLComposition.RequestParameters["url"], "http://www.kuku.ru/?s=1&b=2");
	УтверждениеВерно(URLComposition.RequestParameters["OTHER"], "1");
	
EndProcedure

Procedure Тест_РазобратьURLСИменемПользователяИПаролем() Export

	URLComposition = HTTPConnector.ParseURL("http://user:pass@1c.ru");

	УтверждениеВерно(URLComposition.Scheme, "http");
	УтверждениеВерно(URLComposition.Host, "1c.ru");
	УтверждениеВерно(URLComposition.Path, "/");
	УтверждениеВерно(URLComposition.Port, 0);
	УтверждениеВерно(URLComposition.Fragment, "");
	УтверждениеВерно(URLComposition.Authentication.User, "user");
	УтверждениеВерно(URLComposition.Authentication.Password, "pass");
	УтверждениеВерно(URLComposition.RequestParameters.Count(), 0);

EndProcedure

Procedure Тест_РазобратьURLСИменемПользователяБезПароля() Export

	URLComposition = HTTPConnector.ParseURL("http://user@1c.ru");

	УтверждениеВерно(URLComposition.Scheme, "http");
	УтверждениеВерно(URLComposition.Host, "1c.ru");
	УтверждениеВерно(URLComposition.Path, "/");
	УтверждениеВерно(URLComposition.Port, 0);
	УтверждениеВерно(URLComposition.Fragment, "");
	УтверждениеВерно(URLComposition.Authentication.User, "user");
	УтверждениеВерно(URLComposition.Authentication.Password, "");
	УтверждениеВерно(URLComposition.RequestParameters.Count(), 0);

EndProcedure

Procedure Тест_HMAC() Export
	
	Var_Key = GetBinaryDataFromString("Секретный key", TextEncoding.UTF8, False);
	КлючБольше64 = GetBinaryDataFromString(
		"1234567890123456789012345678901234567890123456789012345678901234567890", TextEncoding.UTF8, False);
	
	ПустыеДанные = GetBinaryDataFromString("", TextEncoding.UTF8, False);
	Data = GetBinaryDataFromString("Какие-то data", TextEncoding.UTF8, False);
	
	УтверждениеВерно(
		HTTPConnector.HMAC(Var_Key, ПустыеДанные, HashFunction.MD5), 
		GetBinaryDataFromHexString("1b1ec4166a11c03b3afefaea442e7709"));
	УтверждениеВерно(
		HTTPConnector.HMAC(КлючБольше64, Data, HashFunction.MD5), 
		GetBinaryDataFromHexString("ed5b2d6b9f573cd46e8f8d1d1e8b70e3"));
		
	УтверждениеВерно(
		HTTPConnector.HMAC(Var_Key, ПустыеДанные, HashFunction.SHA1), 
		GetBinaryDataFromHexString("355aa0587050d711f4ca9af6930c736363a88d34"));
	УтверждениеВерно(
		HTTPConnector.HMAC(КлючБольше64, Data, HashFunction.SHA1), 
		GetBinaryDataFromHexString("7e8f9d7ebbe81e508a39f410e157fc6e714b3371"));
		
	УтверждениеВерно(
		HTTPConnector.HMAC(Var_Key, ПустыеДанные, HashFunction.SHA256),
		GetBinaryDataFromHexString("70907d03476d72b7276897718590a49f6ce56991112fb5a0e9ed41652b2aab6c"));
	УтверждениеВерно(
		HTTPConnector.HMAC(КлючБольше64, Data, HashFunction.SHA256),
		GetBinaryDataFromHexString("80be8107de7879f028c8bfe97e10b859785530dd19dfc41a4d6962ce4c2fc130"));

EndProcedure

Procedure Тест_СоединениеЧерезПрокси() Export
	
	Proxy = New InternetProxy;
	Proxy.Set("http", ПроксиСервер, ПроксиПорт);
	HTTPConnector.GetJson("http://httpbin.org/headers", Undefined, New Structure("Proxy", Proxy));

EndProcedure

Procedure Тест_ПараметрыЗаписиJson() Export
	
	JSONWriterSettings = New Structure("NewLines", JSONLineBreak.None);
	Json = New Structure;
	Json.Insert("field", "value");
	Json.Insert("field2", "value2");
	Result = HTTPConnector.PostJson("http://httpbin.org/anything", Json, New Structure("JSONWriterSettings", JSONWriterSettings));
	УтверждениеВерно(Result["data"], "{""field"":""value"",""field2"":""value2""}");
	
EndProcedure

Procedure Тест_URLБезСхемы() Export
	
	Response = HTTPConnector.Get("httpbin.org/get");
	HTTPConnector.AsJson(Response);
 	УтверждениеВерно(Response.URL, "http://httpbin.org/get");
	
EndProcedure

Procedure Тест_ПередачаПараметровВСтрокуЗапроса() Export
	
	RequestParameters = New Structure;
	RequestParameters.Insert("name", StrSplit("Иванов,Петров", ","));
	RequestParameters.Insert("salary", Format(100000, "NG="));
	RequestParameters.Insert("time", "01:47");
	
	Response = HTTPConnector.Get("https://httpbin.org/anything/params", RequestParameters);	
	Result = HTTPConnector.AsJson(Response);
	
	УтверждениеВерно(Response.URL, "https://httpbin.org/anything/params?name=%D0%98%D0%B2%D0%B0%D0%BD%D0%BE%D0%B2&name=%D0%9F%D0%B5%D1%82%D1%80%D0%BE%D0%B2&salary=100000&time=01%3A47");
	УтверждениеВерно(Result["url"], "https://httpbin.org/anything/params?name=Иванов&name=Петров&salary=100000&time=01%3A47");
	УтверждениеВерно(Result["args"]["salary"], "100000");
	УтверждениеВерно(StrConcat(Result["args"]["name"], ","), "Иванов,Петров");
	УтверждениеВерно(Result["args"]["time"], "01:47");
	
EndProcedure

Procedure Тест_ПередачаПараметровВСтрокуЗапросаКомбинированный() Export
	
	RequestParameters = New Structure;
	RequestParameters.Insert("name", StrSplit("Иванов,Петров", ","));
	RequestParameters.Insert("salary", Format(100000, "NG="));
	
	Result = HTTPConnector.GetJson("https://httpbin.org/anything/params?post=Программист", RequestParameters);	
	
	УтверждениеВерно(Result["args"]["salary"], "100000");
	УтверждениеВерно(Result["args"]["post"], "Программист");
	УтверждениеВерно(StrConcat(Result["args"]["name"], ","), "Иванов,Петров");
	
EndProcedure

Procedure Тест_РезультатКакJsonGet() Export
	
	Result = HTTPConnector.GetJson("https://httpbin.org/get");
	УтверждениеВерно(Result["url"], "https://httpbin.org/get");
	
EndProcedure

Procedure Тест_РезультатКакJsonPost() Export
	
	Result = HTTPConnector.AsJson(HTTPConnector.Post("https://httpbin.org/post"));
	УтверждениеВерно(Result["url"], "https://httpbin.org/post");
	
EndProcedure

Procedure Тест_РезультатКакДвоичныеДанные() Export
	
	Result = HTTPConnector.AsBinaryData(HTTPConnector.Get("http://httpbin.org/image/png"));
	
	УтверждениеВерно(TypeOf(Result), Type("BinaryData"));
	УтверждениеВерно(ПосчитатьMD5(Result), "5cca6069f68fbf739fce37e0963f21e7");
	
EndProcedure

Procedure Тест_РезультатКакТекст() Export
	
	Result = HTTPConnector.AsText(HTTPConnector.Get("http://httpbin.org/encoding/utf8"));
	УтверждениеВерно(StrFind(Result, "Зарегистрируйтесь сейчас на Десятую Международную"), 3931);
	
EndProcedure

Procedure Тест_ПередачаПроизвольныхЗаголовков() Export
	
	Headers = New Map;
	Headers.Insert("X-My-Header", "Hello");
	Result = HTTPConnector.GetJson("http://httpbin.org/headers", Undefined, New Structure("Headers", Headers));
	
	УтверждениеВерно(Result["headers"]["X-My-Header"], "Hello");
	
EndProcedure

Procedure Тест_ОтправкаДанныхФормы() Export
	
	Data = New Structure;
	Data.Insert("comments", "Постучать в дверь");
	Data.Insert("custemail", "vasya@mail.ru");
	Data.Insert("custname", "Вася");
	Data.Insert("custtel", "112");
	Data.Insert("delivery", "20:20");
	Data.Insert("size", "medium");
	Data.Insert("topping", StrSplit("bacon,mushroom", ","));
	
	Response = HTTPConnector.Post("http://httpbin.org/post", Data);
	УтверждениеВерно(Response.URL, "http://httpbin.org/post");
	Result = HTTPConnector.AsJson(Response);
	УтверждениеВерно(Result["form"]["size"], "medium");
	УтверждениеВерно(Result["form"]["comments"], "Постучать в дверь");
	УтверждениеВерно(Result["form"]["custemail"], "vasya@mail.ru");
	УтверждениеВерно(Result["form"]["delivery"], "20:20");
	УтверждениеВерно(Result["form"]["custtel"], "112");	
	
EndProcedure

Procedure Тест_ОтправкаJson() Export
	
	Json = New Structure;
	Json.Insert("Сотрудник", "Иванов Иван Петрович");
	Json.Insert("JobTitle", "Разнорабочий");
	
	Result = HTTPConnector.PostJson("http://httpbin.org/post", Json);
	
	УтверждениеВерно(Result["json"]["Сотрудник"], "Иванов Иван Петрович");
	УтверждениеВерно(Result["json"]["JobTitle"], "Разнорабочий");
	
	Result = HTTPConnector.PutJson("http://httpbin.org/put", Json);
	УтверждениеВерно(Result["json"]["Сотрудник"], "Иванов Иван Петрович");
	УтверждениеВерно(Result["json"]["JobTitle"], "Разнорабочий");
	
EndProcedure

Procedure Тест_Таймаут() Export
	
	Try
		HTTPConnector.Get("https://httpbin.org/delay/10", Undefined, New Structure("Timeout", 1));
	Except
		ВерноеИсключение(ErrorInfo(), StrSplit("Превышено time ожидания|Timeout exceeded", "|"));
	EndTry;
	
EndProcedure

Procedure Тест_ПолучитьGZip() Export
	
	Result = HTTPConnector.GetJson("http://httpbin.org/gzip");
	УтверждениеВерно(Result["gzipped"], True);
	
EndProcedure

Procedure Тест_ОтправитьGZip() Export
	
	Json = New Structure;
	Json.Insert("field", "value");
	Json.Insert("field2", "value2");
	Headers = New Map;
	Headers.Insert("Content-Encoding", "gzip");
	Result = HTTPConnector.PostJson("http://httpbin.org/anything", Json, New Structure("Headers", Headers));
	
	DataWriter = GetBinaryDataFromBase64String(StrSplit(Result["data"], ",")[1]);
	ИсходноеЗначение = HTTPConnector.JsonВОбъект(HTTPConnector.ПрочитатьGZip(DataWriter));
	
	УтверждениеВерно(Result["headers"]["Content-Encoding"], "gzip");
	УтверждениеВерно(ИсходноеЗначение["field"], Json["field"]);
	УтверждениеВерно(ИсходноеЗначение["field2"], Json["field2"]);
	
EndProcedure

Procedure Тест_BasicAuth() Export
	
	Result = HTTPConnector.GetJson("https://user:pass@httpbin.org/basic-auth/user/pass");
	УтверждениеВерно(Result["authenticated"], True);
	УтверждениеВерно(Result["user"], "user");

	Authentication = New Structure("User, Password", "user", "pass");
	Result = HTTPConnector.GetJson(
		"https://httpbin.org/basic-auth/user/pass",
		Undefined,
		New Structure("Authentication", Authentication));
	УтверждениеВерно(Result["authenticated"], True);
	УтверждениеВерно(Result["user"], "user");

	Authentication = New Structure("User, Password, Type", "user", "pass", "Basic");
	Result = HTTPConnector.GetJson(
		"https://httpbin.org/basic-auth/user/pass",
		Undefined,
		New Structure("Authentication", Authentication));
	УтверждениеВерно(Result["authenticated"], True);
	УтверждениеВерно(Result["user"], "user");
	
EndProcedure

Procedure Тест_DigestAuth() Export
	
	Authentication = New Structure("User, Password, Type", "user", "pass", "Digest");
	Result = HTTPConnector.GetJson(
		"https://httpbin.org/digest-auth/auth/user/pass",
		Undefined,
		New Structure("Authentication", Authentication));
	УтверждениеВерно(Result["authenticated"], True);
	УтверждениеВерно(Result["user"], "user");
	
	Authentication = New Structure("User, Password, Type", "guest", "guest", "Digest");
	Result = HTTPConnector.Get(
		"https://jigsaw.w3.org/HTTP/Digest/",
		Undefined,
		New Structure("Authentication", Authentication));
	УтверждениеВерно(Result.StatusCode, 200);
	
EndProcedure

Procedure Тест_GetJson() Export
	
	Result = HTTPConnector.GetJson("https://httpbin.org/get");
	УтверждениеВерно(Result["url"], "https://httpbin.org/get");
	
EndProcedure

Procedure Тест_GetJsonСтруктура() Export
	
	JSONConversionParameters = New Structure("ReadToMap", False);
	Result = HTTPConnector.GetJson(
		"http://httpbin.org/json", Undefined, New Structure("JSONConversionParameters", JSONConversionParameters));
	УтверждениеВерно(Result.slideshow.author, "Yours Truly");
	УтверждениеВерно(Result.slideshow.date, "date of publication");
	УтверждениеВерно(Result.slideshow.slides.Count(), 2);
	УтверждениеВерно(Result.slideshow.title, "Sample Slide Show");
	
EndProcedure

Procedure Тест_PostJson() Export
	
	JSONConversionParameters = New Structure;
	JSONConversionParameters.Insert("PropertiesNamesWithDateValues", "Date");
	
	Json = New Structure;
	Json.Insert("Date", '20190121002400');
	Json.Insert("Number", 5);
	Json.Insert("Boolean", True);
	Json.Insert("String", "Привет");
		
	Result = HTTPConnector.PostJson(
		"https://httpbin.org/post", 
		Json, 
		New Structure("JSONConversionParameters", JSONConversionParameters));
	УтверждениеВерно(Result["url"], "https://httpbin.org/post");
	УтверждениеВерно(Result["json"]["Date"], '20190121002400');
	УтверждениеВерно(Result["json"]["Number"], 5);
	УтверждениеВерно(Result["json"]["Boolean"], True);
	УтверждениеВерно(Result["json"]["String"], "Привет");
	
EndProcedure

Procedure Тест_ПроверкаПреобразованияВариантаЗаписиДатыJSON() Export

	УниверсальнаяКонтрольнаяДата = CurrentUniversalDate();
	ЛокальнаяКонтрольнаяДата = ToLocalTime(УниверсальнаяКонтрольнаяДата, TimeZone());
	Json = New Structure;
	Json.Insert("Date", ЛокальнаяКонтрольнаяДата);

	ПараметрыJSON = New Structure;
	ПараметрыJSON.Insert("JSONDateWritingVariant", PredefinedValue("JSONDateWritingVariant.UniversalDate"));

	Result = HTTPConnector.PostJson(
		"https://httpbin.org/post",
		Json,
		New Structure("JSONConversionParameters", ПараметрыJSON));

	УтверждениеВерно(Result["json"]["Date"], Format(УниверсальнаяКонтрольнаяДата, "DF=yyyy-MM-ddTHH:mm:ssZ"));

EndProcedure

Procedure Тест_ПроверкаПреобразованияВJsonНеСериализуемыхЗначений() Export

	Json = New Structure;
	Json.Insert("UUID", New UUID("be4ee795-7f5e-4d1a-be43-a6d6902f5cfd"));
	Json.Insert("BinaryData", GetBinaryDataFromString("test", "utf-8", False));

	ПараметрыJSON = New Structure;
	ПараметрыJSON.Insert("ConvertionFunctionName", "JsonConversion");
	ПараметрыJSON.Insert("ConvertionFunctionModule", HTTPConnector);

	Result = HTTPConnector.PostJson(
		"https://httpbin.org/post",
		Json,
		New Structure("JSONConversionParameters", ПараметрыJSON));

	УтверждениеВерно(Result["json"]["UUID"], "be4ee795-7f5e-4d1a-be43-a6d6902f5cfd");
	УтверждениеВерно(Result["json"]["BinaryData"], "dGVzdA==");

EndProcedure

Procedure Тест_ПроверкаВосстановленияНеподдерживаемыхТиповЗначений() Export

	UUID = New UUID("be4ee795-7f5e-4d1a-be43-a6d6902f5cfd");
	BinaryData = GetBinaryDataFromString("test", "utf-8", False);

	Json = New Structure;
	Json.Insert("UUID", String(UUID));
	Json.Insert("BinaryData", GetBase64StringFromBinaryData(BinaryData));
	Json.Insert("ДругиеДанные", 1);

	ПараметрыJSON = New Structure;
	ПараметрыJSON.Insert("ReviverFunctionModule", HTTPConnector);
	ПараметрыJSON.Insert("ReviverFunctionName", "RestoreJson");
	PropertiesTypes = New Map;
	PropertiesTypes.Insert("UUID", Type("UUID"));
	PropertiesTypes.Insert("BinaryData", Type("BinaryData"));
	ПараметрыJSON.Insert("ReviverFunctionAdditionalParameters", PropertiesTypes);
	ПараметрыJSON.Insert("RetriverPropertiesNames", StrSplit("UUID,BinaryData", ","));

	Result = HTTPConnector.PostJson(
		"https://httpbin.org/post",
		Json,
		New Structure("JSONConversionParameters", ПараметрыJSON));

	УтверждениеВерно(Result["json"]["UUID"], UUID);
	УтверждениеВерно(Result["json"]["BinaryData"], BinaryData);
	УтверждениеВерно(Result["json"]["ДругиеДанные"], 1);

EndProcedure

Procedure Тест_PostИРедирект() Export
	
	Response = HTTPConnector.Get("https://httpbin.org/redirect-to?url=https%3A%2F%2Fya.ru&status_code=301");
	УтверждениеВерно(Response.StatusCode, 200);
	
	Response = HTTPConnector.Post("https://httpbin.org/redirect-to?url=https%3A%2F%2Fya.ru&status_code=301");
	УтверждениеВерно(Response.StatusCode, 403);
	
EndProcedure

Procedure Тест_PutJson() Export
	
	Result = HTTPConnector.PutJson("https://httpbin.org/put", New Structure("Название", "HTTPConnector"));
	УтверждениеВерно(Result["url"], "https://httpbin.org/put");
	УтверждениеВерно(Result["json"]["Название"], "HTTPConnector");
	
EndProcedure

Procedure Тест_DeleteJson() Export
	
	Result = HTTPConnector.DeleteJson("https://httpbin.org/delete", New Structure("Название", "HTTPConnector"));
	УтверждениеВерно(Result["url"], "https://httpbin.org/delete");
	УтверждениеВерно(Result["json"]["Название"], "HTTPConnector");
	
EndProcedure

Procedure Тест_GetУспешныйРедиректОтносительныйАдрес() Export
	
	Response = HTTPConnector.Get("https://httpbin.org/relative-redirect/6");
	Result = HTTPConnector.AsJson(Response);
	
	УтверждениеВерно(Response.StatusCode, 200);
	УтверждениеВерно(Result["url"], "https://httpbin.org/get");
	
EndProcedure

Procedure Тест_GetУспешныйРедиректАбсолютныйАдрес() Export
	
	Response = HTTPConnector.Get("http://httpbin.org/absolute-redirect/6");
	Result = HTTPConnector.AsJson(Response);
	
	УтверждениеВерно(Response.StatusCode, 200);
	УтверждениеВерно(Result["url"], "http://httpbin.org/get");
	
EndProcedure

Procedure Тест_GetЗацикленныйРедирект() Export
	
	Try
		HTTPConnector.AsJson(HTTPConnector.Get("http://httpbin.org/redirect/31"));
	Except
		ВерноеИсключение(ErrorInfo(), "СлишкомМногоПеренаправлений");
	EndTry;
	
EndProcedure

Procedure Тест_GetОтключенныйРедирект() Export
	
	Parameters = New Structure("AllowRedirect", False);
	Response = HTTPConnector.Get(
		"http://httpbin.org/redirect-to?url=http%3A%2F%2Fhttpbin.org%2Fget&status_code=307",
		Undefined,
		Parameters);
	
	УтверждениеВерно(Response.StatusCode, 307);
	
EndProcedure

Procedure Тест_РедиректСУказаниемURL() Export
	
	RequestParameters = New Structure;
	RequestParameters.Insert("url", "https://httpbin.org:443/anything");
	RequestParameters.Insert("status_code", "307");

	Response = HTTPConnector.Get("http://httpbin.org:80/redirect-to", RequestParameters);
	HTTPConnector.AsJson(Response);

	УтверждениеВерно(Response.StatusCode, 200);
	УтверждениеВерно(Response.URL, "https://httpbin.org:443/anything");
	
EndProcedure

Procedure Тест_Ошибка404() Export
	
	Response = HTTPConnector.Get("http://httpbin.org/status/404");
	
	УтверждениеВерно(Response.StatusCode, 404);
	
EndProcedure

Procedure Тест_РаботаССессиями() Export
	
	Session = HTTPConnector.NewSession();
	
	HTTPConnector.Get("https://httpbin.org/cookies/set/key/value", Undefined, Undefined, Session);
	Result = HTTPConnector.GetJson("https://httpbin.org/cookies", Undefined, Undefined, Session);
	
	УтверждениеВерно(Result["cookies"]["key"], "value"); 
	
EndProcedure

Procedure Тест_ПолучениеСпискаРелизовВСайта1С() Export
	
	Session = HTTPConnector.NewSession();
	Response = HTTPConnector.Get("https://releases.1c.ru/total", Undefined, Undefined, Session);
	
	Data = New Structure;
	Data.Insert("execution", ИзвлечьExecution(Response));
	Data.Insert("username", Логин);
	Data.Insert("password", Password);
	Data.Insert("_eventId", "submit");
	Data.Insert("geolocation", "");
	Data.Insert("submit", "Войти");
	Data.Insert("rememberMe", "on");
	
	Response = HTTPConnector.Post(Response.URL, Data, Undefined, Session);
	
	УтверждениеВерно(Response.URL, "https://releases.1c.ru/total");
	УтверждениеВерно(Response.StatusCode, 200);
	
EndProcedure

Procedure Тест_Options() Export
	
	Response = HTTPConnector.Options("http://httpbin.org/anything");
	
	УтверждениеВерно(Response.StatusCode, 200);
	
EndProcedure

Procedure Тест_Head() Export
	
	Response = HTTPConnector.Head("http://httpbin.org/anything");
	
	УтверждениеВерно(Response.StatusCode, 200);
	
EndProcedure

Procedure Тест_Delete() Export
	
	Response = HTTPConnector.Delete("http://httpbin.org/delete");
	
	УтверждениеВерно(Response.StatusCode, 200);
	
EndProcedure

Procedure Тест_Patch() Export
	
	Response = HTTPConnector.Patch("http://httpbin.org/patch");
	
	УтверждениеВерно(Response.StatusCode, 200);
	
EndProcedure

Procedure Тест_ПроизвольныйМетод() Export
	
	Response = HTTPConnector.CallMethod("PATCH", "http://httpbin.org/patch");
	
	УтверждениеВерно(Response.StatusCode, 200);
	
EndProcedure

Procedure Тест_УстановкаCookies() Export
	
	Result = HTTPConnector.GetJson(
		"http://httpbin.org/cookies/set?PHPSESSID=72a68cc1e55&cookie1=1&cookie2=2&other=test");
	
	УтверждениеВерно(Result["cookies"]["PHPSESSID"], "72a68cc1e55");
	УтверждениеВерно(Result["cookies"]["cookie1"], "1");
	УтверждениеВерно(Result["cookies"]["cookie2"], "2");
	УтверждениеВерно(Result["cookies"]["other"], "test");
	
EndProcedure

Procedure Тест_ОтправитьCookies() Export
	
	Cookies = New Array;
	Cookies.Add(New Structure("Path_1,Value", "k1", String(New UUID)));
	Cookies.Add(New Structure("Path_1,Value", "k2", String(New UUID)));
	Response = HTTPConnector.Get("http://httpbin.org/cookies",, New Structure("Cookies", Cookies));
	Result = HTTPConnector.AsJson(Response);
	
	УтверждениеВерно(Result["cookies"]["k1"], Cookies[0].Value);
	УтверждениеВерно(Result["cookies"]["k2"], Cookies[1].Value);
	
EndProcedure

Procedure Тест_POST_MultipartFormData_ТолькоФайл() Export
	
	Files = New Structure;
	Files.Insert("Name", "f1");
	Files.Insert("FileName", "file1.txt");
	Files.Insert("Data", Base64Value("0J/RgNC40LLQtdGCLCDQnNC40YA="));
	Files.Insert("Type", "text/plain");
	
	Result = HTTPConnector.PostJson("https://httpbin.org/post", Undefined, New Structure("Files", Files));
	
	УтверждениеВерно(Result["files"]["f1"], "Привет, Мир");
	
EndProcedure

Procedure Тест_POST_MultipartFormData_ФайлыИПоляФормы() Export
	
	Files = New Array;
	Files.Add(New Structure("Name,Data,FileName", "f1", Base64Value("ZmlsZTE="), "file1.txt"));
	Files.Add(New Structure("Name,Data,FileName", "f2", Base64Value("ZmlsZTI="), "file2.txt"));
	
	Data = New Structure("field1,field2", "value1", "Значение2");
	
	Result = HTTPConnector.PostJson("https://httpbin.org/post", Undefined, New Structure("Files,Data", Files, Data));
	
	УтверждениеВерно(Result["files"]["f1"], "file1");
	УтверждениеВерно(Result["files"]["f2"], "file2");
	УтверждениеВерно(Result["form"]["field1"], "value1");
	УтверждениеВерно(Result["form"]["field2"], "Значение2");
	
EndProcedure

Procedure Тест_POST_MultipartFormData_ФайлыИПоляФормы_КонструкторПараметров() Export
	
	AdditionalParameters = HTTPConnector.NewParameters();
	AdditionalParameters.Files.Add(
		HTTPConnector.NewFileToSend("f1", "file1.txt", Base64Value("ZmlsZTE="))
	);
	AdditionalParameters.Files.Add(
		HTTPConnector.NewFileToSend("f2", "file2.txt", Base64Value("ZmlsZTI="))
	);
	AdditionalParameters.Files.Add(
		HTTPConnector.NewFileToSend(
			"f3",
			"file3.txt",
			Base64Value("Z0J/RgNC40LLQtdGCLCDQnNC40YA="),
			"text/plain"
		)
	);
	File = HTTPConnector.NewFileToSend("f4", "file4.txt");
	File.Headers.Insert("X-ID", String(New UUID));
	AdditionalParameters.Files.Add(File);
	
	AdditionalParameters.Data = New Structure;
	AdditionalParameters.Data.Insert("field1", "value1");
	AdditionalParameters.Data.Insert("field2", "Значение2"); 
	
	Result = HTTPConnector.PostJson("https://httpbin.org/post", Undefined, AdditionalParameters);
	
	УтверждениеВерно(Result["files"]["f1"], "file1");
	УтверждениеВерно(Result["files"]["f2"], "file2");
	УтверждениеВерно(Result["files"]["f3"], "data:text/plain;base64,Z0J/RgNC40LLQtdGCLCDQnNC40YA"); // Должно быть "Привет, Мир"
	УтверждениеВерно(Result["files"]["f4"], "");
	УтверждениеВерно(Result["form"]["field1"], "value1");
	УтверждениеВерно(Result["form"]["field2"], "Значение2");
	
EndProcedure

Procedure Тест_ПараметрыЗапросаТолькоКлюч() Export

	Result = HTTPConnector.GetJson("https://httpbin.org/get?key");
	УтверждениеВерно(Result["args"]["key"], "");
	
EndProcedure

Procedure Тест_ОтправкаXml() Export
	
	XML = 
	"<?xml version=""1.0"" encoding=""utf-8""?>
	|<soap:Envelope xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" xmlns:soap=""http://schemas.xmlsoap.org/soap/envelope/"">
	|  <soap:Body>
	|    <GetCursOnDate xmlns=""http://web.cbr.ru/"">
	|      <On_date>2019-07-05</On_date>
	|    </GetCursOnDate>
	|  </soap:Body>
	|</soap:Envelope>";
	
	Headers = New Map;
	Headers.Insert("Content-Type", "text/xml; charset=utf-8");
	Headers.Insert("SOAPAction", "http://web.cbr.ru/GetCursOnDate");
	Response = HTTPConnector.Post(
		"https://www.cbr.ru/DailyInfoWebServ/DailyInfo.asmx",
		XML, 
		New Structure("Headers", Headers));
	
	УтверждениеВерно(Response.StatusCode, 200);
	УтверждениеВерно(Response.Headers.Get("Content-Type"), "text/xml; charset=utf-8");
	
EndProcedure

Procedure Тест_ПрочитатьОтветКакXDTO() Export
	
	ТекстОтветXML = Тест_ПрочитатьОтветКакXDTO_ТекстОтветаXML();
	
	ПолноеИмяФайла = GetTempFileName("xml");
	
	ФайлТекст = New TextWriter(ПолноеИмяФайла, TextEncoding.UTF8); 
	ФайлТекст.WriteLine(ТекстОтветXML); 	
	ФайлТекст.Close(); 
	
	ДвоичныеДанныеОтвет = New BinaryData(ПолноеИмяФайла);
	DeleteFiles(ПолноеИмяФайла);
	
	Headers = New Map;
	Headers.Insert("Content-Type", "text/xml; charset=utf-8");
	
	ПодготовленныйОтвет = HTTPConnector.NewResponse();
	ПодготовленныйОтвет.Body = ДвоичныеДанныеОтвет;
	ПодготовленныйОтвет.Headers = Headers;
	
	ОтветXDTO = HTTPConnector.AsXDTO(ПодготовленныйОтвет);
	
	ОтветXDTO_Attachment = ОтветXDTO.Attachments.Attachment;
	
	УтверждениеВерно(TypeOf(ОтветXDTO), Type("XDTODataObject"));	
	УтверждениеВерно(ОтветXDTO.Id, "1642606");
	УтверждениеВерно(TypeOf(ОтветXDTO_Attachment), Type("XDTOList"));
	УтверждениеВерно(ОтветXDTO_Attachment.Count(), 2);		
	
EndProcedure 

Function Тест_ПрочитатьОтветКакXDTO_ТекстОтветаXML() 
	
	ТекстОтветXML = "
	|<Document>
	|<Id>1642606</Id>
	|<TypeId>65</TypeId>
	|<TypeName>Document</TypeName>
	|<DocumentTypeCode>DOCUMENT</DocumentTypeCode>
	|<Description>Document тест 00001 от 21.05.2021</Description>
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
	|<Comment>ТЕСТ Document </Comment>
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
	|        <Description>Document №ТЕСТ 00002 от 21.05.2021</Description>
	|    </DocumentRelation>
	|</Relations>
	|<StatusName>Получен</StatusName>
	|<SenderName>ООО Sender</SenderName>
	|<ReceiverName>ООО Recipient</ReceiverName>
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
	|";
	
	Return ТекстОтветXML;
	
EndFunction 

Procedure Тест_СложныеПараметрыЗапроса() Export

	Result = HTTPConnector.GetJson(
		"https://httpbin.org/anything?jql=worklogDate >= 2017-04-01 AND worklogDate <= 2017-05-01&j&i=2");
	УтверждениеВерно(Result["args"]["jql"], "worklogDate >= 2017-04-01 AND worklogDate <= 2017-05-01");
	УтверждениеВерно(Result["args"]["j"], "");
	УтверждениеВерно(Result["args"]["i"], "2");
	
EndProcedure

Procedure Тест_PostПустойJson() Export
	
	Json = New Structure;
	Result = HTTPConnector.PostJson("https://httpbin.org/post", Json);
	УтверждениеВерно(Result["url"], "https://httpbin.org/post");
	УтверждениеВерно(TypeOf(Result["json"]), Type("Map"));
	
EndProcedure

Procedure Тест_АутентификацияAWS4_HMAC_SHA256() Export
	
	Authentication = New Structure;
	Authentication.Insert("Type", "AWS4-HMAC-SHA256");
	Authentication.Insert("AccessKeyID", AccessKeyID);
	Authentication.Insert("SecretKey", SecretKey);
	Authentication.Insert("Region", Region);
	Authentication.Insert("Service", "sqs");

	URL = StrTemplate("https://sqs.%1.amazonaws.com:443%2", Region, Очередь);
	
	RequestParameters = New Map;
	RequestParameters.Insert("Action", "SendMessage");
	RequestParameters.Insert("MessageBody", "This is a test message");
	RequestParameters.Insert("MessageAttribute.1.Name", "my_attribute_name_1");
	RequestParameters.Insert("MessageAttribute.1.Value.StringValue", "my_attribute_value_1");
	RequestParameters.Insert("MessageAttribute.1.Value.DataType", "String");
	RequestParameters.Insert("MessageAttribute.2.Name", "my_attribute_name_2");
	RequestParameters.Insert("MessageAttribute.2.Value.StringValue", "my_attribute_value_2");
	RequestParameters.Insert("MessageAttribute.2.Value.DataType", "String");
	RequestParameters.Insert("Expires", "2020-05-05T22%3A52%3A43PST");
	RequestParameters.Insert("Version", "2012-11-05");
	
	AdditionalParameters = New Structure;
	AdditionalParameters.Insert("Authentication", Authentication);
	Response = HTTPConnector.Get(URL, RequestParameters, AdditionalParameters);
	
	УтверждениеВерно(Response.StatusCode, 200);
	
EndProcedure

Procedure Тест_УпаковатьGZip() Export
	
	ИсходныеДанные = GetBinaryDataFromString("Привет, Мир!", TextEncoding.UTF8, False);
	CompressedData = GetBinaryDataFromBase64String("H4sIAAAAAAAA/wEVAOr/0J/RgNC40LLQtdGCLCDQnNC40YAhilS6PhUAAAA=");
	
	УтверждениеВерно(HTTPConnector.ЗаписатьGZip(ИсходныеДанные), CompressedData);

EndProcedure

Procedure Тест_РаспаковатьGZip() Export
	
	CompressedData = GetBinaryDataFromBase64String("H4sIAAAAAAAA/wEVAOr/0J/RgNC40LLQtdGCLCDQnNC40YAhilS6PhUAAAA=");
	Data = HTTPConnector.ПрочитатьGZip(CompressedData);
	
	УтверждениеВерно(GetStringFromBinaryData(Data, TextEncoding.UTF8), "Привет, Мир!");
	
EndProcedure

Procedure Тест_АутентификацияAWS4_HMAC_SHA256_ПустоеТелоПортНеУказан() Export
	
	URL = "https://sqs.eu-north-1.amazonaws.com/123456789101/test";
	
	Authentication = New Structure;
	Authentication.Insert("Type", "AWS4-HMAC-SHA256");
	Authentication.Insert("AccessKeyID", "ACCESS_KEY");
	Authentication.Insert("SecretKey", "SECRET_KEY");
	Authentication.Insert("Region", "eu-north-1");
	Authentication.Insert("Service", "sqs");

	Headers = New Map;
	Headers.Insert("x-amz-date", "20200426T122000Z");
	
	Session = HTTPConnector.NewSession();
	Session.Headers = Headers;
	Session.Authentication = Authentication;
	
	PreparedRequest = HTTPConnector.ПодготовитьЗапрос(Session, "GET", URL, New Structure);
	
	УтверждениеВерно(PreparedRequest.Headers["x-amz-date"], "20200426T122000Z");
	УтверждениеВерно(PreparedRequest.Headers["x-amz-content-SHA256"], "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");
	УтверждениеВерно(PreparedRequest.Headers["Authorization"], "AWS4-HMAC-SHA256 Credential=ACCESS_KEY/20200426/eu-north-1/sqs/aws4_request, SignedHeaders=host;x-amz-content-SHA256;x-amz-date, Signature=ad98a02ef5df6b5337128ccdac1e5a279846c0d1c4b409e713a75dae0c9e4cb3");
	
EndProcedure

Procedure Тест_АутентификацияAWS4_HMAC_SHA256_ПустоеТелоУказанСтандартныйПорт() Export
	
	URL = "https://sqs.eu-north-1.amazonaws.com:443/123456789101/test";
	
	Authentication = New Structure;
	Authentication.Insert("Type", "AWS4-HMAC-SHA256");
	Authentication.Insert("AccessKeyID", "ACCESS_KEY");
	Authentication.Insert("SecretKey", "SECRET_KEY");
	Authentication.Insert("Region", "eu-north-1");
	Authentication.Insert("Service", "sqs");

	Headers = New Map;
	Headers.Insert("x-amz-date", "20200426T122000Z");
	
	Session = HTTPConnector.NewSession();
	Session.Headers = Headers;
	Session.Authentication = Authentication;
	
	PreparedRequest = HTTPConnector.ПодготовитьЗапрос(Session, "GET", URL, New Structure);
	
	УтверждениеВерно(PreparedRequest.Headers["x-amz-date"], "20200426T122000Z");
	УтверждениеВерно(PreparedRequest.Headers["x-amz-content-SHA256"], "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");
	УтверждениеВерно(PreparedRequest.Headers["Authorization"], "AWS4-HMAC-SHA256 Credential=ACCESS_KEY/20200426/eu-north-1/sqs/aws4_request, SignedHeaders=host;x-amz-content-SHA256;x-amz-date, Signature=ad98a02ef5df6b5337128ccdac1e5a279846c0d1c4b409e713a75dae0c9e4cb3");
	
EndProcedure

Procedure Тест_АутентификацияAWS4_HMAC_SHA256_ПустоеТелоУказанНеСтандартныйПорт() Export
	
	URL = "https://sqs.eu-north-1.amazonaws.com:444/123456789101/test";
	
	Authentication = New Structure;
	Authentication.Insert("Type", "AWS4-HMAC-SHA256");
	Authentication.Insert("AccessKeyID", "ACCESS_KEY");
	Authentication.Insert("SecretKey", "SECRET_KEY");
	Authentication.Insert("Region", "eu-north-1");
	Authentication.Insert("Service", "sqs");

	Headers = New Map;
	Headers.Insert("x-amz-date", "20200426T122000Z");
	
	Session = HTTPConnector.NewSession();
	Session.Headers = Headers;
	Session.Authentication = Authentication;
	
	PreparedRequest = HTTPConnector.ПодготовитьЗапрос(Session, "GET", URL, New Structure);
	
	УтверждениеВерно(PreparedRequest.Headers["x-amz-date"], "20200426T122000Z");
	УтверждениеВерно(PreparedRequest.Headers["x-amz-content-SHA256"], "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");
	УтверждениеВерно(PreparedRequest.Headers["Authorization"], "AWS4-HMAC-SHA256 Credential=ACCESS_KEY/20200426/eu-north-1/sqs/aws4_request, SignedHeaders=host;x-amz-content-SHA256;x-amz-date, Signature=96df4fab493e08b8a72965acf7a6d2fd651a883a2766a2b0e4c0cd113dea7d8c");
	
EndProcedure

Procedure Тест_ПовторСУчетомЗаголовкаRetryAfterDuration() Export
	
	Headers = New Map;
	Headers.Insert("X-ID", String(New UUID));
	
	AdditionalParameters = New Structure;
	AdditionalParameters.Insert("MaximumNumberOfRetries", 5);
	AdditionalParameters.Insert("ExponentialDelayRatio", 2);
	
	AdditionalParameters.Insert("Headers", Headers);
		
	URL = "http://127.0.0.1:5000/retry_after_duration";
	Response = HTTPConnector.Get(URL, Undefined, AdditionalParameters);
	УтверждениеВерно(Response.StatusCode, 200);
	
EndProcedure

Procedure Тест_ПовторСУчетомЗаголовкаRetryAfterDate() Export
	
	Headers = New Map;
	Headers.Insert("X-ID", String(New UUID));
	
	AdditionalParameters = New Structure;
	AdditionalParameters.Insert("MaximumNumberOfRetries", 5);
	AdditionalParameters.Insert("ExponentialDelayRatio", 2);
	
	AdditionalParameters.Insert("Headers", Headers);
		
	URL = "http://127.0.0.1:5000/retry_after_date";
	Response = HTTPConnector.Get(URL, Undefined, AdditionalParameters);
	УтверждениеВерно(Response.StatusCode, 200);
	
EndProcedure

Procedure Тест_ПовторПослеОшибки502() Export

	ToRetryForStatusesCodes = New Array;
	ToRetryForStatusesCodes.Add(HTTPConnector.КодыСостоянияHTTP().BadGateway_502);
	
	Headers = New Map;
	Headers.Insert("X-ID", String(New UUID));
	
	AdditionalParameters = New Structure;
	AdditionalParameters.Insert("MaximumNumberOfRetries", 5);
	AdditionalParameters.Insert("ToRetryForStatusesCodes", ToRetryForStatusesCodes);
	
	AdditionalParameters.Insert("Headers", Headers);
		
	URL = "http://127.0.0.1:5000/retry_502";
	Response = HTTPConnector.Get(URL, Undefined, AdditionalParameters);
	УтверждениеВерно(Response.StatusCode, 200);
	
EndProcedure

Procedure Тест_ПовторПослеОшибкиПодключения() Export

	ToRetryForStatusesCodes = New Array;
	ToRetryForStatusesCodes.Add(HTTPConnector.КодыСостоянияHTTP().BadGateway_502);
	
	Headers = New Map;
	Headers.Insert("X-ID", String(New UUID));
	
	AdditionalParameters = New Structure;
	AdditionalParameters.Insert("Timeout", 1);
	AdditionalParameters.Insert("MaximumNumberOfRetries", 2);
	AdditionalParameters.Insert("ToRetryForStatusesCodes", ToRetryForStatusesCodes);
	
	AdditionalParameters.Insert("Headers", Headers);
	
	Start = CurrentUniversalDateInMilliseconds();
	URL = "http://127.0.0.1:5001/non_existent_resource";
	Try
		HTTPConnector.Get(URL, Undefined, AdditionalParameters);
	Except
		Duration = CurrentUniversalDateInMilliseconds() - Start;
	EndTry;
	УтверждениеВерно(Duration >= 3000 And Duration < 7000, True);
	
EndProcedure

Procedure Тест_Ping() Export

	URL = "http://127.0.0.1:5000/ping";
	Response = HTTPConnector.Get(URL);
	УтверждениеВерно(Response.StatusCode, 200);
	
EndProcedure

Procedure Тест_ПредставлениеКодаСостоянияHTTP() Export

	УтверждениеВерно(HTTPConnector.ПредставлениеКодаСостоянияHTTP(400), "400: Bad Request");

EndProcedure

Procedure Тест_ПредставлениеНеизвестногоКодаСостоянияHTTP() Export

	Try
		HTTPConnector.ПредставлениеКодаСостоянияHTTP(488);
	Except
		ВерноеИсключение(ErrorInfo(), "Неизвестный code состояния HTTP: 488");
	EndTry;
	
EndProcedure

Procedure Тест_КорректноеИсключениеВМетодеКакJson() Export

	Try
		HTTPConnector.GetJson("https://en.wikipedia.org/wiki/1C_Company#Products");
	Except
		ВерноеИсключение(ErrorInfo(), "1C Company");
	EndTry;
	
EndProcedure

Procedure Тест_ОтправкаЗапросаПортитПереданныеНастройки_GitHub_Issue_33() Export
	
	Settings = New Structure; 
	Headers = New Map;
	Headers.Insert("Content-Type","application/json");
	Settings.Insert("Headers", Headers);
	
	RequestParameters = New Structure("username, password", "anonymous", "hrgesf7HDR67Bd");
	
	НастройкиКопияДоОтправки = ValueFromStringInternal(ValueToStringInternal(Settings));
	
	HTTPConnector.Post("https://jsonplaceholder.typicode.com/posts", RequestParameters, Settings);
	
	УтверждениеВерно(HTTPConnector.ObjectToJson(Settings), HTTPConnector.ObjectToJson(НастройкиКопияДоОтправки));
	
EndProcedure

#EndRegion

Function ИзвлечьExecution(Response)
	
	HTML = HTTPConnector.AsText(Response);
	
	Start = StrFind(HTML, "name=""execution""");
	Конец = StrFind(HTML, ">", SearchDirection.FromBegin, Start);
	КороткаяСтрока = Mid(HTML, Start, Конец - Start);
	
	Start = StrFind(КороткаяСтрока, "value=""") + StrLen("value=""");
	Конец = StrFind(КороткаяСтрока, """", SearchDirection.FromBegin, Start); 
	
	Return Mid(КороткаяСтрока, Start, Конец - Start);
	
EndFunction

Function ПосчитатьMD5(Data)
	
	Hashing = New DataHashing(HashFunction.MD5);
	Hashing.Append(Data);
	
	Return Lower(GetHexStringFromBinaryData(Hashing.HashSum));
	
EndFunction

Procedure УтверждениеВерно(ЛевоеЗначение, ПравоеЗначение, Пояснение = "")
	
	If ЛевоеЗначение <> ПравоеЗначение Then
		Raise(StrTemplate("<%1> не equalsign <%2>: %3", ЛевоеЗначение, ПравоеЗначение, Пояснение));
	EndIf;
	
EndProcedure

Procedure ВерноеИсключение(ИнформацияОбОшибке, ОжидаемоеИсключение)
	
	ExceptionText = DetailErrorDescription(ИнформацияОбОшибке);
	If TypeOf(ОжидаемоеИсключение) = Type("Array") Then
		ТекстНайден = False;
		For Each Элемент In ОжидаемоеИсключение Do
			If StrFind(ExceptionText, Элемент) Then
				ТекстНайден = True;
				Break;
			EndIf;
		EndDo;
		
		If Not ТекстНайден Then
			Raise(ExceptionText);
		EndIf;
	Else
		If Not StrFind(ExceptionText, ОжидаемоеИсключение) Then
			Raise(ExceptionText);
		EndIf;
	EndIf;
	
EndProcedure

#EndRegion

#EndIf
