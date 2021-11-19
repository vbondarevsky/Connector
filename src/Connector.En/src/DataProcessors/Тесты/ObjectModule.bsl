// BSLLS-off
#If Server Or ThickClientOrdinaryApplication Or ExternalConnection Then

#Region ПрограммныйИнтерфейс

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
	
	СтруктураURL = КоннекторHTTP.РазобратьURL(
		"https://httpbin.org/anything?jql=worklogDate >= 2017-04-01 AND worklogDate <= 2017-05-01&j&i=2");
	
	УтверждениеВерно(СтруктураURL.Schema, "https");
	УтверждениеВерно(СтруктураURL.Server, "httpbin.org");
	УтверждениеВерно(СтруктураURL.Path, "/anything");
	УтверждениеВерно(СтруктураURL.Port, 0);
	УтверждениеВерно(СтруктураURL.Particle, "");
	УтверждениеВерно(СтруктураURL.Аутентификация.User, "");
	УтверждениеВерно(СтруктураURL.Аутентификация.Password, "");
	УтверждениеВерно(СтруктураURL.QueryOptions["jql"], "worklogDate >= 2017-04-01 AND worklogDate <= 2017-05-01");
	УтверждениеВерно(СтруктураURL.QueryOptions["j"], Undefined);
	УтверждениеВерно(СтруктураURL.QueryOptions["i"], "2");
	
EndProcedure

Procedure Тест_РазобратьURLСПараметромЗапросаБезЗначения() Export
	
	СтруктураURL = КоннекторHTTP.РазобратьURL("https://httpbin.org/get?key");
	
	УтверждениеВерно(СтруктураURL.Schema, "https");
	УтверждениеВерно(СтруктураURL.Server, "httpbin.org");
	УтверждениеВерно(СтруктураURL.Path, "/get");
	УтверждениеВерно(СтруктураURL.Port, 0);
	УтверждениеВерно(СтруктураURL.Particle, "");
	УтверждениеВерно(СтруктураURL.Аутентификация.User, "");
	УтверждениеВерно(СтруктураURL.Аутентификация.Password, "");
	УтверждениеВерно(СтруктураURL.QueryOptions["key"], Undefined);
	
EndProcedure

Procedure Тест_РазобратьURLСЯвноЗаданнымПортом() Export
	
	СтруктураURL = КоннекторHTTP.РазобратьURL("https://httpbin.org:443/get?key");
	
	УтверждениеВерно(СтруктураURL.Schema, "https");
	УтверждениеВерно(СтруктураURL.Server, "httpbin.org");
	УтверждениеВерно(СтруктураURL.Path, "/get");
	УтверждениеВерно(СтруктураURL.Port, 443);
	УтверждениеВерно(СтруктураURL.Particle, "");
	УтверждениеВерно(СтруктураURL.Аутентификация.User, "");
	УтверждениеВерно(СтруктураURL.Аутентификация.Password, "");
	УтверждениеВерно(СтруктураURL.QueryOptions["key"], Undefined);
	
EndProcedure

Procedure Тест_РазобратьURLСПараметрамиЗапросаСНесколькимиЗначениями() Export
	
	СтруктураURL = КоннекторHTTP.РазобратьURL("http://httpbin.org/anything?i=v1&j=w1&j=w2&i=v2&i=v3");
	
	УтверждениеВерно(СтруктураURL.Schema, "http");
	УтверждениеВерно(СтруктураURL.Server, "httpbin.org");
	УтверждениеВерно(СтруктураURL.Path, "/anything");
	УтверждениеВерно(СтруктураURL.Port, 0);
	УтверждениеВерно(СтруктураURL.Particle, "");
	УтверждениеВерно(СтруктураURL.Аутентификация.User, "");
	УтверждениеВерно(СтруктураURL.Аутентификация.Password, "");
	УтверждениеВерно(StrConcat(СтруктураURL.QueryOptions["i"], ", "), "v1, v2, v3");
	УтверждениеВерно(StrConcat(СтруктураURL.QueryOptions["j"], ", "), "w1, w2");
	
EndProcedure

Procedure Тест_РазобратьURLСФрагментом() Export
	
	СтруктураURL = КоннекторHTTP.РазобратьURL("https://en.wikipedia.org/wiki/1C_Company#Products");
	
	УтверждениеВерно(СтруктураURL.Schema, "https");
	УтверждениеВерно(СтруктураURL.Server, "en.wikipedia.org");
	УтверждениеВерно(СтруктураURL.Path, "/wiki/1C_Company");
	УтверждениеВерно(СтруктураURL.Port, 0);
	УтверждениеВерно(СтруктураURL.Particle, "Products");
	УтверждениеВерно(СтруктураURL.Аутентификация.User, "");
	УтверждениеВерно(СтруктураURL.Аутентификация.Password, "");
	УтверждениеВерно(СтруктураURL.QueryOptions.Count(), 0);
	
EndProcedure

Procedure Тест_РазобратьURLСХостомВФорматеIPv6() Export
	
	СтруктураURL = КоннекторHTTP.РазобратьURL("http://[2001:0db8:11a3:09d7:1f34:8a2e:07a0:765d]:8080/test");
	
	УтверждениеВерно(СтруктураURL.Schema, "http");
	УтверждениеВерно(СтруктураURL.Server, "[2001:0db8:11a3:09d7:1f34:8a2e:07a0:765d]");
	УтверждениеВерно(СтруктураURL.Path, "/test");
	УтверждениеВерно(СтруктураURL.Port, 8080);
	УтверждениеВерно(СтруктураURL.Particle, "");
	УтверждениеВерно(СтруктураURL.Аутентификация.User, "");
	УтверждениеВерно(СтруктураURL.Аутентификация.Password, "");
	УтверждениеВерно(СтруктураURL.QueryOptions.Count(), 0);
	
EndProcedure

Procedure Тест_РазобратьПростойURL() Export
	
	СтруктураURL = КоннекторHTTP.РазобратьURL("http://1c.ru");
	
	УтверждениеВерно(СтруктураURL.Schema, "http");
	УтверждениеВерно(СтруктураURL.Server, "1c.ru");
	УтверждениеВерно(СтруктураURL.Path, "/");
	УтверждениеВерно(СтруктураURL.Port, 0);
	УтверждениеВерно(СтруктураURL.Particle, "");
	УтверждениеВерно(СтруктураURL.Аутентификация.User, "");
	УтверждениеВерно(СтруктураURL.Аутентификация.Password, "");
	УтверждениеВерно(СтруктураURL.QueryOptions.Count(), 0);
	
EndProcedure

Procedure Тест_РазобратьURLСЗакодированнымURLВПараметре() Export
	
	СтруктураURL = КоннекторHTTP.РазобратьURL(
		"https://www.example.ru?url=http%3A%2F%2Fwww.kuku.ru%2F%3Fs%3D1%26b%3D2&OTHER=1");
	
	УтверждениеВерно(СтруктураURL.Schema, "https");
	УтверждениеВерно(СтруктураURL.Server, "www.example.ru");
	УтверждениеВерно(СтруктураURL.Path, "/");
	УтверждениеВерно(СтруктураURL.Port, 0);
	УтверждениеВерно(СтруктураURL.Particle, "");
	УтверждениеВерно(СтруктураURL.Аутентификация.User, "");
	УтверждениеВерно(СтруктураURL.Аутентификация.Password, "");
	УтверждениеВерно(СтруктураURL.QueryOptions.Count(), 2);
	УтверждениеВерно(СтруктураURL.QueryOptions["url"], "http://www.kuku.ru/?s=1&b=2");
	УтверждениеВерно(СтруктураURL.QueryOptions["OTHER"], "1");
	
EndProcedure

Procedure Тест_РазобратьURLСИменемПользователяИПаролем() Export

	СтруктураURL = КоннекторHTTP.РазобратьURL("http://user:pass@1c.ru");

	УтверждениеВерно(СтруктураURL.Schema, "http");
	УтверждениеВерно(СтруктураURL.Server, "1c.ru");
	УтверждениеВерно(СтруктураURL.Path, "/");
	УтверждениеВерно(СтруктураURL.Port, 0);
	УтверждениеВерно(СтруктураURL.Particle, "");
	УтверждениеВерно(СтруктураURL.Аутентификация.User, "user");
	УтверждениеВерно(СтруктураURL.Аутентификация.Password, "pass");
	УтверждениеВерно(СтруктураURL.QueryOptions.Count(), 0);

EndProcedure

Procedure Тест_РазобратьURLСИменемПользователяБезПароля() Export

	СтруктураURL = КоннекторHTTP.РазобратьURL("http://user@1c.ru");

	УтверждениеВерно(СтруктураURL.Schema, "http");
	УтверждениеВерно(СтруктураURL.Server, "1c.ru");
	УтверждениеВерно(СтруктураURL.Path, "/");
	УтверждениеВерно(СтруктураURL.Port, 0);
	УтверждениеВерно(СтруктураURL.Particle, "");
	УтверждениеВерно(СтруктураURL.Аутентификация.User, "user");
	УтверждениеВерно(СтруктураURL.Аутентификация.Password, "");
	УтверждениеВерно(СтруктураURL.QueryOptions.Count(), 0);

EndProcedure

Procedure Тест_HMAC() Export
	
	Ключ = GetBinaryDataFromString("Секретный key", TextEncoding.UTF8, False);
	КлючБольше64 = GetBinaryDataFromString(
		"1234567890123456789012345678901234567890123456789012345678901234567890", TextEncoding.UTF8, False);
	
	ПустыеДанные = GetBinaryDataFromString("", TextEncoding.UTF8, False);
	Данные = GetBinaryDataFromString("Какие-то data", TextEncoding.UTF8, False);
	
	УтверждениеВерно(
		КоннекторHTTP.HMAC(Ключ, ПустыеДанные, HashFunction.MD5), 
		GetBinaryDataFromHexString("1b1ec4166a11c03b3afefaea442e7709"));
	УтверждениеВерно(
		КоннекторHTTP.HMAC(КлючБольше64, Данные, HashFunction.MD5), 
		GetBinaryDataFromHexString("ed5b2d6b9f573cd46e8f8d1d1e8b70e3"));
		
	УтверждениеВерно(
		КоннекторHTTP.HMAC(Ключ, ПустыеДанные, HashFunction.SHA1), 
		GetBinaryDataFromHexString("355aa0587050d711f4ca9af6930c736363a88d34"));
	УтверждениеВерно(
		КоннекторHTTP.HMAC(КлючБольше64, Данные, HashFunction.SHA1), 
		GetBinaryDataFromHexString("7e8f9d7ebbe81e508a39f410e157fc6e714b3371"));
		
	УтверждениеВерно(
		КоннекторHTTP.HMAC(Ключ, ПустыеДанные, HashFunction.SHA256),
		GetBinaryDataFromHexString("70907d03476d72b7276897718590a49f6ce56991112fb5a0e9ed41652b2aab6c"));
	УтверждениеВерно(
		КоннекторHTTP.HMAC(КлючБольше64, Данные, HashFunction.SHA256),
		GetBinaryDataFromHexString("80be8107de7879f028c8bfe97e10b859785530dd19dfc41a4d6962ce4c2fc130"));

EndProcedure

Procedure Тест_СоединениеЧерезПрокси() Export
	
	Прокси = New InternetProxy;
	Прокси.Set("http", ПроксиСервер, ПроксиПорт);
	КоннекторHTTP.GetJson("http://httpbin.org/headers", Undefined, New Structure("Proxy", Прокси));

EndProcedure

Procedure Тест_ПараметрыЗаписиJson() Export
	
	ПараметрыЗаписиJSON = New Structure("NewLines", JSONLineBreak.None);
	Json = New Structure;
	Json.Insert("field", "value");
	Json.Insert("field2", "value2");
	Результат = КоннекторHTTP.PostJson("http://httpbin.org/anything", Json, New Structure("ПараметрыЗаписиJSON", ПараметрыЗаписиJSON));
	УтверждениеВерно(Результат["data"], "{""field"":""value"",""field2"":""value2""}");
	
EndProcedure

Procedure Тест_URLБезСхемы() Export
	
	Ответ = КоннекторHTTP.Get("httpbin.org/get");
	КоннекторHTTP.КакJson(Ответ);
 	УтверждениеВерно(Ответ.URL, "http://httpbin.org/get");
	
EndProcedure

Procedure Тест_ПередачаПараметровВСтрокуЗапроса() Export
	
	ПараметрыЗапроса = New Structure;
	ПараметрыЗапроса.Insert("name", StrSplit("Иванов,Петров", ","));
	ПараметрыЗапроса.Insert("salary", Format(100000, "NG="));
	ПараметрыЗапроса.Insert("time", "01:47");
	
	Ответ = КоннекторHTTP.Get("https://httpbin.org/anything/params", ПараметрыЗапроса);	
	Результат = КоннекторHTTP.КакJson(Ответ);
	
	УтверждениеВерно(Ответ.URL, "https://httpbin.org/anything/params?name=%D0%98%D0%B2%D0%B0%D0%BD%D0%BE%D0%B2&name=%D0%9F%D0%B5%D1%82%D1%80%D0%BE%D0%B2&salary=100000&time=01%3A47");
	УтверждениеВерно(Результат["url"], "https://httpbin.org/anything/params?name=Иванов&name=Петров&salary=100000&time=01%3A47");
	УтверждениеВерно(Результат["args"]["salary"], "100000");
	УтверждениеВерно(StrConcat(Результат["args"]["name"], ","), "Иванов,Петров");
	УтверждениеВерно(Результат["args"]["time"], "01:47");
	
EndProcedure

Procedure Тест_ПередачаПараметровВСтрокуЗапросаКомбинированный() Export
	
	ПараметрыЗапроса = New Structure;
	ПараметрыЗапроса.Insert("name", StrSplit("Иванов,Петров", ","));
	ПараметрыЗапроса.Insert("salary", Format(100000, "NG="));
	
	Результат = КоннекторHTTP.GetJson("https://httpbin.org/anything/params?post=Программист", ПараметрыЗапроса);	
	
	УтверждениеВерно(Результат["args"]["salary"], "100000");
	УтверждениеВерно(Результат["args"]["post"], "Программист");
	УтверждениеВерно(StrConcat(Результат["args"]["name"], ","), "Иванов,Петров");
	
EndProcedure

Procedure Тест_РезультатКакJsonGet() Export
	
	Результат = КоннекторHTTP.GetJson("https://httpbin.org/get");
	УтверждениеВерно(Результат["url"], "https://httpbin.org/get");
	
EndProcedure

Procedure Тест_РезультатКакJsonPost() Export
	
	Результат = КоннекторHTTP.КакJson(КоннекторHTTP.Post("https://httpbin.org/post"));
	УтверждениеВерно(Результат["url"], "https://httpbin.org/post");
	
EndProcedure

Procedure Тест_РезультатКакДвоичныеДанные() Export
	
	Результат = КоннекторHTTP.КакДвоичныеДанные(КоннекторHTTP.Get("http://httpbin.org/image/png"));
	
	УтверждениеВерно(TypeOf(Результат), Type("BinaryData"));
	УтверждениеВерно(ПосчитатьMD5(Результат), "5cca6069f68fbf739fce37e0963f21e7");
	
EndProcedure

Procedure Тест_РезультатКакТекст() Export
	
	Результат = КоннекторHTTP.КакТекст(КоннекторHTTP.Get("http://httpbin.org/encoding/utf8"));
	УтверждениеВерно(StrFind(Результат, "Зарегистрируйтесь сейчас на Десятую Международную"), 3931);
	
EndProcedure

Procedure Тест_ПередачаПроизвольныхЗаголовков() Export
	
	Заголовки = New Map;
	Заголовки.Insert("X-My-Header", "Hello");
	Результат = КоннекторHTTP.GetJson("http://httpbin.org/headers", Undefined, New Structure("Headers", Заголовки));
	
	УтверждениеВерно(Результат["headers"]["X-My-Header"], "Hello");
	
EndProcedure

Procedure Тест_ОтправкаДанныхФормы() Export
	
	Данные = New Structure;
	Данные.Insert("comments", "Постучать в дверь");
	Данные.Insert("custemail", "vasya@mail.ru");
	Данные.Insert("custname", "Вася");
	Данные.Insert("custtel", "112");
	Данные.Insert("delivery", "20:20");
	Данные.Insert("size", "medium");
	Данные.Insert("topping", StrSplit("bacon,mushroom", ","));
	
	Ответ = КоннекторHTTP.Post("http://httpbin.org/post", Данные);
	УтверждениеВерно(Ответ.URL, "http://httpbin.org/post");
	Результат = КоннекторHTTP.КакJson(Ответ);
	УтверждениеВерно(Результат["form"]["size"], "medium");
	УтверждениеВерно(Результат["form"]["comments"], "Постучать в дверь");
	УтверждениеВерно(Результат["form"]["custemail"], "vasya@mail.ru");
	УтверждениеВерно(Результат["form"]["delivery"], "20:20");
	УтверждениеВерно(Результат["form"]["custtel"], "112");	
	
EndProcedure

Procedure Тест_ОтправкаJson() Export
	
	Json = New Structure;
	Json.Insert("Сотрудник", "Иванов Иван Петрович");
	Json.Insert("JobTitle", "Разнорабочий");
	
	Результат = КоннекторHTTP.PostJson("http://httpbin.org/post", Json);
	
	УтверждениеВерно(Результат["json"]["Сотрудник"], "Иванов Иван Петрович");
	УтверждениеВерно(Результат["json"]["JobTitle"], "Разнорабочий");
	
	Результат = КоннекторHTTP.PutJson("http://httpbin.org/put", Json);
	УтверждениеВерно(Результат["json"]["Сотрудник"], "Иванов Иван Петрович");
	УтверждениеВерно(Результат["json"]["JobTitle"], "Разнорабочий");
	
EndProcedure

Procedure Тест_Таймаут() Export
	
	Try
		КоннекторHTTP.Get("https://httpbin.org/delay/10", Undefined, New Structure("Timeout", 1));
	Except
		ВерноеИсключение(ErrorInfo(), StrSplit("Превышено time ожидания|Timeout exceeded", "|"));
	EndTry;
	
EndProcedure

Procedure Тест_ПолучитьGZip() Export
	
	Результат = КоннекторHTTP.GetJson("http://httpbin.org/gzip");
	УтверждениеВерно(Результат["gzipped"], True);
	
EndProcedure

Procedure Тест_ОтправитьGZip() Export
	
	Json = New Structure;
	Json.Insert("field", "value");
	Json.Insert("field2", "value2");
	Заголовки = New Map;
	Заголовки.Insert("Content-Encoding", "gzip");
	Результат = КоннекторHTTP.PostJson("http://httpbin.org/anything", Json, New Structure("Headers", Заголовки));
	
	ТелоЗапроса = GetBinaryDataFromBase64String(StrSplit(Результат["data"], ",")[1]);
	ИсходноеЗначение = КоннекторHTTP.JsonВОбъект(КоннекторHTTP.ПрочитатьGZip(ТелоЗапроса));
	
	УтверждениеВерно(Результат["headers"]["Content-Encoding"], "gzip");
	УтверждениеВерно(ИсходноеЗначение["field"], Json["field"]);
	УтверждениеВерно(ИсходноеЗначение["field2"], Json["field2"]);
	
EndProcedure

Procedure Тест_BasicAuth() Export
	
	Результат = КоннекторHTTP.GetJson("https://user:pass@httpbin.org/basic-auth/user/pass");
	УтверждениеВерно(Результат["authenticated"], True);
	УтверждениеВерно(Результат["user"], "user");

	Аутентификация = New Structure("User, Password", "user", "pass");
	Результат = КоннекторHTTP.GetJson(
		"https://httpbin.org/basic-auth/user/pass",
		Undefined,
		New Structure("Аутентификация", Аутентификация));
	УтверждениеВерно(Результат["authenticated"], True);
	УтверждениеВерно(Результат["user"], "user");

	Аутентификация = New Structure("User, Password, Type", "user", "pass", "Basic");
	Результат = КоннекторHTTP.GetJson(
		"https://httpbin.org/basic-auth/user/pass",
		Undefined,
		New Structure("Аутентификация", Аутентификация));
	УтверждениеВерно(Результат["authenticated"], True);
	УтверждениеВерно(Результат["user"], "user");
	
EndProcedure

Procedure Тест_DigestAuth() Export
	
	Аутентификация = New Structure("User, Password, Type", "user", "pass", "Digest");
	Результат = КоннекторHTTP.GetJson(
		"https://httpbin.org/digest-auth/auth/user/pass",
		Undefined,
		New Structure("Аутентификация", Аутентификация));
	УтверждениеВерно(Результат["authenticated"], True);
	УтверждениеВерно(Результат["user"], "user");
	
	Аутентификация = New Structure("User, Password, Type", "guest", "guest", "Digest");
	Результат = КоннекторHTTP.Get(
		"https://jigsaw.w3.org/HTTP/Digest/",
		Undefined,
		New Structure("Аутентификация", Аутентификация));
	УтверждениеВерно(Результат.StatusCode, 200);
	
EndProcedure

Procedure Тест_GetJson() Export
	
	Результат = КоннекторHTTP.GetJson("https://httpbin.org/get");
	УтверждениеВерно(Результат["url"], "https://httpbin.org/get");
	
EndProcedure

Procedure Тест_GetJsonСтруктура() Export
	
	ПараметрыПреобразованияJSON = New Structure("ПрочитатьВСоответствие", False);
	Результат = КоннекторHTTP.GetJson(
		"http://httpbin.org/json", Undefined, New Structure("ПараметрыПреобразованияJSON", ПараметрыПреобразованияJSON));
	УтверждениеВерно(Результат.slideshow.author, "Yours Truly");
	УтверждениеВерно(Результат.slideshow.date, "date of publication");
	УтверждениеВерно(Результат.slideshow.slides.Count(), 2);
	УтверждениеВерно(Результат.slideshow.title, "Sample Slide Show");
	
EndProcedure

Procedure Тест_PostJson() Export
	
	ПараметрыПреобразованияJSON = New Structure;
	ПараметрыПреобразованияJSON.Insert("ИменаСвойствСоЗначениямиДата", "Date");
	
	Json = New Structure;
	Json.Insert("Date", '20190121002400');
	Json.Insert("Number", 5);
	Json.Insert("Boolean", True);
	Json.Insert("String", "Привет");
		
	Результат = КоннекторHTTP.PostJson(
		"https://httpbin.org/post", 
		Json, 
		New Structure("ПараметрыПреобразованияJSON", ПараметрыПреобразованияJSON));
	УтверждениеВерно(Результат["url"], "https://httpbin.org/post");
	УтверждениеВерно(Результат["json"]["Date"], '20190121002400');
	УтверждениеВерно(Результат["json"]["Number"], 5);
	УтверждениеВерно(Результат["json"]["Boolean"], True);
	УтверждениеВерно(Результат["json"]["String"], "Привет");
	
EndProcedure

Procedure Тест_ПроверкаПреобразованияВариантаЗаписиДатыJSON() Export

	УниверсальнаяКонтрольнаяДата = CurrentUniversalDate();
	ЛокальнаяКонтрольнаяДата = ToLocalTime(УниверсальнаяКонтрольнаяДата, TimeZone());
	Json = New Structure;
	Json.Insert("Date", ЛокальнаяКонтрольнаяДата);

	ПараметрыJSON = New Structure;
	ПараметрыJSON.Insert("ВариантЗаписиДатыJSON", PredefinedValue("ВариантЗаписиДатыJSON.UniversalDate"));

	Результат = КоннекторHTTP.PostJson(
		"https://httpbin.org/post",
		Json,
		New Structure("ПараметрыПреобразованияJSON", ПараметрыJSON));

	УтверждениеВерно(Результат["json"]["Date"], Format(УниверсальнаяКонтрольнаяДата, "DF=yyyy-MM-ddTHH:mm:ssZ"));

EndProcedure

Procedure Тест_ПроверкаПреобразованияВJsonНеСериализуемыхЗначений() Export

	Json = New Structure;
	Json.Insert("UUID", New UUID("be4ee795-7f5e-4d1a-be43-a6d6902f5cfd"));
	Json.Insert("BinaryData", GetBinaryDataFromString("test", "utf-8", False));

	ПараметрыJSON = New Structure;
	ПараметрыJSON.Insert("ИмяФункцииПреобразования", "ПреобразованиеJson");
	ПараметрыJSON.Insert("МодульФункцииПреобразования", КоннекторHTTP);

	Результат = КоннекторHTTP.PostJson(
		"https://httpbin.org/post",
		Json,
		New Structure("ПараметрыПреобразованияJSON", ПараметрыJSON));

	УтверждениеВерно(Результат["json"]["UUID"], "be4ee795-7f5e-4d1a-be43-a6d6902f5cfd");
	УтверждениеВерно(Результат["json"]["BinaryData"], "dGVzdA==");

EndProcedure

Procedure Тест_ПроверкаВосстановленияНеподдерживаемыхТиповЗначений() Export

	UUID = New UUID("be4ee795-7f5e-4d1a-be43-a6d6902f5cfd");
	BinaryData = GetBinaryDataFromString("test", "utf-8", False);

	Json = New Structure;
	Json.Insert("UUID", String(UUID));
	Json.Insert("BinaryData", GetBase64StringFromBinaryData(BinaryData));
	Json.Insert("ДругиеДанные", 1);

	ПараметрыJSON = New Structure;
	ПараметрыJSON.Insert("МодульФункцииВосстановления", КоннекторHTTP);
	ПараметрыJSON.Insert("ИмяФункцииВосстановления", "ВосстановлениеJson");
	ТипыСвойств = New Map;
	ТипыСвойств.Insert("UUID", Type("UUID"));
	ТипыСвойств.Insert("BinaryData", Type("BinaryData"));
	ПараметрыJSON.Insert("ДополнительныеПараметрыФункцииВосстановления", ТипыСвойств);
	ПараметрыJSON.Insert("ИменаСвойствДляОбработкиВосстановления", StrSplit("UUID,BinaryData", ","));

	Результат = КоннекторHTTP.PostJson(
		"https://httpbin.org/post",
		Json,
		New Structure("ПараметрыПреобразованияJSON", ПараметрыJSON));

	УтверждениеВерно(Результат["json"]["UUID"], UUID);
	УтверждениеВерно(Результат["json"]["BinaryData"], BinaryData);
	УтверждениеВерно(Результат["json"]["ДругиеДанные"], 1);

EndProcedure

Procedure Тест_PostИРедирект() Export
	
	Ответ = КоннекторHTTP.Get("https://httpbin.org/redirect-to?url=https%3A%2F%2Fya.ru&status_code=301");
	УтверждениеВерно(Ответ.StatusCode, 200);
	
	Ответ = КоннекторHTTP.Post("https://httpbin.org/redirect-to?url=https%3A%2F%2Fya.ru&status_code=301");
	УтверждениеВерно(Ответ.StatusCode, 403);
	
EndProcedure

Procedure Тест_PutJson() Export
	
	Результат = КоннекторHTTP.PutJson("https://httpbin.org/put", New Structure("Название", "КоннекторHTTP"));
	УтверждениеВерно(Результат["url"], "https://httpbin.org/put");
	УтверждениеВерно(Результат["json"]["Название"], "КоннекторHTTP");
	
EndProcedure

Procedure Тест_DeleteJson() Export
	
	Результат = КоннекторHTTP.DeleteJson("https://httpbin.org/delete", New Structure("Название", "КоннекторHTTP"));
	УтверждениеВерно(Результат["url"], "https://httpbin.org/delete");
	УтверждениеВерно(Результат["json"]["Название"], "КоннекторHTTP");
	
EndProcedure

Procedure Тест_GetУспешныйРедиректОтносительныйАдрес() Export
	
	Ответ = КоннекторHTTP.Get("https://httpbin.org/relative-redirect/6");
	Результат = КоннекторHTTP.КакJson(Ответ);
	
	УтверждениеВерно(Ответ.StatusCode, 200);
	УтверждениеВерно(Результат["url"], "https://httpbin.org/get");
	
EndProcedure

Procedure Тест_GetУспешныйРедиректАбсолютныйАдрес() Export
	
	Ответ = КоннекторHTTP.Get("http://httpbin.org/absolute-redirect/6");
	Результат = КоннекторHTTP.КакJson(Ответ);
	
	УтверждениеВерно(Ответ.StatusCode, 200);
	УтверждениеВерно(Результат["url"], "http://httpbin.org/get");
	
EndProcedure

Procedure Тест_GetЗацикленныйРедирект() Export
	
	Try
		КоннекторHTTP.КакJson(КоннекторHTTP.Get("http://httpbin.org/redirect/31"));
	Except
		ВерноеИсключение(ErrorInfo(), "СлишкомМногоПеренаправлений");
	EndTry;
	
EndProcedure

Procedure Тест_GetОтключенныйРедирект() Export
	
	Параметры = New Structure("РазрешитьПеренаправление", False);
	Ответ = КоннекторHTTP.Get(
		"http://httpbin.org/redirect-to?url=http%3A%2F%2Fhttpbin.org%2Fget&status_code=307",
		Undefined,
		Параметры);
	
	УтверждениеВерно(Ответ.StatusCode, 307);
	
EndProcedure

Procedure Тест_РедиректСУказаниемURL() Export
	
	ПараметрыЗапроса = New Structure;
	ПараметрыЗапроса.Insert("url", "https://httpbin.org:443/anything");
	ПараметрыЗапроса.Insert("status_code", "307");

	Ответ = КоннекторHTTP.Get("http://httpbin.org:80/redirect-to", ПараметрыЗапроса);
	КоннекторHTTP.КакJson(Ответ);

	УтверждениеВерно(Ответ.StatusCode, 200);
	УтверждениеВерно(Ответ.URL, "https://httpbin.org:443/anything");
	
EndProcedure

Procedure Тест_Ошибка404() Export
	
	Ответ = КоннекторHTTP.Get("http://httpbin.org/status/404");
	
	УтверждениеВерно(Ответ.StatusCode, 404);
	
EndProcedure

Procedure Тест_РаботаССессиями() Export
	
	Сессия = КоннекторHTTP.СоздатьСессию();
	
	КоннекторHTTP.Get("https://httpbin.org/cookies/set/key/value", Undefined, Undefined, Сессия);
	Результат = КоннекторHTTP.GetJson("https://httpbin.org/cookies", Undefined, Undefined, Сессия);
	
	УтверждениеВерно(Результат["cookies"]["key"], "value"); 
	
EndProcedure

Procedure Тест_ПолучениеСпискаРелизовВСайта1С() Export
	
	Сессия = КоннекторHTTP.СоздатьСессию();
	Ответ = КоннекторHTTP.Get("https://releases.1c.ru/total", Undefined, Undefined, Сессия);
	
	Данные = New Structure;
	Данные.Insert("execution", ИзвлечьExecution(Ответ));
	Данные.Insert("username", Логин);
	Данные.Insert("password", Пароль);
	Данные.Insert("_eventId", "submit");
	Данные.Insert("geolocation", "");
	Данные.Insert("submit", "Войти");
	Данные.Insert("rememberMe", "on");
	
	Ответ = КоннекторHTTP.Post(Ответ.URL, Данные, Undefined, Сессия);
	
	УтверждениеВерно(Ответ.URL, "https://releases.1c.ru/total");
	УтверждениеВерно(Ответ.StatusCode, 200);
	
EndProcedure

Procedure Тест_Options() Export
	
	Ответ = КоннекторHTTP.Options("http://httpbin.org/anything");
	
	УтверждениеВерно(Ответ.StatusCode, 200);
	
EndProcedure

Procedure Тест_Head() Export
	
	Ответ = КоннекторHTTP.Head("http://httpbin.org/anything");
	
	УтверждениеВерно(Ответ.StatusCode, 200);
	
EndProcedure

Procedure Тест_Delete() Export
	
	Ответ = КоннекторHTTP.Delete("http://httpbin.org/delete");
	
	УтверждениеВерно(Ответ.StatusCode, 200);
	
EndProcedure

Procedure Тест_Patch() Export
	
	Ответ = КоннекторHTTP.Patch("http://httpbin.org/patch");
	
	УтверждениеВерно(Ответ.StatusCode, 200);
	
EndProcedure

Procedure Тест_ПроизвольныйМетод() Export
	
	Ответ = КоннекторHTTP.ВызватьМетод("PATCH", "http://httpbin.org/patch");
	
	УтверждениеВерно(Ответ.StatusCode, 200);
	
EndProcedure

Procedure Тест_УстановкаCookies() Export
	
	Результат = КоннекторHTTP.GetJson(
		"http://httpbin.org/cookies/set?PHPSESSID=72a68cc1e55&cookie1=1&cookie2=2&other=test");
	
	УтверждениеВерно(Результат["cookies"]["PHPSESSID"], "72a68cc1e55");
	УтверждениеВерно(Результат["cookies"]["cookie1"], "1");
	УтверждениеВерно(Результат["cookies"]["cookie2"], "2");
	УтверждениеВерно(Результат["cookies"]["other"], "test");
	
EndProcedure

Procedure Тест_ОтправитьCookies() Export
	
	Cookies = New Array;
	Cookies.Add(New Structure("Description,Value", "k1", String(New UUID)));
	Cookies.Add(New Structure("Description,Value", "k2", String(New UUID)));
	Ответ = КоннекторHTTP.Get("http://httpbin.org/cookies",, New Structure("Cookies", Cookies));
	Результат = КоннекторHTTP.КакJson(Ответ);
	
	УтверждениеВерно(Результат["cookies"]["k1"], Cookies[0].Value);
	УтверждениеВерно(Результат["cookies"]["k2"], Cookies[1].Value);
	
EndProcedure

Procedure Тест_POST_MultipartFormData_ТолькоФайл() Export
	
	Файлы = New Structure;
	Файлы.Insert("Name", "f1");
	Файлы.Insert("FileName", "file1.txt");
	Файлы.Insert("Data", Base64Value("0J/RgNC40LLQtdGCLCDQnNC40YA="));
	Файлы.Insert("Type", "text/plain");
	
	Результат = КоннекторHTTP.PostJson("https://httpbin.org/post", Undefined, New Structure("Файлы", Файлы));
	
	УтверждениеВерно(Результат["files"]["f1"], "Привет, Мир");
	
EndProcedure

Procedure Тест_POST_MultipartFormData_ФайлыИПоляФормы() Export
	
	Файлы = New Array;
	Файлы.Add(New Structure("Name,Data,FileName", "f1", Base64Value("ZmlsZTE="), "file1.txt"));
	Файлы.Add(New Structure("Name,Data,FileName", "f2", Base64Value("ZmlsZTI="), "file2.txt"));
	
	Данные = New Structure("field1,field2", "value1", "Значение2");
	
	Результат = КоннекторHTTP.PostJson("https://httpbin.org/post", Undefined, New Structure("Файлы,Data", Файлы, Данные));
	
	УтверждениеВерно(Результат["files"]["f1"], "file1");
	УтверждениеВерно(Результат["files"]["f2"], "file2");
	УтверждениеВерно(Результат["form"]["field1"], "value1");
	УтверждениеВерно(Результат["form"]["field2"], "Значение2");
	
EndProcedure

Procedure Тест_POST_MultipartFormData_ФайлыИПоляФормы_КонструкторПараметров() Export
	
	ДополнительныеПараметры = КоннекторHTTP.НовыеПараметры();
	ДополнительныеПараметры.Файлы.Add(
		КоннекторHTTP.НовыйОтправляемыйФайл("f1", "file1.txt", Base64Value("ZmlsZTE="))
	);
	ДополнительныеПараметры.Файлы.Add(
		КоннекторHTTP.НовыйОтправляемыйФайл("f2", "file2.txt", Base64Value("ZmlsZTI="))
	);
	ДополнительныеПараметры.Файлы.Add(
		КоннекторHTTP.НовыйОтправляемыйФайл(
			"f3",
			"file3.txt",
			Base64Value("Z0J/RgNC40LLQtdGCLCDQnNC40YA="),
			"text/plain"
		)
	);
	Файл = КоннекторHTTP.НовыйОтправляемыйФайл("f4", "file4.txt");
	Файл.Headers.Insert("X-ID", String(New UUID));
	ДополнительныеПараметры.Файлы.Add(Файл);
	
	ДополнительныеПараметры.Data = New Structure;
	ДополнительныеПараметры.Data.Insert("field1", "value1");
	ДополнительныеПараметры.Data.Insert("field2", "Значение2"); 
	
	Результат = КоннекторHTTP.PostJson("https://httpbin.org/post", Undefined, ДополнительныеПараметры);
	
	УтверждениеВерно(Результат["files"]["f1"], "file1");
	УтверждениеВерно(Результат["files"]["f2"], "file2");
	УтверждениеВерно(Результат["files"]["f3"], "data:text/plain;base64,Z0J/RgNC40LLQtdGCLCDQnNC40YA"); // Должно быть "Привет, Мир"
	УтверждениеВерно(Результат["files"]["f4"], "");
	УтверждениеВерно(Результат["form"]["field1"], "value1");
	УтверждениеВерно(Результат["form"]["field2"], "Значение2");
	
EndProcedure

Procedure Тест_ПараметрыЗапросаТолькоКлюч() Export

	Результат = КоннекторHTTP.GetJson("https://httpbin.org/get?key");
	УтверждениеВерно(Результат["args"]["key"], "");
	
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
	
	Заголовки = New Map;
	Заголовки.Insert("Content-Type", "text/xml; charset=utf-8");
	Заголовки.Insert("SOAPAction", "http://web.cbr.ru/GetCursOnDate");
	Ответ = КоннекторHTTP.Post(
		"https://www.cbr.ru/DailyInfoWebServ/DailyInfo.asmx",
		XML, 
		New Structure("Headers", Заголовки));
	
	УтверждениеВерно(Ответ.StatusCode, 200);
	УтверждениеВерно(Ответ.Headers.Get("Content-Type"), "text/xml; charset=utf-8");
	
EndProcedure

Procedure Тест_ПрочитатьОтветКакXDTO() Export
	
	ТекстОтветXML = Тест_ПрочитатьОтветКакXDTO_ТекстОтветаXML();
	
	ПолноеИмяФайла = GetTempFileName("xml");
	
	ФайлТекст = New TextWriter(ПолноеИмяФайла, TextEncoding.UTF8); 
	ФайлТекст.WriteLine(ТекстОтветXML); 	
	ФайлТекст.Close(); 
	
	ДвоичныеДанныеОтвет = New BinaryData(ПолноеИмяФайла);
	DeleteFiles(ПолноеИмяФайла);
	
	Заголовки = New Map;
	Заголовки.Insert("Content-Type", "text/xml; charset=utf-8");
	
	ПодготовленныйОтвет = КоннекторHTTP.НовыйОтвет();
	ПодготовленныйОтвет.Body = ДвоичныеДанныеОтвет;
	ПодготовленныйОтвет.Headers = Заголовки;
	
	ОтветXDTO = КоннекторHTTP.КакXDTO(ПодготовленныйОтвет);
	
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

	Результат = КоннекторHTTP.GetJson(
		"https://httpbin.org/anything?jql=worklogDate >= 2017-04-01 AND worklogDate <= 2017-05-01&j&i=2");
	УтверждениеВерно(Результат["args"]["jql"], "worklogDate >= 2017-04-01 AND worklogDate <= 2017-05-01");
	УтверждениеВерно(Результат["args"]["j"], "");
	УтверждениеВерно(Результат["args"]["i"], "2");
	
EndProcedure

Procedure Тест_PostПустойJson() Export
	
	Json = New Structure;
	Результат = КоннекторHTTP.PostJson("https://httpbin.org/post", Json);
	УтверждениеВерно(Результат["url"], "https://httpbin.org/post");
	УтверждениеВерно(TypeOf(Результат["json"]), Type("Map"));
	
EndProcedure

Procedure Тест_АутентификацияAWS4_HMAC_SHA256() Export
	
	Аутентификация = New Structure;
	Аутентификация.Insert("Type", "AWS4-HMAC-SHA256");
	Аутентификация.Insert("ИдентификаторКлючаДоступа", ИдентификаторКлючаДоступа);
	Аутентификация.Insert("СекретныйКлюч", СекретныйКлюч);
	Аутентификация.Insert("State", Регион);
	Аутентификация.Insert("Service", "sqs");

	URL = StrTemplate("https://sqs.%1.amazonaws.com:443%2", Регион, Очередь);
	
	ПараметрыЗапроса = New Map;
	ПараметрыЗапроса.Insert("Action", "SendMessage");
	ПараметрыЗапроса.Insert("MessageBody", "This is a test message");
	ПараметрыЗапроса.Insert("MessageAttribute.1.Name", "my_attribute_name_1");
	ПараметрыЗапроса.Insert("MessageAttribute.1.Value.StringValue", "my_attribute_value_1");
	ПараметрыЗапроса.Insert("MessageAttribute.1.Value.DataType", "String");
	ПараметрыЗапроса.Insert("MessageAttribute.2.Name", "my_attribute_name_2");
	ПараметрыЗапроса.Insert("MessageAttribute.2.Value.StringValue", "my_attribute_value_2");
	ПараметрыЗапроса.Insert("MessageAttribute.2.Value.DataType", "String");
	ПараметрыЗапроса.Insert("Expires", "2020-05-05T22%3A52%3A43PST");
	ПараметрыЗапроса.Insert("Version", "2012-11-05");
	
	ДополнительныеПараметры = New Structure;
	ДополнительныеПараметры.Insert("Аутентификация", Аутентификация);
	Ответ = КоннекторHTTP.Get(URL, ПараметрыЗапроса, ДополнительныеПараметры);
	
	УтверждениеВерно(Ответ.StatusCode, 200);
	
EndProcedure

Procedure Тест_УпаковатьGZip() Export
	
	ИсходныеДанные = GetBinaryDataFromString("Привет, Мир!", TextEncoding.UTF8, False);
	СжатыеДанные = GetBinaryDataFromBase64String("H4sIAAAAAAAA/wEVAOr/0J/RgNC40LLQtdGCLCDQnNC40YAhilS6PhUAAAA=");
	
	УтверждениеВерно(КоннекторHTTP.ЗаписатьGZip(ИсходныеДанные), СжатыеДанные);

EndProcedure

Procedure Тест_РаспаковатьGZip() Export
	
	СжатыеДанные = GetBinaryDataFromBase64String("H4sIAAAAAAAA/wEVAOr/0J/RgNC40LLQtdGCLCDQnNC40YAhilS6PhUAAAA=");
	Данные = КоннекторHTTP.ПрочитатьGZip(СжатыеДанные);
	
	УтверждениеВерно(GetStringFromBinaryData(Данные, TextEncoding.UTF8), "Привет, Мир!");
	
EndProcedure

Procedure Тест_АутентификацияAWS4_HMAC_SHA256_ПустоеТелоПортНеУказан() Export
	
	URL = "https://sqs.eu-north-1.amazonaws.com/123456789101/test";
	
	Аутентификация = New Structure;
	Аутентификация.Insert("Type", "AWS4-HMAC-SHA256");
	Аутентификация.Insert("ИдентификаторКлючаДоступа", "ACCESS_KEY");
	Аутентификация.Insert("СекретныйКлюч", "SECRET_KEY");
	Аутентификация.Insert("State", "eu-north-1");
	Аутентификация.Insert("Service", "sqs");

	Заголовки = New Map;
	Заголовки.Insert("x-amz-date", "20200426T122000Z");
	
	Сессия = КоннекторHTTP.СоздатьСессию();
	Сессия.Headers = Заголовки;
	Сессия.Аутентификация = Аутентификация;
	
	ПодготовленныйЗапрос = КоннекторHTTP.ПодготовитьЗапрос(Сессия, "GET", URL, New Structure);
	
	УтверждениеВерно(ПодготовленныйЗапрос.Headers["x-amz-date"], "20200426T122000Z");
	УтверждениеВерно(ПодготовленныйЗапрос.Headers["x-amz-content-sha256"], "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");
	УтверждениеВерно(ПодготовленныйЗапрос.Headers["Authorization"], "AWS4-HMAC-SHA256 Credential=ACCESS_KEY/20200426/eu-north-1/sqs/aws4_request, SignedHeaders=host;x-amz-content-sha256;x-amz-date, Signature=ad98a02ef5df6b5337128ccdac1e5a279846c0d1c4b409e713a75dae0c9e4cb3");
	
EndProcedure

Procedure Тест_АутентификацияAWS4_HMAC_SHA256_ПустоеТелоУказанСтандартныйПорт() Export
	
	URL = "https://sqs.eu-north-1.amazonaws.com:443/123456789101/test";
	
	Аутентификация = New Structure;
	Аутентификация.Insert("Type", "AWS4-HMAC-SHA256");
	Аутентификация.Insert("ИдентификаторКлючаДоступа", "ACCESS_KEY");
	Аутентификация.Insert("СекретныйКлюч", "SECRET_KEY");
	Аутентификация.Insert("State", "eu-north-1");
	Аутентификация.Insert("Service", "sqs");

	Заголовки = New Map;
	Заголовки.Insert("x-amz-date", "20200426T122000Z");
	
	Сессия = КоннекторHTTP.СоздатьСессию();
	Сессия.Headers = Заголовки;
	Сессия.Аутентификация = Аутентификация;
	
	ПодготовленныйЗапрос = КоннекторHTTP.ПодготовитьЗапрос(Сессия, "GET", URL, New Structure);
	
	УтверждениеВерно(ПодготовленныйЗапрос.Headers["x-amz-date"], "20200426T122000Z");
	УтверждениеВерно(ПодготовленныйЗапрос.Headers["x-amz-content-sha256"], "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");
	УтверждениеВерно(ПодготовленныйЗапрос.Headers["Authorization"], "AWS4-HMAC-SHA256 Credential=ACCESS_KEY/20200426/eu-north-1/sqs/aws4_request, SignedHeaders=host;x-amz-content-sha256;x-amz-date, Signature=ad98a02ef5df6b5337128ccdac1e5a279846c0d1c4b409e713a75dae0c9e4cb3");
	
EndProcedure

Procedure Тест_АутентификацияAWS4_HMAC_SHA256_ПустоеТелоУказанНеСтандартныйПорт() Export
	
	URL = "https://sqs.eu-north-1.amazonaws.com:444/123456789101/test";
	
	Аутентификация = New Structure;
	Аутентификация.Insert("Type", "AWS4-HMAC-SHA256");
	Аутентификация.Insert("ИдентификаторКлючаДоступа", "ACCESS_KEY");
	Аутентификация.Insert("СекретныйКлюч", "SECRET_KEY");
	Аутентификация.Insert("State", "eu-north-1");
	Аутентификация.Insert("Service", "sqs");

	Заголовки = New Map;
	Заголовки.Insert("x-amz-date", "20200426T122000Z");
	
	Сессия = КоннекторHTTP.СоздатьСессию();
	Сессия.Headers = Заголовки;
	Сессия.Аутентификация = Аутентификация;
	
	ПодготовленныйЗапрос = КоннекторHTTP.ПодготовитьЗапрос(Сессия, "GET", URL, New Structure);
	
	УтверждениеВерно(ПодготовленныйЗапрос.Headers["x-amz-date"], "20200426T122000Z");
	УтверждениеВерно(ПодготовленныйЗапрос.Headers["x-amz-content-sha256"], "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");
	УтверждениеВерно(ПодготовленныйЗапрос.Headers["Authorization"], "AWS4-HMAC-SHA256 Credential=ACCESS_KEY/20200426/eu-north-1/sqs/aws4_request, SignedHeaders=host;x-amz-content-sha256;x-amz-date, Signature=96df4fab493e08b8a72965acf7a6d2fd651a883a2766a2b0e4c0cd113dea7d8c");
	
EndProcedure

Procedure Тест_ПовторСУчетомЗаголовкаRetryAfterDuration() Export
	
	Заголовки = New Map;
	Заголовки.Insert("X-ID", String(New UUID));
	
	ДополнительныеПараметры = New Structure;
	ДополнительныеПараметры.Insert("МаксимальноеКоличествоПовторов", 5);
	ДополнительныеПараметры.Insert("КоэффициентЭкспоненциальнойЗадержки", 2);
	
	ДополнительныеПараметры.Insert("Headers", Заголовки);
		
	URL = "http://127.0.0.1:5000/retry_after_duration";
	Ответ = КоннекторHTTP.Get(URL, Undefined, ДополнительныеПараметры);
	УтверждениеВерно(Ответ.StatusCode, 200);
	
EndProcedure

Procedure Тест_ПовторСУчетомЗаголовкаRetryAfterDate() Export
	
	Заголовки = New Map;
	Заголовки.Insert("X-ID", String(New UUID));
	
	ДополнительныеПараметры = New Structure;
	ДополнительныеПараметры.Insert("МаксимальноеКоличествоПовторов", 5);
	ДополнительныеПараметры.Insert("КоэффициентЭкспоненциальнойЗадержки", 2);
	
	ДополнительныеПараметры.Insert("Headers", Заголовки);
		
	URL = "http://127.0.0.1:5000/retry_after_date";
	Ответ = КоннекторHTTP.Get(URL, Undefined, ДополнительныеПараметры);
	УтверждениеВерно(Ответ.StatusCode, 200);
	
EndProcedure

Procedure Тест_ПовторПослеОшибки502() Export

	ПовторятьДляКодовСостояний = New Array;
	ПовторятьДляКодовСостояний.Add(КоннекторHTTP.КодыСостоянияHTTP().ОшибочныйШлюз_502);
	
	Заголовки = New Map;
	Заголовки.Insert("X-ID", String(New UUID));
	
	ДополнительныеПараметры = New Structure;
	ДополнительныеПараметры.Insert("МаксимальноеКоличествоПовторов", 5);
	ДополнительныеПараметры.Insert("ПовторятьДляКодовСостояний", ПовторятьДляКодовСостояний);
	
	ДополнительныеПараметры.Insert("Headers", Заголовки);
		
	URL = "http://127.0.0.1:5000/retry_502";
	Ответ = КоннекторHTTP.Get(URL, Undefined, ДополнительныеПараметры);
	УтверждениеВерно(Ответ.StatusCode, 200);
	
EndProcedure

Procedure Тест_ПовторПослеОшибкиПодключения() Export

	ПовторятьДляКодовСостояний = New Array;
	ПовторятьДляКодовСостояний.Add(КоннекторHTTP.КодыСостоянияHTTP().ОшибочныйШлюз_502);
	
	Заголовки = New Map;
	Заголовки.Insert("X-ID", String(New UUID));
	
	ДополнительныеПараметры = New Structure;
	ДополнительныеПараметры.Insert("Timeout", 1);
	ДополнительныеПараметры.Insert("МаксимальноеКоличествоПовторов", 2);
	ДополнительныеПараметры.Insert("ПовторятьДляКодовСостояний", ПовторятьДляКодовСостояний);
	
	ДополнительныеПараметры.Insert("Headers", Заголовки);
	
	Начало = CurrentUniversalDateInMilliseconds();
	URL = "http://127.0.0.1:5001/non_existent_resource";
	Try
		КоннекторHTTP.Get(URL, Undefined, ДополнительныеПараметры);
	Except
		Длительность = CurrentUniversalDateInMilliseconds() - Начало;
	EndTry;
	УтверждениеВерно(Длительность >= 3000 And Длительность < 7000, True);
	
EndProcedure

Procedure Тест_Ping() Export

	URL = "http://127.0.0.1:5000/ping";
	Ответ = КоннекторHTTP.Get(URL);
	УтверждениеВерно(Ответ.StatusCode, 200);
	
EndProcedure

Procedure Тест_ПредставлениеКодаСостоянияHTTP() Export

	УтверждениеВерно(КоннекторHTTP.ПредставлениеКодаСостоянияHTTP(400), "400: Bad Request");

EndProcedure

Procedure Тест_ПредставлениеНеизвестногоКодаСостоянияHTTP() Export

	Try
		КоннекторHTTP.ПредставлениеКодаСостоянияHTTP(488);
	Except
		ВерноеИсключение(ErrorInfo(), "Неизвестный code состояния HTTP: 488");
	EndTry;
	
EndProcedure

Procedure Тест_КорректноеИсключениеВМетодеКакJson() Export

	Try
		КоннекторHTTP.GetJson("https://en.wikipedia.org/wiki/1C_Company#Products");
	Except
		ВерноеИсключение(ErrorInfo(), "1C Company");
	EndTry;
	
EndProcedure

Procedure Тест_ОтправкаЗапросаПортитПереданныеНастройки_GitHub_Issue_33() Export
	
	Настройки = New Structure; 
	Заголовки = New Map;
	Заголовки.Insert("Content-Type","application/json");
	Настройки.Insert("Headers", Заголовки);
	
	ПараметрыЗапроса = New Structure("username, password", "anonymous", "hrgesf7HDR67Bd");
	
	НастройкиКопияДоОтправки = ValueFromStringInternal(ValueToStringInternal(Настройки));
	
	КоннекторHTTP.Post("https://jsonplaceholder.typicode.com/posts", ПараметрыЗапроса, Настройки);
	
	УтверждениеВерно(КоннекторHTTP.ОбъектВJson(Настройки), КоннекторHTTP.ОбъектВJson(НастройкиКопияДоОтправки));
	
EndProcedure

#EndRegion

Function ИзвлечьExecution(Ответ)
	
	HTML = КоннекторHTTP.КакТекст(Ответ);
	
	Начало = StrFind(HTML, "name=""execution""");
	Конец = StrFind(HTML, ">", SearchDirection.FromBegin, Начало);
	КороткаяСтрока = Mid(HTML, Начало, Конец - Начало);
	
	Начало = StrFind(КороткаяСтрока, "value=""") + StrLen("value=""");
	Конец = StrFind(КороткаяСтрока, """", SearchDirection.FromBegin, Начало); 
	
	Return Mid(КороткаяСтрока, Начало, Конец - Начало);
	
EndFunction

Function ПосчитатьMD5(Данные)
	
	Хеширование = New DataHashing(HashFunction.MD5);
	Хеширование.Append(Данные);
	
	Return Lower(GetHexStringFromBinaryData(Хеширование.HashSum));
	
EndFunction

Procedure УтверждениеВерно(ЛевоеЗначение, ПравоеЗначение, Пояснение = "")
	
	If ЛевоеЗначение <> ПравоеЗначение Then
		Raise(StrTemplate("<%1> не equal <%2>: %3", ЛевоеЗначение, ПравоеЗначение, Пояснение));
	EndIf;
	
EndProcedure

Procedure ВерноеИсключение(ИнформацияОбОшибке, ОжидаемоеИсключение)
	
	ТекстИсключения = DetailErrorDescription(ИнформацияОбОшибке);
	If TypeOf(ОжидаемоеИсключение) = Type("Array") Then
		ТекстНайден = False;
		For Each Элемент In ОжидаемоеИсключение Do
			If StrFind(ТекстИсключения, Элемент) Then
				ТекстНайден = True;
				Break;
			EndIf;
		EndDo;
		
		If Not ТекстНайден Then
			Raise(ТекстИсключения);
		EndIf;
	Else
		If Not StrFind(ТекстИсключения, ОжидаемоеИсключение) Then
			Raise(ТекстИсключения);
		EndIf;
	EndIf;
	
EndProcedure

#EndRegion

#EndIf
