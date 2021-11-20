// Коннектор: удобный HTTP-клиент для 1С:Предприятие 8
//
// Copyright 2017-2021 Vladimir Bondarevskiy
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
//
//
// URL:    https://github.com/vbondarevsky/Connector
// e-mail: vbondarevsky@gmail.com
// Версия: 2.4.4
//
// Требования: платформа 1С версии 8.3.10 и выше

#Region Public

#Region HTTPMethods

#Region CommonUseMethods

// Sends a GET request
//
// Parameters:
//   URL - String - HTTP URL to send the request to.
//   RequestParameters - Structure, Map - URL parameters to append to the URL (a part after ?):
//     * Key - String - URL parameter key.
//     * Value - String - URL parameter value
//                  - Array - makes a string from several parameters: key=value1&key=value2 и т.д.
//   AdditionalParameters - See NewParameters
//   Session - See NewSession
//
// Returns:
//   See CallMethod
//
Function Get(URL, RequestParameters = Undefined, AdditionalParameters = Undefined, Session = Undefined) Export

	CurrentSession = CurrentSession(Session);
	
	Parameters = NewParameters();
	Supplement(Parameters, ParametersFromArguments(RequestParameters, Undefined, Undefined));
	Supplement(Parameters, AdditionalParameters);
	
	Return CallHTTPMethod(CurrentSession, "GET", URL, Parameters); //@non-nls-1

EndFunction

// Sends an OPTION request
//
// Parameters:
//   URL - String - HTTP URL to send the request to.
//   AdditionalParameters - See NewParameters
//   Session - See NewSession
//
// Returns:
//   See CallMethod
//
Function Options(URL, AdditionalParameters = Undefined, Session = Undefined) Export

	CurrentSession = CurrentSession(Session);
	
	Parameters = NewParameters();
	Supplement(Parameters, ParametersFromArguments(Undefined, Undefined, Undefined));
	Supplement(Parameters, AdditionalParameters);
	
	Return CallHTTPMethod(CurrentSession, "OPTIONS", URL, Parameters); //@non-nls-1

EndFunction

// Sends a HEAD request
//
// Parameters:
//   URL - String - HTTP URL to send the request to.
//   AdditionalParameters - See NewParameters
//   Session - See NewSession
//
// Returns:
//   See CallMethod
//
Function Head(URL, AdditionalParameters = Undefined, Session = Undefined) Export

	CurrentSession = CurrentSession(Session);
	
	Parameters = NewParameters();
	Supplement(Parameters, ParametersFromArguments(Undefined, Undefined, Undefined));
	Supplement(Parameters, AdditionalParameters);
	
	Return CallHTTPMethod(CurrentSession, "HEAD", URL, Parameters); //@non-nls-1

EndFunction

// Sends a POST request
//
// Parameters:
//   URL - String - Post
//   Data - Structure, Map, String, BinaryData - see details in AdditionalParameters.Data.
//   AdditionalParameters - See NewParameters
//   Session - See NewSession
//
// Returns:
//   See CallMethod
//
Function Post(URL, Data = Undefined, AdditionalParameters = Undefined, Session = Undefined) Export

	CurrentSession = CurrentSession(Session);
	
	Parameters = NewParameters();
	Supplement(Parameters, ParametersFromArguments(Undefined, Data, Undefined));
	Supplement(Parameters, AdditionalParameters);
	
	Return CallHTTPMethod(CurrentSession, "POST", URL, Parameters); //@non-nls-1

EndFunction

// Sends a PUT request
//
// Parameters:
//   URL - String - HTTP URL to send the request to.
//   Data - Structure, Map, String, BinaryData - HTTP URL to send the request to.
//   AdditionalParameters - See NewParameters
//   Session - See NewSession
//
// Returns:
//   See CallMethod
//
Function Put(URL, Data = Undefined, AdditionalParameters = Undefined, Session = Undefined) Export

	CurrentSession = CurrentSession(Session);
	
	Parameters = NewParameters();
	Supplement(Parameters, ParametersFromArguments(Undefined, Data, Undefined));
	Supplement(Parameters, AdditionalParameters);
	
	Return CallHTTPMethod(CurrentSession, "PUT", URL, Parameters); //@non-nls-1

EndFunction

// Sends a PATCH request
//
// Parameters:
//   URL - String - HTTP URL to send the request to.
//   Data - Structure, Map, String, BinaryData - see details in AdditionalParameters.Data.
//   AdditionalParameters - See NewParameters
//   Session - See NewSession
//
// Returns:
//   See CallMethod
//
Function Patch(URL, Data = Undefined, AdditionalParameters = Undefined, Session = Undefined) Export

	CurrentSession = CurrentSession(Session);
	
	Parameters = NewParameters();
	Supplement(Parameters, ParametersFromArguments(Undefined, Data, Undefined));
	Supplement(Parameters, AdditionalParameters);
	
	Return CallHTTPMethod(CurrentSession, "PATCH", URL, Parameters); //@non-nls-1

EndFunction

// Sends a DELETE request
//
// Parameters:
//   URL - String - HTTP URL to send the request to.
//   Data - Structure, Map, String, BinaryData - see details in AdditionalParameters.Data.
//   AdditionalParameters - See NewParameters
//   Session - See NewSession
//
// Returns:
//   See CallMethod
//
Function Delete(URL, Data = Undefined, AdditionalParameters = Undefined, Session = Undefined) Export

	CurrentSession = CurrentSession(Session);
	
	Parameters = NewParameters();
	Supplement(Parameters, ParametersFromArguments(Undefined, Data, Undefined));
	Supplement(Parameters, AdditionalParameters);
	
	Return CallHTTPMethod(CurrentSession, "DELETE", URL, Parameters); //@non-nls-1

EndFunction

// Sends data to a specific URL with a specific HTTP verb.
//
// Parameters:
//   Method - String - HTTP request verb name.
//   URL - String - HTTP URL to send the request to.
//   AdditionalParameters - See NewParameters
//   Session - See NewSession
//
// Returns:
//   Structure - a response for the executed request:
//     * ExecutionTime - Number - execution response duration in milliseconds.
//     * Cookies - Map - cookies received from host.
//     * Headers - Map - HTTP response headers.
//     * IsPermanentRedirect - Boolean - permanent redirect flag.
//     * IsRedirect - Boolean - redirect flag.
//     * Encoding - String - response text encoding.
//     * Body - BinaryData - response body.
//     * StatusCode - Number - HTTP response headers.
//     * URL - String - final request URL.
//
Function CallMethod(Method, URL, AdditionalParameters = Undefined, Session = Undefined) Export

	CurrentSession = CurrentSession(Session);
	
	Parameters = NewParameters();
	Supplement(Parameters, ParametersFromArguments(Undefined, Undefined, Undefined));
	Supplement(Parameters, AdditionalParameters);
	
	Return CallHTTPMethod(CurrentSession, Method, URL, Parameters);

EndFunction

#EndRegion

#Region SimplifiedMethodsForJSONRequests

// Sends a GET request
//
// Parameters:
//   URL - String - HTTP URL to send the request to.
//   RequestParameters - Structure, Map - URL parameters to append to the URL (a part after ?).
//     see details in Session.RequestParameters.
//   AdditionalParameters - See NewParameters
//   Session - See NewSession
//
// Returns:
//   Map, Structure - deserialized response from JSON.
//     Conversion parameters see in AdditionalParameters.JSONConversionParameters. 
//
Function GetJson(URL,
				RequestParameters = Undefined,
				AdditionalParameters = Undefined,
				Session = Undefined) Export

	CurrentSession = CurrentSession(Session);
	
	Parameters = NewParameters();
	Supplement(Parameters, ParametersFromArguments(RequestParameters, Undefined, Undefined));
	Supplement(Parameters, AdditionalParameters);
	
	JSONConversionParameters =
		SelectValue(Undefined, Parameters, "JSONConversionParameters", Undefined);
	
	Return AsJson(CallHTTPMethod(CurrentSession, "GET", URL, Parameters), JSONConversionParameters); //@non-nls-1

EndFunction

// Sends a POST request
//
// Parameters:
//   URL - String - HTTP URL to send the request to.
//   Json - Structure, Map - data to serialize into JSON.
//   AdditionalParameters - See NewParameters
//   Session - See NewSession
//
// Returns:
//   Map, Structure - deserialized response from JSON.
//     Conversion parameters see in AdditionalParameters.JSONConversionParameters 
//
Function PostJson(URL, Json, AdditionalParameters = Undefined, Session = Undefined) Export

	CurrentSession = CurrentSession(Session);
	
	Parameters = NewParameters();
	Supplement(Parameters, ParametersFromArguments(Undefined, Undefined, Json));
	Supplement(Parameters, AdditionalParameters);
	
	JSONConversionParameters =
		SelectValue(Undefined, Parameters, "JSONConversionParameters", Undefined);
	
	Return AsJson(CallHTTPMethod(CurrentSession, "POST", URL, Parameters), JSONConversionParameters); //@non-nls-1

EndFunction

// Sends a PUT request
//
// Parameters:
//   URL - String - HTTP URL to send the request to.
//   Json - Structure, Map - data to serialize into JSON.
//   AdditionalParameters - See NewParameters
//   Session - See NewSession
//
// Returns:
//   Map, Structure - deserialized response from JSON.
//     Conversion parameters see in AdditionalParameters.JSONConversionParameters 
//
Function PutJson(URL, Json, AdditionalParameters = Undefined, Session = Undefined) Export

	CurrentSession = CurrentSession(Session);
	
	Parameters = NewParameters();
	Supplement(Parameters, ParametersFromArguments(Undefined, Undefined, Json));
	Supplement(Parameters, AdditionalParameters);
	
	JSONConversionParameters =
		SelectValue(Undefined, Parameters, "JSONConversionParameters", Undefined);
	Return AsJson(CallHTTPMethod(CurrentSession, "PUT", URL, Parameters), JSONConversionParameters); //@non-nls-1

EndFunction

// Sends a DELETE request
//
// Parameters:
//   URL - String - HTTP URL to send the request to.
//   Json - Structure, Map - data to serialize into JSON.
//   AdditionalParameters - See NewParameters
//   Session - See NewSession
//
// Returns:
//   Map, Structure - deserialized response from JSON.
//     Conversion parameters see in AdditionalParameters.JSONConversionParameters 
//
Function DeleteJson(URL, Json, AdditionalParameters = Undefined, Session = Undefined) Export

	CurrentSession = CurrentSession(Session);
	
	Parameters = NewParameters();
	Supplement(Parameters, ParametersFromArguments(Undefined, Undefined, Json));
	Supplement(Parameters, AdditionalParameters);
	
	JSONConversionParameters =
		SelectValue(Undefined, Parameters, "JSONConversionParameters", Undefined);
	Return AsJson(CallHTTPMethod(CurrentSession, "DELETE", URL, Parameters), JSONConversionParameters); //@non-nls-1

EndFunction

#EndRegion

#Region Constructors

// Additional parameters constructor
//
// Returns:
//  Structure - Allows you to set additional parameters
//    * Headers - Map - see details in Session.Headers.
//    * Authentication - Structure - see details in Session.Authentication
//    * Proxy - InternetProxy - see details in Session.Proxy.
//    * RequestParameters - Structure, Map - see details in Session.RequestParameters.
//    * VerifySSL - Boolean - see details in Session.VerifySSL.
//    * ClientSSLCertificate - FileClientCertificate, WindowsClientCertificate - Default value: Undefined.
//    * Cookies - Array - see details in Session.Cookies.
//    * Timeout - Number - connections and operations timeout, in seconds.
//        Default value - 30 sec.
//    * AllowRedirect - Boolean - True - redirects are allowed automatically.
//                               - Boolean - False - a single request will be sent to the host.
//    * Json - Structure, Map - data to serialize into JSON.
//    * JSONConversionParameters - Structure - sets JSON conversion parameters:
//        ** ReadToMap - Boolean - If True, JSON object will be read in Map, otherwise in Structure.
//             
//        ** JSONDateFormat - JSONDateFormat - Sets the date serialization format.
//             
//        ** PropertiesNamesWithDateValues -  String, Array of String - JSON properties names,
//             For the specified properties date restoration from string will be called.
//        ** ReviverFunctionName - String - This function is called every time a property is read.
//            
//               *** Property - String - Specify it only for reading JSON objects.
//               *** Value - Arbitrary - A value of a serializable type.
//               *** AdditionalParameters - Arbitrary
//               *** ReturnValue - Arbitrary - The return value has arbitrary type, deserialized from JSON. 
//        ** ReviverFunctionModule - Arbitrary - Specifies the module, the procedure of which will be used
//            for value restoration.
//        ** ReviverFunctionAdditionalParameters - Arbitrary - Additional parameters which will be
//            transferred to the value recovery function.
//        ** RetriverPropertiesNames - Array - JSON properties names,
//            For the specified properties date restoration from string will be called.
//        ** MaximumNesting - Number - The maximum nested level of a JSON object.
//    * JSONWriterSettings - JSONWriterSettings - Defines a set of parameters used for JSON writing.
//    * Data - String, BinaryData - arnitrary data to send in a request.  
//             - Structure, Map - form fields to send in a request:
//                 ** Key - String - field name.
//                 ** Value - String - field name.
//    * Files - См. НовыйОтправляемыйФайл, Array Из См. НовыйОтправляемыйФайл - files to send
//    * MaximumNumberOfRetries - Number - Number of connection/request sending retries.
//        Delay duration between attempts grows exponentially.
//        But, if the status code is one of 413, 429, 503
//        and response has the Retry-After header,
//        delay duration value is taken from this header value
//        Default value: 0 - no retries.
//    * MaximumTimeOfRetries - Number - max. total time (in seconds) of sending request and retries.
//        Default value: 600.
//    * ExponentialDelayRatio - Number - exponential delay factor.
//        1 forms the delays sequence: 1, 2, 4, 8 и т.д.
//        2 forms the delays sequence: 2, 4, 8, 16 и т.д.
//        ...
//        Default value: 1.
//    * ToRetryForStatusesCodes - Undefined - ToRetryForStatusesCodes 
//                                 - Array - retries will run for specific status codes.
//        
//
Function NewParameters() Export

	Parameters = New Structure;
	Parameters.Insert("Headers", New Map);
	Parameters.Insert("Authentication", Undefined);
	Parameters.Insert("Proxy", Undefined);
	Parameters.Insert("RequestParameters", Undefined);
	Parameters.Insert("VerifySSL", True);
	Parameters.Insert("ClientSSLCertificate", Undefined);
	Parameters.Insert("Cookies", New Map);
	Parameters.Insert("Timeout", TimeoutByDefault());
	Parameters.Insert("AllowRedirect", True);
	Parameters.Insert("Json", Undefined);
	Parameters.Insert("JSONConversionParameters", JSONConversionParametersByDefault());
	Parameters.Insert("Data", Undefined);
	Parameters.Insert("Files", New Array);
	Parameters.Insert("MaximumNumberOfRetries", 0);
	Parameters.Insert("MaximumTimeOfRetries", 600);
	Parameters.Insert("ExponentialDelayRatio", 1);
	Parameters.Insert("ToRetryForStatusesCodes", Undefined);
	
	Return Parameters;

EndFunction

// A constructor of a submitting file description
//
// Parameters:
//   Name - String - form field name.
//   FileName - String - file name.
//   Data - BinaryData - file binary data.
//   Type - String - file MIME-type
//
// Returns:
//  Structure:
//    * Name - String - form field name.
//    * FileName - String - file name.
//    * Data - BinaryData - file binary data.
//    * Type - String - file MIME-type.
//    * Headers - Map - HTTP request headers.
//
Function NewFileToSend(Name, FileName, Data = Undefined, Type = Undefined) Export
	
	File = New Structure;
	File.Insert("Name", Name);
	File.Insert("FileName", FileName);
	File.Insert("Data", ?(Data = Undefined, Base64Value(""), Data));
	File.Insert("Type", Type);
	File.Insert("Headers", New Map);
	
	Return File;
	
EndFunction

// Constructor authentication OS
// 
// Returns:
//  Structure:
//    * UseOSAuthentication - String - Contains the current value of NTLM or Negotiate authentication use.
//
Function NewAuthenticationOS() Export
	
	Result = New Structure;
	Result.Insert("UseOSAuthentication", True);
	
	Return Result;
	
EndFunction

// Construcot authentication Basic
// 
// Returns:
//  Structure:
//    * User - String - user password.
//    * Password - String - user name.
//
Function NewAuthenticationBasic() Export
	
	Result = New Structure;
	Result.Insert("User", "");
	Result.Insert("Password", "");
	
	Return Result;
		
EndFunction

// Constructor authentication Digest
// 
// Returns:
//  Structure:
//    * Type - String - authentication type. Always "Digest"
//    * User - String - user name.
//    * Password - String - user password.
//
Function NewAuthenticationDigest() Export
	
	Result = New Structure;
	Result.Insert("Type", "Digest"); //@non-nls-2
	Result.Insert("User", "");
	Result.Insert("Password", "");
	
	Return Result;
	
EndFunction

// Constructor authentication AWS4-HMAC-SHA256
// 
// Returns:
//  Structure:
//    * Type - String - secret key. Always "AWS4-HMAC-SHA256"
//    * AccessKeyID - String - Access key ID.
//    * SecretKey - String - secret key.
//    * Service - String - secret key.
//    * Region - String - Access key ID.
//
Function NewAuthenticationAWS4() Export
	
	Result = New Structure;
	Result.Insert("Type", "AWS4-HMAC-SHA256"); //@non-nls-2
	Result.Insert("AccessKeyID", "");
	Result.Insert("SecretKey", "");
	Result.Insert("Service", "");
	Result.Insert("Region", "");
	
	Return Result;
	
EndFunction

// Session constructor.
//
// Returns:
//  Structure - session parameters:
//    * Headers - Map - HTTP request headers.
//    * Authentication - См. НоваяАутентификацияОС - authentication OS
//                     - См. НоваяАутентификацияBasic - Basic
//                     - См. НоваяАутентификацияDigest - Digest
//                     - См. НоваяАутентификацияAWS4 - AWS4
//    * Proxy - InternetProxy - proxy parameters to send request.
//        Default value: Undefined. If your configuration based on `SSL`,
//        proxy settings will be taken from `SSL` by default.
//    * RequestParameters - Structure, Map - URL parameters to append to the URL (a part after ?):
//        * Key - String - URL parameter key.
//        * Value - String - URL parameter value
//                   - Array - makes a string from several parameters: key=value1&key=value2 etc.
//    * VerifySSL - Boolean - False - If it is not specified, the server certificate is not verified.
//                   - Boolean - True - the value OSCertificationAuthorityCertificates is used.
//                   - FileCertificationAuthorityCertificates
//        Default value: True.
//    * ClientSSLCertificate - FileClientCertificate, WindowsClientCertificate - Default value: Undefined.
//    * MaximumNumberOfRedirects - Number - max. number of redirections. Looping protection.
//        Default value: 30
//    * Cookies - Map - cookies set.
//
Function NewSession() Export

	Session = New Structure;
	Session.Insert("Headers", DefaultHeaders());
	Session.Insert("Authentication", Undefined);
	Session.Insert("Proxy", Undefined);
	Session.Insert("RequestParameters", New Structure);
	Session.Insert("VerifySSL", True);
	Session.Insert("ClientSSLCertificate", Undefined);
	Session.Insert("MaximumNumberOfRedirects", MaximumNumberOfRedirects());
	Session.Insert("Cookies", New Map);
	Session.Insert("ServiceData", New Structure("DigestParameters"));

	Return Session;

EndFunction

// Packet response of resoult HTTP method call.
//
// Returns:
//  Structure:
//   * Method - String - request's HTTP-method name
//   * URL - String - final request URL.
//   * StatusCode - Number - the status code of the response.
//   * Headers - Map - response headers.
//   * Body - BinaryData - response body.
//   * Encoding - String - response encoding code.
//   * ExecutionTime - Number - request execution time in millisecondes.
//   * IsPermanentRedirect - Boolean - is permanent redirect.
//   * IsRedirect - Boolean - is redirect.
//   * Cookies - Map - cookies repository.
//   * Errors - Array of String - errors list during request execution.
//
Function NewResponse() Export
	
	Result = New Structure;
	Result.Insert("Method", "GET"); //@non-nls-2
	Result.Insert("URL", "");
	Result.Insert("StatusCode", 600); // Сетевая ошибка (>500)
	Result.Insert("Headers", New Map);
	Result.Insert("Body", Base64Value(""));
	Result.Insert("Encoding", "utf-8"); //@non-nls-2
	Result.Insert("ExecutionTime", Undefined);
	Result.Insert("IsPermanentRedirect", False);
	Result.Insert("IsRedirect", False);
	Result.Insert("Cookies", New Map);
	Result.Insert("Errors", New Array);
	
	Return Result;
	
EndFunction

#EndRegion

#EndRegion

#Region ResponseFormats

// Returns host response as deserialized JSON value.
//
// Parameters:
//   Response - See NewResponse
//   JSONConversionParameters - Structure - sets JSON conversion parameters:
//     * ReadToMap - Boolean - - 
//                              - 
//     * JSONDateFormat - JSONDateFormat - Specifies a deserialization format of dates of the JSON objects.
//     * PropertiesNamesWithDateValues -  Array, String - JSON properties names,
//         For the specified properties date restoration from string will be called.
//     * ReviverFunctionName - String - This function is called every time a property is read.
//         It must have the following parameters:
//            ** Property - String - Specify it only for reading JSON objects.
//            ** Value - Arbitrary - A value of a serializable type.
//            ** AdditionalParameters - Arbitrary
//            ** ReturnValue - Arbitrary - The return value has arbitrary type, deserialized from JSON. 
//     * ReviverFunctionModule - Arbitrary - Specifies the module, the procedure of which will be used
//         for value restoration.
//     * ReviverFunctionAdditionalParameters - Arbitrary - Additional parameters which will be
//         transferred to the value recovery function.
//     * RetriverPropertiesNames - Array - Array of JSON property names which recovery function
//         will be called for.
//     * MaximumNesting - Number - The maximum nested level of a JSON object.
//
// Returns:
//   - Map - host response as JSON deserialized value.
//       
//   - Structure - host response as JSON deserialized value.
//
Function AsJson(Response, JSONConversionParameters = Undefined) Export
	
	Try
		Return JsonToObject(UnpackResponse(Response), Response.Encoding, JSONConversionParameters);
	Except
		Raise AsException(Response, NStr("ru = 'Ошибка при десериализации JSON.';
													|en = 'Error. Deserialize JSON';"));
	EndTry;

EndFunction

// Returns host response as text.
//
// Parameters:
//   Response - See NewResponse
//   Encoding - String, TextEncoding - contains text encoding.
//     If value is empty, the encoding is taken from Response.Encoding.
//
// Returns:
//   String - host response as text.
//
Function AsText(Response, Encoding = Undefined) Export

	If Not ValueIsFilled(Encoding) Then
		Encoding = Response.Encoding;
	EndIf;

	TextReader = New TextReader(UnpackResponse(Response).OpenStreamForRead(), Encoding);
	Text = TextReader.Read();
	TextReader.Close();

	If Text = Undefined Then
		Text = "";
	EndIf;

	Return Text;

EndFunction

// Returns host response as binary data.
//
// Parameters:
//   Response - See NewResponse
//
// Returns:
//   String - host response as binary data.
//
Function AsBinaryData(Response) Export

	Return UnpackResponse(Response);

EndFunction

// Returns host response as XDTO.
//
// Parameters:
//   Response - See NewResponse
//   XMLReaderSettings - XMLReaderSettings - Parameters for reading XML data
//     See details of the method XMLReader.OpenStream in the Syntax Assistant 
//   XMLSchemaSet - XMLSchemaSet - An XML schema set used for validation of the document being read.
//     If a schema set is speficied but not validated and XML document validation is enabled, the schema set is validated.
//     See details of the method XMLReader.OpenStream in the Syntax Assistant
//     
//   Encoding - String, TextEncoding - Contains the input stream encoding.
//     See details of the method XMLReader.OpenStream in the Syntax Assistant 
//
// Returns:
//   XDTODataObject, XDTOList - Return value can have any type that supports serialization to XDTO.
//
Function AsXDTO(Response,
				XMLReaderSettings = Undefined,
				XMLSchemaSet = Undefined,
				Encoding = Undefined) Export

	Try
		BinaryData = UnpackResponse(Response);
		
		StreamForRead = BinaryData.OpenStreamForRead();
	
		If Not ValueIsFilled(Encoding) Then
			Encoding = Response.Encoding;
		EndIf;
	
		XMLReader = New XMLReader;
		XMLReader.OpenStream(StreamForRead, XMLReaderSettings, XMLSchemaSet, Encoding);
	
		XDTOObject = XDTOFactory.ReadXML(XMLReader);
	Except
		Raise AsException(Response, NStr("ru = 'Ошибка при десериализации XDTO.';
													|en = 'Error. Deserialize XDTO.
													|';"));
	EndTry;

	Return XDTOObject;

EndFunction

// Returns server response as a text for using in Raise.
//
// Parameters:
//   Response - See NewResponse.
//   TextForUser - String - Text of explanation for the user.
//
// Returns:
//   String - server response as exception text.
//
Function AsException(Response, Val TextForUser = Undefined) Export
	
	ExceptionText = StrTemplate(
		NStr("ru = 'HTTP %1 %2
		           |%3';
					|en = 'HTTP %1 %2
					|
					|%3';"),
		Response.Method,
		Response.URL,
		HTTPStatusCodePresentation(Response.StatusCode)
	);
	
	ResponseBody = CutText(AsText(Response));
	
	If Not IsBlankString(ResponseBody) Then
		ExceptionText = ExceptionText + Chars.LF + StrTemplate(
			NStr("ru = 'Тело ответа:
			           |%1';
						|en = 'Body response:
						|%1';"),
			ResponseBody);
	EndIf;
	
	If Response.Errors.Count() Then
		ExceptionText = ExceptionText + Chars.LF + Chars.LF
			+ StrConcat(Response.Errors, Chars.LF + Chars.LF);
	EndIf;
	
	If Not IsBlankString(TextForUser) Then
		ExceptionText = TextForUser + Chars.LF + Chars.LF + ExceptionText;
	EndIf;
	
	Return ExceptionText;
	
EndFunction

#EndRegion

#Region OtherFunctions

// Returns a structured URL presentation.
//
// Parameters:
//   URL - String - HTTP URL to send the request to.
//
// Returns:
//   Structure - Structure URL:
//     * Scheme - String - a part of URL after #.
//     * Authentication - Structure - authentification parameters:
//         ** User - String - user name.
//         ** Password - String - user password.
//     * Host - String - host address.
//     * Port - Number - host port.
//     * Path - String - resourse adress at host.
//     * RequestParameters - Map - URL parameters to append to the URL (a part after ?):
//         ** Key - String - URL parameter key.
//         ** Value - String - URL parameter value;
//                     - Array - parameter's values (key=value1&key=value2).
//     * Fragment - String - a part of URL after #.
//
Function ParseURL(Val URL) Export

	Scheme = "";
	Path = "";
	Authentication = New Structure("User, Password", "", "");
	Host = "";
	Port = "";
	Fragment = "";

	ValidSchemes = StrSplit("http,https", ","); //@non-nls-1

	URLWithoutScheme = URL;
	SplitStringByDelimiter(Scheme, URLWithoutScheme, "://");
	If ValidSchemes.Find(Lower(Scheme)) <> Undefined Then
		URL = URLWithoutScheme;
	Else
		Scheme = "";
	EndIf;

	Result = SplitByFirstFoundDelimiter(URL, StrSplit("/,?,#", ","));
	URL = Result[0];
	If ValueIsFilled(Result[2]) Then
		Path = Result[2] + Result[1];
	EndIf;

	AuthString = "";
	SplitStringByDelimiter(AuthString, URL, "@");
	If ValueIsFilled(AuthString) Then
		AuthParts = StrSplit(AuthString, ":");
		Authentication.User = AuthParts[0];
		If AuthParts.Count() > 1 Then
			Authentication.Password = AuthParts[1];
		EndIf;
	EndIf;

	// IPv6
	SplitStringByDelimiter(Host, URL, "]");
	If ValueIsFilled(Host) Then
		Host = Host + "]";
	EndIf;

	URL = StrReplace(URL, "/", "");

	SplitStringByDelimiter(Port, URL, ":", True);

	If Not ValueIsFilled(Host) Then
		Host = URL;
	EndIf;

	If ValueIsFilled(Port) Then
		Port = Number(Port);
	Else
		Port = 0;
	EndIf;

	SplitStringByDelimiter(Fragment, Path, "#", True);

	RequestParameters = FillRequestParameters(Path);

	If Not ValueIsFilled(Scheme) Then
		Scheme = "http"; //@non-nls-1
	EndIf;

	If Not ValueIsFilled(Path) Then
		Path = "/";
	EndIf;

	Result = New Structure;
	Result.Insert("Scheme", Scheme);
	Result.Insert("Authentication", Authentication);
	Result.Insert("Host", Host);
	Result.Insert("Port", Port);
	Result.Insert("Path", Path);
	Result.Insert("RequestParameters", RequestParameters);
	Result.Insert("Fragment", Fragment);

	Return Result;

EndFunction

// Converts Object into JSON.
//
// Parameters:
//   Object - Arbitrary - data to convert into JSON.
//   ConversionParameters - Structure:
//     * JSONDateFormat - JSONDateFormat - Specifies a deserialization format of dates of the JSON objects.
//     * JSONDateWritingVariant - JSONDateWritingVariant - Specifies JSON date writing options.
//     * ConvertionFunctionName - String - This function is called for all properties if their types
//         do not support direct conversion to JSON format.
//          Function should be exported and must have the following parameters:
//           ** Property - String - Name of property is transferred into the parameter if the structure
//                or mapping is written.
//           ** Value - String - The source value is transferred into the parameter.
//                
//           ** AdditionalParameters - Arbitrary - Additional parameters specified in the call to the
//                WriteJSON method.
//           ** Cancel - Boolean - Cancels the property write operation.
//           ** ReturnValue - Arbitrary - conversion result.
//     * ConvertionFunctionModule - Arbitrary - Specifies the module, in which the JSON conversion function is implemented.
//     * ConvertionFunctionAdditionalParameters - Arbitrary - Additional parameters specified in the call to the
//                                                                     WriteJSON method.
//   WriterSettings - Structure - data to convert into JSON.
//     * NewLines - JSONLineBreak - Manages the setting of the start and the end of the objects and arrays,
//         keys and values in a new string.
//     * PaddingSymbols - String - Specifies the indent characters used when writing a JSON document.
//     * UseDoubleQuotes - Boolean - Specifies to use double quotes when writing the JSON properties and values.
//         
//     * EscapeCharacters - JSONCharactersEscapeMode - Specifies screening of the characters "U+2028" (string separator)
//         and "U+2029" (paragraph separator) for JavaScript compatibility.
//     * EscapeAngleBrackets - Boolean - Specifies if the angle brackets characters will be screened when
//                                            writing a JSON document.
//     * EscapeLineTerminators - Boolean - Specifies screening of the characters "U+2028" (string separator)
//         and "U+2029" (paragraph separator) for JavaScript compatibility.
//     * EscapeAmpersand - Boolean - Specifies if the ampersand character will be screened when writing a JSON document.
//     * EscapeSingleQuotes - Boolean - Specifies if the single quotes character will be screened when writing a JSON document.
//     * EscapeSlash - Boolean - Defines whether slash is screened while writing a value.
//
// Returns:
//   String - object in JSON format.
//
Function ObjectToJson(Object, Val ConversionParameters = Undefined, Val WriterSettings = Undefined) Export

	JSONConversionParameters = Join(JSONConversionParametersByDefault(), ConversionParameters);

	SerializerSettings = New JSONSerializerSettings;
	SerializerSettings.ФорматСериализацииДаты = JSONConversionParameters.JSONDateFormat;
	SerializerSettings.DateWritingVariant = JSONConversionParameters.JSONDateWritingVariant;

	WriterSettings = Join(JSONWriterSettingsByDeafult(), WriterSettings);

	JSONWriterSettings = New JSONWriterSettings(
		WriterSettings.NewLines,
		WriterSettings.PaddingSymbols,
		WriterSettings.UseDoubleQuotes,
		WriterSettings.EscapeCharacters,
		WriterSettings.EscapeAngleBrackets,
		WriterSettings.EscapeLineTerminators,
		WriterSettings.EscapeAmpersand,
		WriterSettings.EscapeSingleQuotes,
		WriterSettings.EscapeSlash);

	JSONWriter = New JSONWriter;
	JSONWriter.SetString(JSONWriterSettings);

	If JSONConversionParameters.ConvertionFunctionName <> Undefined
		And JSONConversionParameters.ConvertionFunctionModule <> Undefined Then
		WriteJSON(JSONWriter, Object, SerializerSettings,
			JSONConversionParameters.ConvertionFunctionName,
			JSONConversionParameters.ConvertionFunctionModule,
			JSONConversionParameters.ConvertionFunctionAdditionalParameters);
	Else
		WriteJSON(JSONWriter, Object, SerializerSettings);
	EndIf;

	Return JSONWriter.Close();

EndFunction

// Converts JSON into Object.
//
// Parameters:
//   Json - Stream, BinaryData, String - JSON data.
//   Encoding - String - JSON text encoding. Default value - utf-8.
//   ConversionParameters - Structure - JSON conversion parameters:
//     * ReadToMap - Boolean - If True, JSON object will be read in Map, otherwise in Structure.
//         
//     * PropertiesNamesWithDateValues - Array, String, FixedArray - JSON properties names,
//         For the specified properties date restoration from string will be called.
//     * JSONDateFormat - JSONDateFormat - Specifies a deserialization format of dates of the JSON objects.
//     * ReviverFunctionName - String - This function is called every time a property is read.
//         It must have the following parameters:
//            ** Property - String - Specify it only for reading JSON objects.
//            ** Value - Arbitrary - A value of a serializable type.
//            ** AdditionalParameters - Arbitrary
//            ** ReturnValue - Arbitrary - The return value has arbitrary type, deserialized from JSON. 
//     * ReviverFunctionModule - Arbitrary - Specifies the module, the procedure of which
//         will beused for value restoration.
//     * ReviverFunctionAdditionalParameters - Arbitrary - Additional parameters which will be
//         transferred to the value recovery function.
//     * RetriverPropertiesNames - Array - Array of JSON property names which recovery function
//         will be called for.
//     * MaximumNesting - Number - The maximum nested level of a JSON object.
//
// Returns:
//   Arbitrary - deserialized value from JSON.
//
Function JsonToObject(Json, Encoding = "utf-8", ConversionParameters = Undefined) Export

	JSONConversionParameters = Join(JSONConversionParametersByDefault(), ConversionParameters);

	JSONReader = New JSONReader;
	If TypeOf(Json) = Type("BinaryData") Then
		JSONReader.OpenStream(Json.OpenStreamForRead(), Encoding);
	ElsIf TypeOf(Json) = Type("String") Then
		JSONReader.SetString(Json);
	Else
		JSONReader.OpenStream(Json, Encoding);
	EndIf;
	Object = ReadJSON(
		JSONReader,
		JSONConversionParameters.ReadToMap,
		JSONConversionParameters.PropertiesNamesWithDateValues,
		JSONConversionParameters.JSONDateFormat,
		JSONConversionParameters.ReviverFunctionName,
		JSONConversionParameters.ReviverFunctionModule,
		JSONConversionParameters.ReviverFunctionAdditionalParameters,
		JSONConversionParameters.RetriverPropertiesNames,
		JSONConversionParameters.MaximumNesting);
	JSONReader.Close();

	Return Object;

EndFunction

// Calculates HMAC (hash-based message authentication code).
//
// Parameters:
//   Var_Key - BinaryData - secret key.
//   Data - BinaryData - data to calculate HMAC.
//   Algorithm - HashFunction - - Defines method for calculating the hash-sum.
//
// Returns:
//   BinaryData - calculated HMAC value.
//
Function HMAC(Var_Key, Data, Algorithm) Export

	BlockSize = 64;

	If Var_Key.Size() > BlockSize Then
		Hashing = New DataHashing(Algorithm);
		Hashing.Append(Var_Key);

		BufferKey = GetBinaryDataBufferFromBinaryData(Hashing.HashSum);
	Else
		BufferKey = GetBinaryDataBufferFromBinaryData(Var_Key);
	EndIf;

	ModifiedKey = New BinaryDataBuffer(BlockSize);
	ModifiedKey.Write(0, BufferKey);

	InternalKey = ModifiedKey.Copy();
	ExternalKey = ModifiedKey;

	InternalAlignment = New BinaryDataBuffer(BlockSize);
	ExternalAlignment = New BinaryDataBuffer(BlockSize);
	For Index = 0 To BlockSize - 1 Do
		InternalAlignment.Set(Index, 54);
		ExternalAlignment.Set(Index, 92);
	EndDo;

	InternalHashing = New DataHashing(Algorithm);
	ExternalHashing = New DataHashing(Algorithm);

	InternalKey.WriteBitwiseXor(0, InternalAlignment);
	ExternalKey.WriteBitwiseXor(0, ExternalAlignment);

	ExternalHashing.Append(GetBinaryDataFromBinaryDataBuffer(ExternalKey));
	InternalHashing.Append(GetBinaryDataFromBinaryDataBuffer(InternalKey));

	If ValueIsFilled(Data) Then
		InternalHashing.Append(Data);
	EndIf;

	ExternalHashing.Append(InternalHashing.HashSum);

	Return ExternalHashing.HashSum;

EndFunction

// Returns the structure of the named HTTP status codes.
//
// Returns:
//   Structure - named HTTP status codes.
//
Function HTTPStatusCodes() Export

	Result = New Structure;
	For Each Item In HTTPStatusesCodesDescriptions() Do
		Result.Insert(Item.Key, Item.Code);
	EndDo;

	Return Result;

EndFunction

// Returns a text presentation of HTTP status code.
//
// Parameters:
//   StatusCode - Number - HTTP status code as text presentation.
//
// Returns:
//   String - HTTP status code as text presentation.
//
Function HTTPStatusCodePresentation(StatusCode) Export

	DescrStatusCode = Undefined;
	For Each Item In HTTPStatusesCodesDescriptions() Do
		If Item.Code = StatusCode Then
			DescrStatusCode = Item;
			Break;
		EndIf;
	EndDo;

	If DescrStatusCode = Undefined Then
		Return StrTemplate(NStr("ru = '%1: Неизвестный код состояния HTTP';
								|en = '%1: Unknowk HTTP status code';"), StatusCode);
	Else
		Return StrTemplate("%1: %2", DescrStatusCode.Code, DescrStatusCode.Descr);
	EndIf;

EndFunction

// Reads data from a GZip archive.
//
// Parameters:
//   CompressedData - BinaryData - data packed into GZip.
//
// Returns:
//   BinaryData - unpacked data.
//
Function ReadGZip(CompressedData) Export

	GZipPrefixSize = 10;
	GZipPostfixSize = 8;

	DataReader = New DataReader(CompressedData);
	DataReader.Skip(GZipPrefixSize);
	CompressedDataSize = DataReader.SourceStream().Size() - GZipPrefixSize - GZipPostfixSize;

	ZipStream = New MemoryStream(ZipLFHSize() + CompressedDataSize + ZipDDSize() + ZipCDHSize() + ZipEOCDSize());
	DataWriter = New DataWriter(ZipStream);
	DataWriter.WriteBinaryDataBuffer(ZipLFH());
	DataReader.CopyTo(DataWriter, CompressedDataSize);

	DataWriter.Close();
	DataWriter = New DataWriter(ZipStream);

	CRC32 = DataReader.ReadInt32();
	UncompressedDataSize = DataReader.ReadInt32();
	DataReader.Close();

	DataWriter.WriteBinaryDataBuffer(ZipDD(CRC32, CompressedDataSize, UncompressedDataSize));
	DataWriter.WriteBinaryDataBuffer(ZipCDH(CRC32, CompressedDataSize, UncompressedDataSize));
	DataWriter.WriteBinaryDataBuffer(ZipEOCD(CompressedDataSize));
	DataWriter.Close();

	Return ReadZip(ZipStream);

EndFunction

// Writes data to GZip archive.
//
// Parameters:
//   Data - BinaryData - initial data.
//
// Returns:
//   BinaryData - data packed into GZip.
//
Function WriteGZip(Data) Export

	DataReader = New DataReader(WriteZip(Data));

	InitialOffset = 14;
	DataReader.Skip(InitialOffset);
	CRC32 = DataReader.ReadInt32();

	CompressedDataSize = DataReader.ReadInt32();
	SourceDataSize = DataReader.ReadInt32();

	FileNameSize = DataReader.ReadInt16();
	AdditionalFieldSize = DataReader.ReadInt16();
	DataReader.Skip(FileNameSize + AdditionalFieldSize);

	GZipStream = New MemoryStream;
	DataWriter = New DataWriter(GZipStream);
	DataWriter.WriteBinaryDataBuffer(GZipHeader());
	DataReader.CopyTo(DataWriter, CompressedDataSize);
	DataWriter.Close();
	DataWriter = New DataWriter(GZipStream);

	DataWriter.WriteBinaryDataBuffer(GZipFooter(CRC32, SourceDataSize));

	Return GZipStream.CloseAndGetBinaryData();

EndFunction

#EndRegion

#EndRegion

#Region Internal

Function PrepareRequest(Session, Method, URL, AdditionalParameters) Export

	Cookies = SelectValue(Undefined, AdditionalParameters, "Cookies", New Array);
	Cookies = MergeCookies(RefillCookie(Session.Cookies, URL), RefillCookie(Cookies, URL));

	AuthenticationFromAdditionalParameters =
		SelectValue(Undefined, AdditionalParameters, "Authentication", New Structure);
	RequestParametersFromAdditionalParameters =
		SelectValue(Undefined, AdditionalParameters, "RequestParameters", New Structure);
	HeadersFromAdditionalParameters =
		SelectValue(Undefined, AdditionalParameters, "Headers", New Map);

	Authentication = Join(Copy(AuthenticationFromAdditionalParameters), Session.Authentication);
	RequestParameters = Join(Copy(RequestParametersFromAdditionalParameters), Session.RequestParameters);
	Headers = Join(Copy(HeadersFromAdditionalParameters), Session.Headers);
	JSONConversionParameters =
		SelectValue(Undefined, AdditionalParameters, "JSONConversionParameters", Undefined);

	PreparedRequest = New Structure;
	PreparedRequest.Insert("Cookies", Cookies);
	PreparedRequest.Insert("Authentication", Authentication);
	PreparedRequest.Insert("Method", Method);
	PreparedRequest.Insert("Headers", Headers);
	PreparedRequest.Insert("RequestParameters", RequestParameters);
	PreparedRequest.Insert("URL", PrepareURL(URL, RequestParameters));
	PreparedRequest.Insert("JSONConversionParameters", JSONConversionParameters);

	PrepareCookies(PreparedRequest);

	Data = SelectValue(Undefined, AdditionalParameters, "Data", New Structure);
	Files = SelectValue(Undefined, AdditionalParameters, "Files", New Array);
	Json = SelectValue(Undefined, AdditionalParameters, "Json", Undefined);
	JSONWriterSettings = SelectValue(Undefined, AdditionalParameters, "JSONWriterSettings", Undefined);

	PrepareRequestBody(PreparedRequest, Data, Files, Json, JSONWriterSettings);
	PrepareAuthentication(PreparedRequest);

	Return PreparedRequest;

EndFunction

#EndRegion

#Region Private

#Region WorkWithHTTPRequests

Function ParametersFromArguments(RequestParameters, Data, Json)

	Result = New Structure;
	Result.Insert("RequestParameters", RequestParameters);
	Result.Insert("Data", Data);
	Result.Insert("Json", Json);
	
	Return Result;

EndFunction

Function CallHTTPMethod(Session, Method, URL, AdditionalParameters)

	PreparedRequest = PrepareRequest(Session, Method, URL, AdditionalParameters);

	ConnectionSettings = ConnectionSettings(Method, URL, AdditionalParameters);

	Response = SendRequest(Session, PreparedRequest, ConnectionSettings);
	
	If ConnectionSettings.AllowRedirect And Response.IsRedirect Then
		// INFO: по хорошему аутентификацию нужно привести к новых параметрам, но пока будем игнорировать.
		Response = RedirectRequest(Session, ConnectionSettings, PreparedRequest, Response);
	EndIf;
	
	Return Response;

EndFunction

Function RedirectRequest(Session, ConnectionSettings, PreparedRequest, RedirectResponsae)
	
	Redirect = 0;
	
	While RedirectResponsae.IsRedirect Do
		
		PrepareRequestToRedirect(Session, PreparedRequest, RedirectResponsae);
		
		RedirectResponsae = SendRequest(Session, PreparedRequest, ConnectionSettings);
		
		Redirect = Redirect + 1;
		
		If Redirect > Session.MaximumNumberOfRedirects Then
			Raise("TooManyRedirects");
		EndIf;
		
	EndDo;
	
	Return RedirectResponsae;
	
EndFunction

Procedure PrepareRequestToRedirect(Session, PreparedRequest, RedirectResponsae)
	
	HTTPStatusCodes = HTTPStatusCodes();
	
	NewURL = NewURLOnRedirect(RedirectResponsae);
	
	PreparedRequest.URL = EncodeString(NewURL, StringEncodingMethod.URLInURLEncoding);
	NewHTTPRequest = New HTTPRequest(AssembleResourceAddress(ParseURL(NewURL), Undefined));
	OverrideMethod(PreparedRequest, RedirectResponsae);

	If RedirectResponsae.StatusCode <> HTTPStatusCodes.TemporaryRedirect_307
		And RedirectResponsae.StatusCode <> HTTPStatusCodes.PermanentRedirect_308 Then
		RemoveHeaders(PreparedRequest.Headers, "content-length,content-type,transfer-encoding"); //@non-nls-1
		NewHTTPRequest.Headers = PreparedRequest.Headers;
	Else
		InitialStreem = PreparedRequest.HTTPRequest.GetBodyAsStream();
		InitialStreem.CopyTo(NewHTTPRequest.GetBodyAsStream());
	EndIf;
	
	PreparedRequest.HTTPRequest = NewHTTPRequest;
	RemoveHeaders(PreparedRequest.Headers, "cookies");

	PreparedRequest.Cookies = MergeCookies(Session.Cookies, PreparedRequest.Cookies);
	PrepareCookies(PreparedRequest);
	
EndProcedure

Procedure PrepareAuthentication(PreparedRequest)

	PreparedRequest.Insert("ResponseEvents", New Array);
	If Not ValueIsFilled(PreparedRequest.Authentication) Then
		URLComposition = ParseURL(PreparedRequest.URL);
		If ValueIsFilled(URLComposition.Authentication) Then
			PreparedRequest.Authentication = URLComposition.Authentication;
		EndIf;
	EndIf;

	If ValueIsFilled(PreparedRequest.Authentication) Then
		If PreparedRequest.Authentication.Property("Type") Then
			AuthenticationType = Lower(PreparedRequest.Authentication.Type);
			If AuthenticationType = "digest" Then //@non-nls-1
				PreparedRequest.ResponseEvents.Add("ОбработкаОтветаСКодом401");
			EndIf;
			If AuthenticationType = "aws4-hmac-sha256" Then //@non-nls-1
				PrepareAuthenticationAWS4(PreparedRequest);
			EndIf;
		EndIf;
	EndIf;

EndProcedure

Procedure PrepareRequestBody(PreparedRequest, Data, Files, Json, JSONWriterSettings)

	URLComposition = ParseURL(PreparedRequest.URL);

	HTTPRequest = New HTTPRequest;
	HTTPRequest.ResourceAddress = AssembleResourceAddress(URLComposition, PreparedRequest.RequestParameters);
	If ValueIsFilled(Files) Then
		ContentTypeHeader = EnocodeFiles(HTTPRequest, Files, Data);
	ElsIf ValueIsFilled(Data) Then
		ContentTypeHeader = "application/x-www-form-urlencoded"; //@non-nls-1
		If TypeOf(Data) = Type("ДвоичныеДанные") Then
			HTTPRequest.SetBodyFromBinaryData(Data);
		Else
			If TypeOf(Data) = Type("String") Then
				Body = Data;
			Else
				Body = EncodeRequestParameters(Data);
			EndIf;
			HTTPRequest.SetBodyFromString(Body, TextEncoding.UTF8, ByteOrderMarkUse.DontUse);
		EndIf;
	ElsIf Json <> Undefined Then
		ContentTypeHeader = "application/json"; //@non-nls-1
		JsonString = ObjectToJson(Json, PreparedRequest.JSONConversionParameters, JSONWriterSettings);
		HTTPRequest.SetBodyFromString(JsonString, TextEncoding.UTF8, ByteOrderMarkUse.DontUse);
	Else
		ContentTypeHeader = Undefined;
	EndIf;
	HeaderValue = HeaderValue("content-type", PreparedRequest.Headers); //@non-nls-1
	If HeaderValue = False And ValueIsFilled(ContentTypeHeader) Then
		PreparedRequest.Headers.Insert("Content-Type", ContentTypeHeader); //@non-nls-1
	EndIf;

	HTTPRequest.Headers = PreparedRequest.Headers;

	PackRequest(HTTPRequest);

	PreparedRequest.Insert("HTTPRequest", HTTPRequest);

EndProcedure

Function EnocodeFiles(HTTPRequest, Files, Data)

	Parts = New Array;
	If ValueIsFilled(Data) Then
		For Each Field In Data Do
			Parts.Add(NewFormField(New Structure("Name,Data", Field.Key, Field.Value)));
		EndDo;
	EndIf;
	If TypeOf(Files) = Type("Array") Then
		For Each File In Files Do
			Parts.Add(NewFormField(File));
		EndDo;
	Else
		Parts.Add(NewFormField(Files));
	EndIf;

	Delimiter = StrReplace(New UUID, "-", "");
	StringDelimiter = Chars.CR + Chars.LF;

	DataWriter = HTTPRequest.GetBodyAsStream();
	Var_132_DataWriter = New DataWriter(DataWriter, TextEncoding.UTF8, ByteOrder.LittleEndian, "", "", False);
	For Each Part In Parts Do
		Var_132_DataWriter.WriteLine("--" + Delimiter + StringDelimiter);
		Var_132_DataWriter.WriteLine(HeadersToString(Part.Headers));
		If TypeOf(Part.Data) = Type("BinaryData") Then
			Var_132_DataWriter.Write(Part.Data);
		Else
			Var_132_DataWriter.WriteLine(Part.Data);
		EndIf;
		Var_132_DataWriter.WriteLine(StringDelimiter);
	EndDo;
	Var_132_DataWriter.WriteLine("--" + Delimiter + "--" + StringDelimiter);
	Var_132_DataWriter.Close();

	Return StrTemplate("multipart/form-data; boundary=%1", Delimiter); //@non-nls-1

EndFunction

Function NewFormField(SourceParameters)

	Field = New Structure("Name,FileName,Data,Type,Headers");
	Field.Name = SourceParameters.Name;
	Field.Data = SourceParameters.Data;

	Field.Type = ValueByKey(SourceParameters, "Type");
	Field.Headers = ValueByKey(SourceParameters, "Headers", New Map);
	Field.FileName = ValueByKey(SourceParameters, "FileName");

	Var_Key = "Content-Disposition"; //@non-nls-1
	If HeaderValue("content-disposition", Field.Headers, Var_Key) = False Then //@non-nls-1
		Field.Headers.Insert("Content-Disposition", "form-data"); //@non-nls-1 //@non-nls-2
	EndIf;

	Parts = New Array;
	Parts.Add(Field.Headers[Var_Key]);
	Parts.Add(StrTemplate("name=""%1""", Field.Name)); //@non-nls-1
	If ValueIsFilled(Field.FileName) Then
		Parts.Add(StrTemplate("filename=""%1""", Field.FileName)); //@non-nls-1
	EndIf;

	Field.Headers[Var_Key] = StrConcat(Parts, "; ");
	Field.Headers["Content-Type"] = Field.Type; //@non-nls-1

	Return Field;

EndFunction

Function FillRequestParameters(Path)

	RequestParameters = New Map;

	Query = "";
	SplitStringByDelimiter(Query, Path, "?", True);
	For Each KeyEqualParameterString In StrSplit(Query, "&", False) Do
		KeyEqualParameterString = DecodeString(
			KeyEqualParameterString, StringEncodingMethod.URLInURLEncoding);

		EqualSignPosition = StrFind(KeyEqualParameterString, "=");
		If EqualSignPosition = 0 Then
			Var_Key = KeyEqualParameterString;
			Value = Undefined;
		Else
			Var_Key = Left(KeyEqualParameterString, EqualSignPosition - 1);
			Value = Mid(KeyEqualParameterString, EqualSignPosition + 1);
		EndIf;

		If RequestParameters.Get(Var_Key) <> Undefined Then
			If TypeOf(RequestParameters[Var_Key]) = Type("Array") Then
				RequestParameters[Var_Key].Add(Value);
			Else
				Values = New Array;
				Values.Add(RequestParameters[Var_Key]);
				Values.Add(Value);
				RequestParameters[Var_Key] = Values;
			EndIf;
		Else
			RequestParameters.Insert(Var_Key, Value);
		EndIf;

	EndDo;

	Return RequestParameters;

EndFunction

Function EncodeRequestParameters(RequestParameters)

	RequestParametersParts = New Array;
	For Each Parameter In RequestParameters Do
		If TypeOf(Parameter.Value) = Type("Array") Then
			Values = Parameter.Value;
		Else
			Values = New Array;
			Values.Add(Parameter.Value);
		EndIf;

		If Parameter.Value = Undefined Then
			RequestParametersParts.Add(Parameter.Key);
		Else
			For Each Value In Values Do
				ParameterValue = EncodeString(Value, StringEncodingMethod.URLEncoding);
				RequestParametersParts.Add(StrTemplate("%1=%2", Parameter.Key, ParameterValue));
			EndDo;
		EndIf;
	EndDo;

	Return StrConcat(RequestParametersParts, "&");

EndFunction

Procedure OverrideMethod(PreparedRequest, Response)

	HTTPStatusCodes = HTTPStatusCodes();

	Method = PreparedRequest.Method;

	// http://tools.ietf.org/html/rfc7231#section-6.4.4
	If Response.StatusCode = HTTPStatusCodes.SeeOther_303 And Method <> "HEAD" Then //@non-nls-1
		Method = "GET"; //@non-nls-1
	EndIf;

	// Поведение браузеров
	If Response.StatusCode = HTTPStatusCodes.MovedTemporarily_302 And Method <> "HEAD" Then //@non-nls-1
		Method = "GET"; //@non-nls-1
	EndIf;

	PreparedRequest.Method = Method;

EndProcedure

Function SendRequest(Session, PreparedRequest, Settings)

	Start = CurrentUniversalDateInMilliseconds();
	MillisecondsInSecond = 1000;

	RetriesNumber = 0;
	Duration = 0;
	Errors = New Array;
	
	While True Do
		Try
			Response = SendHTTPRequest(Session, PreparedRequest, Settings);
		Except
			RequestExecutionError = ErrorInfo();
			
			ErrorText = StrTemplate(
				NStr("ru = 'HTTP %1 %2
				           |Network error:
				           |%3';
							|en = 'HTTP %1 %2
							|
							|Network error:
							|
							|%3';"),
				PreparedRequest.Method,
				PreparedRequest.URL,
				DetailErrorDescription(ErrorInfo())
			);
			Errors.Add(ErrorText);
		EndTry;

		RetriesNumber = RetriesNumber + 1;
		Duration = (CurrentUniversalDateInMilliseconds() - Start) / MillisecondsInSecond;

		If Not RequestMustBeRepeated(Response, Settings, RequestExecutionError) Then
			Break;
		EndIf;

		If RetriesNumber > Settings.MaximumNumberOfRetries
			Or Duration > Settings.MaximumTimeOfRetries Then
			Break;
		EndIf;

		If RequestExecutionError <> Undefined
			Or Not IsStatusCodeForWhichRetryAfterHeaderMustBeConsidered(Response.StatusCode) Then
			RetryAfterHeader = False;
		Else
			RetryAfterHeader = HeaderValue("retry-after", Response.Headers); //@non-nls-1
		EndIf;
		
		If RequestExecutionError <> Undefined Then
			Errors.Add(AsException(Response));
		EndIf;
		
		PauseDuration = CalculatePauseDuration(
			RetriesNumber,
			Settings.ExponentialDelayRatio,
			RetryAfterHeader,
			Settings.MaximumTimeOfRetries - Duration);
		Pause(PauseDuration);
	EndDo;

	If RequestExecutionError <> Undefined Then
		Raise(DetailErrorDescription(RequestExecutionError));
	EndIf;

	ContentTypeHeader = HeaderValue("content-type", Response.Headers); //@non-nls-1
	If ContentTypeHeader = False Then
		ContentTypeHeader = "";
	EndIf;

	PreparedResponse = NewResponse();
	PreparedResponse.Method = PreparedRequest.Method;
	PreparedResponse.URL = PreparedRequest.URL;
	PreparedResponse.StatusCode = Response.StatusCode;
	PreparedResponse.Headers = Response.Headers;
	PreparedResponse.Body = Response.GetBodyAsBinaryData();
	PreparedResponse.Encoding = EncodingFromHeader(ContentTypeHeader);
	PreparedResponse.ExecutionTime = CurrentUniversalDateInMilliseconds() - Start;
	PreparedResponse.IsPermanentRedirect = IsPermanentRedirect(Response.StatusCode, Response.Headers);
	PreparedResponse.IsRedirect = IsRedirect(Response.StatusCode, Response.Headers);
	PreparedResponse.Cookies = ExtractCookies(Response.Headers, PreparedRequest.URL);
	
	Session.Cookies = MergeCookies(Session.Cookies, PreparedResponse.Cookies);

	Return PreparedResponse;

EndFunction

Function SendHTTPRequest(Session, PreparedRequest, Settings)

	URLComposition = ParseURL(PreparedRequest.URL);
	Connection = Connection(URLComposition, PreparedRequest.Authentication, Settings, Session);
	Response = Connection.CallHTTPMethod(PreparedRequest.Method, PreparedRequest.HTTPRequest);

	For Each Handler In PreparedRequest.ResponseEvents Do
		If Handler = "Code401_ResponseHandler" Then
			Code401_ResponseHandler(Session, PreparedRequest, Settings, Response);
		EndIf;
	EndDo;

	Return Response;

EndFunction

Function RequestMustBeRepeated(Response, Settings, RequestExecutionError)

	If Settings.MaximumNumberOfRetries < 1 Then
		RetryRequest = False;
	ElsIf RequestExecutionError <> Undefined Or RetryOnStatusCode(Response.StatusCode, Settings) Then
		RetryRequest = True;
	Else
		RetryAfterHeader = HeaderValue("retry-after", Response.Headers); //@non-nls-1
		RetryRequest = RetryAfterHeader <> False
			And IsStatusCodeForWhichRetryAfterHeaderMustBeConsidered(Response.StatusCode);
	EndIf;

	Return RetryRequest;

EndFunction

Function RetryOnStatusCode(StatusCode, Settings)

	RetryOnAnyStatusCodeMoreOrEqual500 = Settings.ToRetryForStatusesCodes = Undefined
		And StatusCode >= HTTPStatusCodes().InternalServerError_500;
	StatusCodeMatchesRetryStatusCode = TypeOf(Settings.ToRetryForStatusesCodes) = Type("Array")
		And Settings.ToRetryForStatusesCodes.Find(StatusCode) <> Undefined;
	Return RetryOnAnyStatusCodeMoreOrEqual500 Or StatusCodeMatchesRetryStatusCode;

EndFunction

Function IsPermanentRedirect(StatusCode, Headers)

	HTTPStatusCodes = HTTPStatusCodes();

	Return ExistsLocationHeader(Headers)
		And (StatusCode = HTTPStatusCodes.MovedPermanently_301
		Or StatusCode = HTTPStatusCodes.PermanentRedirect_308);

EndFunction

Function IsRedirect(StatusCode, Headers)

	HTTPStatusCodes = HTTPStatusCodes();

	RedirectState = New Array;
	RedirectState.Add(HTTPStatusCodes.MovedPermanently_301);
	RedirectState.Add(HTTPStatusCodes.MovedTemporarily_302);
	RedirectState.Add(HTTPStatusCodes.SeeOther_303);
	RedirectState.Add(HTTPStatusCodes.TemporaryRedirect_307);
	RedirectState.Add(HTTPStatusCodes.PermanentRedirect_308);

	Return ExistsLocationHeader(Headers) And RedirectState.Find(StatusCode) <> Undefined;

EndFunction

Procedure PackRequest(Query)

	Header = HeaderValue("content-encoding", Query.Headers);  //@non-nls-1
	If Header <> False Then
		If Lower(Header) = "gzip" Then //@non-nls-1
			Query.SetBodyFromBinaryData(WriteGZip(Query.GetBodyAsBinaryData()));
		EndIf;
	EndIf;

EndProcedure

Function UnpackResponse(Response)

	Header = HeaderValue("content-encoding", Response.Headers); //@non-nls-1
	If Header <> False Then
		If Lower(Header) = "gzip" Then //@non-nls-1
			Return ReadGZip(Response.Body);
		EndIf;
	EndIf;

	Return Response.Body;

EndFunction

#EndRegion

#Region EventsHandlers

Procedure Code401_ResponseHandler(Session, PreparedRequest, Settings, Response)

	If IsRedirect(Response.StatusCode, Response.Headers) Then
		Return;
	EndIf;

	HTTPStatusCodes = HTTPStatusCodes();
	If Response.StatusCode < HTTPStatusCodes.BadRequest_400
		Or Response.StatusCode >= HTTPStatusCodes.InternalServerError_500 Then
		Return;
	EndIf;

	Value = HeaderValue("www-authenticate", Response.Headers); //@non-nls-1
	If Value <> False And StrFind(Lower(Value), "digest") Then //@non-nls-1
		Position = StrFind(Lower(Value), "digest"); //@non-nls-1
		Value = Mid(Value, Position + StrLen("digest") + 1); //@non-nls-1
		Value = StrReplace(Value, """", "");
		Value = StrReplace(Value, Chars.LF, "");

		DigestParameters = New Structure("algorithm,realm,nonce,qop,opaque"); //@non-nls-1
		For Each Part In SplitStringByString(Value, ", ") Do
			KeyValue = StrSplit(Part, "=");
			DigestParameters.Insert(KeyValue[0], KeyValue[1]);
		EndDo;

		Session.ServiceData.DigestParameters = DigestParameters;

		PreparedRequest.Headers.Insert("Authorization", PrepareHeaderDigest(Session, PreparedRequest)); //@non-nls-1
		PreparedRequest.HTTPRequest.Headers = PreparedRequest.Headers;

		Response = SendHTTPRequest(Session, PreparedRequest, Settings);
	EndIf;

EndProcedure

#EndRegion

#Region URL

Function PrepareURL(Val URL, RequestParameters = Undefined)

	URL = TrimL(URL);

	URLComposition = ParseURL(URL);

	PreparedURL = URLComposition.Scheme + "://";
	If ValueIsFilled(URLComposition.Authentication.User) Then
		PreparedURL = PreparedURL
			+ URLComposition.Authentication.User + ":"
			+ URLComposition.Authentication.Password + "@";
	EndIf;
	PreparedURL = PreparedURL + URLComposition.Host;
	If ValueIsFilled(URLComposition.Port) Then
		PreparedURL = PreparedURL + ":" + Format(URLComposition.Port, "NGS=; NG=");
	EndIf;

	PreparedURL = PreparedURL + AssembleResourceAddress(URLComposition, RequestParameters);

	Return PreparedURL;

EndFunction

Function AssembleResourceAddress(URLComposition, RequestParameters)

	ResourceAddress = URLComposition.Path;

	MergedRequestParameters = Join(Copy(RequestParameters), URLComposition.RequestParameters);
	If ValueIsFilled(MergedRequestParameters) Then
		ResourceAddress = ResourceAddress + "?" + EncodeRequestParameters(MergedRequestParameters);
	EndIf;
	If ValueIsFilled(URLComposition.Fragment) Then
		ResourceAddress = ResourceAddress + "#" + URLComposition.Fragment;
	EndIf;

	Return ResourceAddress;

EndFunction

Function NewURLOnRedirect(Response)

	NewURL = HeaderValue("location", Response.Headers); //@non-nls-1
	NewURL = DecodeString(NewURL, StringEncodingMethod.URLInURLEncoding);

	// Редирект без схемы
	If StrStartsWith(NewURL, "//") Then
		URLComposition = ParseURL(Response.URL);
		NewURL = URLComposition.Scheme + ":" + NewURL;
	EndIf;

	URLComposition = ParseURL(NewURL);
	If Not ValueIsFilled(URLComposition.Host) Then
		URLResponseComposition = ParseURL(Response.URL);
		BaseURL = StrTemplate("%1://%2", URLResponseComposition.Scheme, URLResponseComposition.Host);
		If ValueIsFilled(URLResponseComposition.Port) Then
			BaseURL = BaseURL + ":" + Format(URLResponseComposition.Port, "NGS=; NG=");
		EndIf;
		NewURL = BaseURL + NewURL;
	EndIf;

	Return NewURL;

EndFunction

Function IsHTTPStandardPort(URLComposition)

	HTTPStandardPort = 80;
	HTTPSStandardPort = 443;

	Return (URLComposition.Scheme = "http" And URLComposition.Port = HTTPStandardPort) //@non-nls-1
		Or (URLComposition.Scheme = "https" And URLComposition.Port = HTTPSStandardPort); //@non-nls-1

EndFunction

#EndRegion

#Region WorkWithConnection

Function ConnectionSettings(Method, URL, AdditionalParameters)

	AllowRedirect =
		ValueByKey(AdditionalParameters, "AllowRedirect", Upper(Method) <> "HEAD"); //@non-nls-2
	VerifySSL = ValueByKey(AdditionalParameters, "VerifySSL", True);
	ClientSSLCertificate = ValueByKey(AdditionalParameters, "ClientSSLCertificate");
	Proxy = ValueByKey(AdditionalParameters, "Proxy", ProxyByDefault(URL));
	MaximumNumberOfRetries = ValueByKey(AdditionalParameters, "MaximumNumberOfRetries", 0);
	ToRetryForStatusesCodes =
		ValueByKey(AdditionalParameters, "ToRetryForStatusesCodes", Undefined);
	ExponentialDelayRatio =
		ValueByKey(AdditionalParameters, "ExponentialDelayRatio", 1);
	MaximumTimeOfRetries = ValueByKey(AdditionalParameters, "MaximumTimeOfRetries", 600);

	Settings = New Structure;
	Settings.Insert("Timeout", Timeout(AdditionalParameters));
	Settings.Insert("AllowRedirect", AllowRedirect);
	Settings.Insert("VerifySSL", VerifySSL);
	Settings.Insert("ClientSSLCertificate", ClientSSLCertificate);
	Settings.Insert("Proxy", Proxy);
	Settings.Insert("MaximumNumberOfRetries", MaximumNumberOfRetries);
	Settings.Insert("ToRetryForStatusesCodes", ToRetryForStatusesCodes);
	Settings.Insert("ExponentialDelayRatio", ExponentialDelayRatio);
	Settings.Insert("MaximumTimeOfRetries", MaximumTimeOfRetries);

	Return Settings;

EndFunction

Function Connection(ConnectionParameters, Authentication, AdditionalParameters, Session)

	If Not ValueIsFilled(ConnectionParameters.Port) Then
		If ConnectionParameters.Scheme = "https" Then //@non-nls-1
			ConnectionParameters.Port = 443;
		Else
			ConnectionParameters.Port = 80;
		EndIf;
	EndIf;

	SecureConnection = Undefined;
	If ConnectionParameters.Scheme = "https" Then //@non-nls-1
		SecureConnection = SecureConnectionObject(AdditionalParameters);
	EndIf;

	User = "";
	Password = "";
	If ValueIsFilled(Authentication) Then
		If Authentication.Property("User") And Authentication.Property("Password") Then
			User = Authentication.User;
			Password = Authentication.Password;
		EndIf;
	EndIf;

	UseOSAuthentication = Authentication.Property("UseOSAuthentication")
		And Authentication.UseOSAuthentication = True;

	CalculateIDParameters = New Array;
	CalculateIDParameters.Add(ConnectionParameters.Host);
	CalculateIDParameters.Add(ConnectionParameters.Port);
	CalculateIDParameters.Add(User);
	CalculateIDParameters.Add(Password);
	CalculateIDParameters.Add(AdditionalParameters.Timeout);
	CalculateIDParameters.Add(UseOSAuthentication);
	CalculateIDParameters.Add(SecureConnection);
	CalculateIDParameters.Add(AdditionalParameters.Proxy);

	If Not Session.Property("ServiceData") Or TypeOf(Session.ServiceData) <> Type("Structure") Then
		Session.Insert("ServiceData", New Structure);
	EndIf;
	If Not Session.ServiceData.Property("ConnectionsPool") Then
		Session.ServiceData.Insert("ConnectionsPool", New Map);
	EndIf;
	ConnectionsPool = Session.ServiceData.ConnectionsPool;

	ConnectionID = ConnectionID(CalculateIDParameters);

	If ConnectionsPool.Get(ConnectionID) = Undefined Then
		NewConnection = New HTTPConnection(
			ConnectionParameters.Host,
			ConnectionParameters.Port,
			User, Password,
			AdditionalParameters.Proxy,
			AdditionalParameters.Timeout,
			SecureConnection,
			UseOSAuthentication);
		ConnectionsPool.Insert(ConnectionID, NewConnection);
	EndIf;

	Return ConnectionsPool[ConnectionID];

EndFunction

Function ConnectionID(ConnectionParameters)

	CalculateIDParameters = New Array;

	For Each Item In ConnectionParameters Do
		ItemType = TypeOf(Item);
		If ItemType = Type("InternetProxy") Then
			CalculateIDParameters.Add(StrConcat(Item.BypassProxyOnAddresses, ""));
			CalculateIDParameters.Add(XMLString(Item.BypassProxyOnLocal));
			CalculateIDParameters.Add(Item.User);
			CalculateIDParameters.Add(Item.Password);
		ElsIf ItemType = Type("OpenSSLSecureConnection") Then
			// Для упрощения будет считать, что сертификаты в рамках сессии не меняются
			If Item.ClientCertificate = Undefined Then
				CalculateIDParameters.Add("");
			Else
				CalculateIDParameters.Add(String(TypeOf(Item.ClientCertificate)));
			EndIf;
			If Item.CertificationAuthorityCertificates = Undefined Then
				CalculateIDParameters.Add("");
			Else
				CalculateIDParameters.Add(String(TypeOf(Item.CertificationAuthorityCertificates)));
			EndIf;
		Else
			CalculateIDParameters.Add(XMLString(Item));
		EndIf;
	EndDo;

	Return DataHashing(HashFunction.MD5, StrConcat(CalculateIDParameters, ""));

EndFunction

Function SecureConnectionObject(AdditionalParameters)

	If AdditionalParameters.VerifySSL = False Then
		CertificatesCA = Undefined;
	ElsIf TypeOf(AdditionalParameters.VerifySSL) = Type("FileCertificationAuthorityCertificates") Then
		CertificatesCA = AdditionalParameters.VerifySSL;
	Else
		CertificatesCA = New OSCertificationAuthorityCertificates;
	EndIf;
	ClientCertificate = Undefined;
	If TypeOf(AdditionalParameters.ClientSSLCertificate) = Type("FileClientCertificate")
		Or TypeOf(AdditionalParameters.ClientSSLCertificate) = Type("WindowsClientCertificate") Then
		ClientCertificate = AdditionalParameters.ClientSSLCertificate;
	EndIf;

	Return New OpenSSLSecureConnection(ClientCertificate, CertificatesCA);

EndFunction

Function Timeout(AdditionalParameters)

	If AdditionalParameters.Property("Timeout") And ValueIsFilled(AdditionalParameters.Timeout) Then
		Timeout = AdditionalParameters.Timeout;
	Else
		Timeout = TimeoutByDefault();
	EndIf;

	Return Timeout;

EndFunction

Function ProxyByDefault(URL)

	ProxyByDefault = New InternetProxy;
	// BSLLS:ExecuteExternalCodeInCommonModule-off
	CMNameGetFilesSSL = "GetFilesFromInternet";
	If Metadata.CommonModules.Find(CMNameGetFilesSSL) <> Undefined Then
		URLComposition = ParseURL(URL);
		Module = Eval(CMNameGetFilesSSL);
		ProxyByDefault = Module.ПолучитьПрокси(URLComposition.Scheme);
	EndIf;
	// BSLLS:ExecuteExternalCodeInCommonModule-on

	Return ProxyByDefault;

EndFunction

Function CurrentSession(Session)

	If Session = Undefined Then
		Session = NewSession();
	EndIf;

	Return Session;

EndFunction

#EndRegion

#Region Headers

Function HeadersToString(Headers)

	StringDelimiter = Chars.CR + Chars.LF;
	Strings = New Array;

	SortedHeaders = "Content-Disposition,Content-Type,Content-Location"; //@non-nls-1
	For Each Var_Key In StrSplit(SortedHeaders, ",") Do
		Value = HeaderValue(Var_Key, Headers);
		If Value <> False And ValueIsFilled(Value) Then
			Strings.Add(StrTemplate("%1: %2", Var_Key, Value));
		EndIf;
	EndDo;

	Keys = StrSplit(Upper(SortedHeaders), ",");
	For Each Header In Headers Do
		If Keys.Find(Upper(Header.Key)) = Undefined Then
			Strings.Add(StrTemplate("%1: %2", Header.Key, Header.Value));
		EndIf;
	EndDo;
	Strings.Add(StringDelimiter);

	Return StrConcat(Strings, StringDelimiter);

EndFunction

Procedure RemoveHeaders(Headers, HeadersListAsString)

	HeadersToRemove = New Array;
	HeadersList = StrSplit(HeadersListAsString, ",", False);
	For Each Header In Headers Do
		If HeadersList.Find(Lower(Header.Key)) <> Undefined Then
			HeadersToRemove.Add(Header.Key);
		EndIf;
	EndDo;
	For Each HeaderToRemove In HeadersToRemove Do
		Headers.Delete(HeaderToRemove);
	EndDo;

EndProcedure

Function ExistsLocationHeader(Headers)

	Return HeaderValue("location", Headers) <> False; //@non-nls-1

EndFunction

Function EncodingFromHeader(Val Header)

	Encoding = Undefined;

	Header = Lower(TrimAll(Header));
	DelimiterIndex = StrFind(Header, ";");
	If DelimiterIndex Then
		ContentType = TrimAll(Left(Header, DelimiterIndex - 1));
		EncodingKey = "charset="; //@non-nls-1
		EncodingIndex = StrFind(Header, EncodingKey);
		If EncodingIndex Then
			DelimiterIndex = StrFind(Header, ";", SearchDirection.FromBegin, EncodingIndex);
			InitialPosition = EncodingIndex + StrLen(EncodingKey);
			If DelimiterIndex Then
				EncodingLength = DelimiterIndex - InitialPosition;
			Else
				EncodingLength = StrLen(Header);
			EndIf;
			Encoding = Mid(Header, InitialPosition, EncodingLength);
			Encoding = StrReplace(Encoding, """", "");
			Encoding = StrReplace(Encoding, "'", "");
		EndIf;
	Else
		ContentType = Header;
	EndIf;

	If Encoding = Undefined And StrFind(ContentType, "text") Then //@non-nls-1
		Encoding = "iso-8859-1"; //@non-nls-1
	EndIf;

	Return Encoding;

EndFunction

Function HeaderValue(Header, AllHeaders, Var_Key = Undefined)

	For Each NextHeader In AllHeaders Do
		If Lower(NextHeader.Key) = Lower(Header) Then
			Var_Key = NextHeader.Key;
			Return NextHeader.Value;
		EndIf;
	EndDo;

	Return False;

EndFunction

Function CreateHostHeaderValue(URLComposition)

	Host = URLComposition.Host;
	If ValueIsFilled(URLComposition.Port) And Not IsHTTPStandardPort(URLComposition) Then
		Host = Host + ":" + Format(URLComposition.Port, "NGS=; NG=");
	EndIf;

	Return Host;

EndFunction

Function PrepareHeaderDigest(Session, PreparedRequest)

	DigestParameters = Session.ServiceData.DigestParameters;

	Algorithm = DetermineHashFunction(DigestParameters.algorithm);
	AlgorithmString = Upper(DigestParameters.algorithm);
	If Algorithm = Undefined Then
		Return Undefined;
	EndIf;

	URLComposition = ParseURL(PreparedRequest.URL);
	Path = URLComposition.Path;
	If ValueIsFilled(URLComposition.RequestParameters) Then
		Path = Path + "?" + EncodeRequestParameters(URLComposition.RequestParameters);
	EndIf;

	A1 = StrTemplate("%1:%2:%3",
		PreparedRequest.Authentication.User,
		DigestParameters.realm,
		PreparedRequest.Authentication.Password);
	A2 = StrTemplate("%1:%2", PreparedRequest.Method, Path);

	HA1 = DataHashing(Algorithm, A1);
	HA2 = DataHashing(Algorithm, A2);

	If Not DigestParameters.Property("last_nonce") Then //@non-nls-1
		DigestParameters.Insert("last_nonce"); //@non-nls-1
	EndIf;

	If DigestParameters.nonce = DigestParameters.last_nonce Then
		DigestParameters.nonce_count = DigestParameters.nonce_count + 1;
	Else
		DigestParameters.Insert("nonce_count", 1); //@non-nls-1
	EndIf;

	NCValue = Format(DigestParameters.nonce_count, "ND=8; NLZ=; NG=");
	NonceValue = Left(StrReplace(Lower(New UUID), "-", ""), 16);

	If AlgorithmString = "MD5-SESS" Then //@non-nls-1
		HA1 = DataHashing(Algorithm, StrTemplate("%1:%2:%3", HA1, DigestParameters.nonce, NonceValue));
	EndIf;

	If Not ValueIsFilled(DigestParameters.qop) Then
		ResponseValue = DataHashing(Algorithm, StrTemplate("%1:%2:%3", HA1, DigestParameters.nonce, HA2));
	ElsIf DigestParameters.qop = "auth" //@non-nls-1
		Or StrSplit(DigestParameters.qop, ",", False).Find("auth") <> Undefined Then //@non-nls-2
		NonceBitValue = StrTemplate("%1:%2:%3:%4:%5", DigestParameters.nonce, NCValue, NonceValue, "auth", HA2); //@non-nls-2
		ResponseValue = DataHashing(Algorithm, StrTemplate("%1:%2", HA1, NonceBitValue));
	Else
		// INFO: auth-int не реализовано
		Return Undefined;
	EndIf;

	DigestParameters.last_nonce = DigestParameters.nonce;

	Basis = StrTemplate(
		"username=""%1"", realm=""%2"", nonce=""%3"", uri=""%4"", response=""%5""", //@non-nls-1
		PreparedRequest.Authentication.User,
		DigestParameters.realm,
		DigestParameters.nonce,
		Path,
		ResponseValue
	);
	Strings = New Array;
	Strings.Add(Basis);

	If ValueIsFilled(DigestParameters.opaque) Then
		Strings.Add(StrTemplate(", opaque=""%1""", DigestParameters.opaque)); //@non-nls-1
	EndIf;
	If ValueIsFilled(DigestParameters.algorithm) Then
		Strings.Add(StrTemplate(", algorithm=""%1""", DigestParameters.algorithm)); //@non-nls-1
	EndIf;
	If ValueIsFilled(DigestParameters.qop) Then
		Strings.Add(StrTemplate(", qop=""auth"", nc=%1, cnonce=""%2""", NCValue, NonceValue)); //@non-nls-1
	EndIf;

	Return StrTemplate("Digest %1", StrConcat(Strings, "")); //@non-nls-1

EndFunction

#EndRegion

#Region Cookies

Procedure PrepareCookies(PreparedRequest)

	ЗаголовокCookie = PrepareCookieHeader(PreparedRequest);
	If ValueIsFilled(ЗаголовокCookie) Then
		PreparedRequest.Headers["Cookie"] = ЗаголовокCookie;
	EndIf;

EndProcedure

Function PrepareCookieHeader(PreparedRequest)

	URLComposition = ParseURL(PreparedRequest.URL);

	Cookies = New Array;
	For Each Cookie In SelectCookiesForRequest(URLComposition, PreparedRequest.Cookies) Do
		Cookies.Add(StrTemplate("%1=%2", Cookie.Description, Cookie.Value));
	EndDo;

	Return StrConcat(Cookies, "; ");

EndFunction

Function MergeCookies(MainSource, AdditionalSource)

	Cookies = New Map;
	For Each Cookie In TransformCookiesRepositoryToArray(MainSource) Do
		AddCookieToRepository(Cookies, Cookie, False);
	EndDo;
	For Each Cookie In TransformCookiesRepositoryToArray(AdditionalSource) Do
		AddCookieToRepository(Cookies, Cookie, False);
	EndDo;

	Return Cookies;

EndFunction

Function TransformCookiesRepositoryToArray(CookiesRepository)

	Cookies = New Array;
	If TypeOf(CookiesRepository) = Type("Array") Then
		For Each Cookie In CookiesRepository Do
			NewCookie = CookieConstructor();
			FillPropertyValues(NewCookie, Cookie);
			Cookies.Add(NewCookie);
		EndDo;

		Return Cookies;
	EndIf;

	For Each Domain In CookiesRepository Do
		For Each Path In Domain.Value Do
			For Each Var_265_Path In Path.Value Do
				Cookies.Add(Var_265_Path.Value);
			EndDo;
		EndDo;
	EndDo;

	Return Cookies;

EndFunction

Function SelectCookiesForRequest(URLComposition, Cookies)

	IsHostInRequest = AddLeadingDot(URLComposition.Host);

	Result = New Array;
	For Each Domain In Cookies Do
		If Not StrEndsWith(IsHostInRequest, Domain.Key) Then
			Continue;
		EndIf;
		For Each Path In Domain.Value Do
			If Not StrStartsWith(URLComposition.Path, Path.Key) Then
				Continue;
			EndIf;
			FillListWithFilteredCookies(Path.Value, URLComposition, Result);
		EndDo;
	EndDo;

	Return Result;

EndFunction

Procedure FillListWithFilteredCookies(Cookies, URLComposition, List)

	For Each Cookie In Cookies Do
		If Cookie.Value.OnlySecureConnection = True And URLComposition.Scheme <> "https" Then //@non-nls-1
			Continue;
		EndIf;
		// INFO: проверка срока действия игнорируется (Cookie.Значение.СрокДействия)
		// INFO: проверка порта игнорируется

		List.Add(Cookie.Value);
	EndDo;

EndProcedure

Function RefillCookie(Cookies, URL)

	URLComposition = ParseURL(URL);
	NewCookies = New Array;
	If TypeOf(Cookies) = Type("Array") Then
		For Each Cookie In Cookies Do
			NewCookie = CookieConstructor(Cookie.Description, Cookie.Value);
			FillPropertyValues(NewCookie, Cookie);

			If Not ValueIsFilled(NewCookie.Domain) Then
				NewCookie.Domain = URLComposition.Host;
			EndIf;
			If Not ValueIsFilled(NewCookie.Path) Then
				NewCookie.Path = "/";
			EndIf;

			NewCookies.Add(NewCookie);
		EndDo;

		Return NewCookies;
	EndIf;

	Return Cookies;

EndFunction

Function ExtractCookies(Headers, URL)

	CurrentTime = CurrentUniversalDate();
	Cookies = New Map;
	For Each NextHeader In Headers Do
		If Lower(NextHeader.Key) = "set-cookie" Then //@non-nls-1
			For Each ЗаголовокCookie In SplitIntoSeparateCookiesHeaders(NextHeader.Value) Do
				Cookie = ParseCookie(ЗаголовокCookie, URL, CurrentTime);
				If Cookie = Undefined Then
					Continue;
				EndIf;
				If Cookie.ExpiresOn <= CurrentTime Then
					DeleteCookieFromRepository(Cookies, Cookie);
				Else
					AddCookieToRepository(Cookies, Cookie);
				EndIf;
			EndDo;
		EndIf;
	EndDo;

	Return Cookies;

EndFunction

Function SplitIntoSeparateCookiesHeaders(Val Header)

	Headers = New Array;

	If Not ValueIsFilled(Header) Then
		Return Headers;
	EndIf;

	HeadersParts = StrSplit(Header, ",", False);

	SeparateHeader = HeadersParts[0];
	For Index = 1 To HeadersParts.UBound() Do
		Semicolon = StrFind(HeadersParts[Index], ";");
		EqualSign = StrFind(HeadersParts[Index], "=");
		If Semicolon And EqualSign And EqualSign < Semicolon Then
			Headers.Add(SeparateHeader);
			SeparateHeader = HeadersParts[Index];
		Else
			SeparateHeader = SeparateHeader + HeadersParts[Index];
		EndIf;
	EndDo;
	Headers.Add(SeparateHeader);

	Return Headers;

EndFunction

Procedure AddCookieToRepository(CookiesRepository, Cookie, ToReplace = False)

	If CookiesRepository.Get(Cookie.Domain) = Undefined Then
		CookiesRepository[Cookie.Domain] = New Map;
	EndIf;
	If CookiesRepository[Cookie.Domain].Get(Cookie.Path) = Undefined Then
		CookiesRepository[Cookie.Domain][Cookie.Path] = New Map;
	EndIf;
	If CookiesRepository[Cookie.Domain][Cookie.Path].Get(Cookie.Description) = Undefined Or ToReplace Then
		CookiesRepository[Cookie.Domain][Cookie.Path][Cookie.Description] = Cookie;
	EndIf;

EndProcedure

Procedure DeleteCookieFromRepository(CookiesRepository, Cookie)

	If CookiesRepository.Get(Cookie.Domain) <> Undefined
		And CookiesRepository[Cookie.Domain].Get(Cookie.Path) <> Undefined
		And CookiesRepository[Cookie.Domain][Cookie.Path].Get(Cookie.Description) <> Undefined Then
		CookiesRepository[Cookie.Domain][Cookie.Path].Delete(Cookie.Description);
	EndIf;

EndProcedure

Function ParseCookie(Header, URL, CurrentTime)

	Cookie = Undefined;
	Index = 0;

	For Each Parameter In StrSplit(Header, ";", False) Do
		Index = Index + 1;
		Parameter = TrimAll(Parameter);

		If Index = 1 Then
			Cookie = CreateCookieAndFillBasicParameters(Parameter);
			Continue;
		EndIf;

		Parts = StrSplit(Parameter, "=", False);
		Var_Key = Lower(Parts[0]);
		If Parts.Count() > 1 Then
			Value = Parts[1];
		EndIf;

		If Var_Key = "domain" Then //@non-nls-1
			Cookie.Domain = Value;
		ElsIf Var_Key = "path" Then //@non-nls-1
			Cookie.Path = Value;
		ElsIf Var_Key = "secure" Then //@non-nls-1
			Cookie.OnlySecureConnection = True;
		ElsIf Var_Key = "max-age" Then //@non-nls-1
			ExpiresOnMaxAge = CurrentTime + NumberFromString(Value);
		ElsIf Var_Key = "expires" Then //@non-nls-1
			Cookie.ExpiresOn = DateFromStringRFC7231(Value);
		Else
			Continue;
		EndIf;
	EndDo;
	If ValueIsFilled(Cookie) And ValueIsFilled(ExpiresOnMaxAge) Then
		Cookie.ExpiresOn = ExpiresOnMaxAge;
	EndIf;

	SipplementCookieWithImplicitValues(Cookie, URL);

	Return Cookie;

EndFunction

Function CreateCookieAndFillBasicParameters(Parameter)

	Parts = StrSplit(Parameter, "=", False);
	Description = Parts[0];
	If Parts.Count() > 1 Then
		Value = Parts[1];
	EndIf;

	Return CookieConstructor(Description, Value);

EndFunction

Procedure SipplementCookieWithImplicitValues(Cookie, URL)

	If Cookie = Undefined Then
		Return;
	EndIf;

	URLComposition = ParseURL(URL);
	If Not ValueIsFilled(Cookie.Domain) Then
		Cookie.Domain = URLComposition.Host;
	EndIf;
	If Not ValueIsFilled(Cookie.Port) And ValueIsFilled(URLComposition.Port) Then
		Cookie.Port = URLComposition.Port;
	EndIf;
	If Not ValueIsFilled(Cookie.Path) Then
		LastSlashPosition = StrFind(URLComposition.Path, "/", SearchDirection.FromEnd);
		If LastSlashPosition <= 1 Then
			Cookie.Path = "/";
		Else
			Cookie.Path = Left(URLComposition.Path, LastSlashPosition - 1);
		EndIf;
	EndIf;

EndProcedure

Function CookieConstructor(Description = "", Value = Undefined)

	NewCookie = New Structure;
	NewCookie.Insert("Description", Description);
	NewCookie.Insert("Value", Value);
	NewCookie.Insert("Domain", "");
	NewCookie.Insert("Path", "");
	NewCookie.Insert("Port");
	NewCookie.Insert("ExpiresOn", '39990101');
	NewCookie.Insert("OnlySecureConnection");

	Return NewCookie;

EndFunction

#EndRegion

#Region ConversionParametersWithJSON

// Converts a type value into a type, that can be serialized.
//
// Parameters:
//   Property - String - property name, if the structure or map is writing.
//   Value - Arbitrary - initial value.
//   AdditionalParameters - Arbitrary - additional parameters of the WriteJSON method.
//   Cancel - Boolean - cancel to write a property.
//
// Returns:
//   Arbitrary - see WriteJSON types.
//
Function JsonConversion(Property, Value, AdditionalParameters, Cancel) Export

	If TypeOf(Value) = Type("UUID") Then
		Return String(Value);
	ElsIf TypeOf(Value) = Type("BinaryData") Then
		Return GetBase64StringFromBinaryData(Value);
	Else
		// Если значение не поддерживает сериализацию в JSON, то будет выброшено исключение
		Return Value;
	EndIf;

EndFunction

// Restores a value of the type, which doesn't support deserialization
//
// Parameters:
//   Property - String - property name, which value has to be restored.
//   Value - String - value which has to be restored.
//   PropertiesTypes - Map - types of properties to be restored.
//     * Key - String - property name. Equals to a parameter Property value.
//     * Value - Type - source value type.
//
// Returns:
//   Arbitrary - restored value.
//
Function RestoreJson(Property, Value, PropertiesTypes) Export

	PropertyType = PropertiesTypes.Get(Property);
	If PropertyType = Type("UUID") Then
		Return New UUID(Value);
	ElsIf PropertyType = Type("BinaryData") Then
		Return GetBinaryDataFromBase64String(Value);
	Else
		Return Value;
	EndIf;

EndFunction

#EndRegion

#Region AWS4Authentication

Function SignatureKeyAWS4(SecretKey, Date, Region, Service)

	DateKey = SignMessageHMAC("AWS4" + SecretKey, Date); //@non-nls-1
	RegionKey = SignMessageHMAC(DateKey, Region);
	ServiceKey = SignMessageHMAC(RegionKey, Service);

	Return SignMessageHMAC(ServiceKey, "aws4_request"); //@non-nls-1

EndFunction

Function SignMessageHMAC(Val Var_Key, Val Message, Val Algorithm = Undefined)

	If Algorithm = Undefined Then
		Algorithm = HashFunction.SHA256;
	EndIf;

	If TypeOf(Var_Key) = Type("String") Then
		Var_Key = GetBinaryDataFromString(Var_Key, TextEncoding.UTF8, False);
	EndIf;
	If TypeOf(Message) = Type("String") Then
		Message = GetBinaryDataFromString(Message, TextEncoding.UTF8, False);
	EndIf;

	Return HMAC(Var_Key, Message, Algorithm);

EndFunction

Procedure PrepareAuthenticationAWS4(PreparedRequest)

	HeaderValue = HeaderValue("x-amz-date", PreparedRequest.Headers); //@non-nls-1
	If HeaderValue <> False Then
		CurrentTime = Date(StrReplace(StrReplace(HeaderValue, "T", ""), "Z", "")); //@non-nls-1 //@non-nls-3
	Else
		CurrentTime = CurrentUniversalDate();
	EndIf;
	PreparedRequest.Headers["x-amz-date"] = Format(CurrentTime, "DF=yyyyMMddTHHmmssZ"); //@non-nls-1
	ScopeDate = Format(CurrentTime, "ДФ=yyyyMMdd");

	PreparedRequest.Headers["x-amz-content-sha256"] = //@non-nls-1
		DataHashing(HashFunction.SHA256, PreparedRequest.HTTPRequest.GetBodyAsStream());

	URLComposition = ParseURL(PreparedRequest.URL);

	CanonicalHeaders = CanonicalHeadersAWS4(PreparedRequest.Headers, URLComposition);

	CanonicalPath = URLComposition.Path;
	CanonicalRequestParameters = CanonicalRequestParametersAWS4(URLComposition.RequestParameters);

	RequestParts = New Array;
	RequestParts.Add(PreparedRequest.Method);
	RequestParts.Add(CanonicalPath);
	RequestParts.Add(CanonicalRequestParameters);
	RequestParts.Add(CanonicalHeaders.CanonicalHeaders);
	RequestParts.Add(CanonicalHeaders.SignedHeaders);
	RequestParts.Add(PreparedRequest.Headers["x-amz-content-sha256"]); //@non-nls-1
	CanonicalRequest = StrConcat(RequestParts, Chars.LF);

	ScopeParts = New Array;
	ScopeParts.Add(ScopeDate);
	ScopeParts.Add(PreparedRequest.Authentication.Region);
	ScopeParts.Add(PreparedRequest.Authentication.Service);
	ScopeParts.Add("aws4_request"); //@non-nls-1
	Scope = StrConcat(ScopeParts, "/");

	StringForSignatureParts = New Array;
	StringForSignatureParts.Add(PreparedRequest.Authentication.Type);
	StringForSignatureParts.Add(PreparedRequest.Headers["x-amz-date"]); //@non-nls-1
	StringForSignatureParts.Add(Scope);
	StringForSignatureParts.Add(DataHashing(HashFunction.SHA256, CanonicalRequest));
	StringForSignature = StrConcat(StringForSignatureParts, Chars.LF);

	Var_Key = SignatureKeyAWS4(
		PreparedRequest.Authentication.SecretKey,
		ScopeDate,
		PreparedRequest.Authentication.Region,
		PreparedRequest.Authentication.Service);
	Signature = Lower(GetHexStringFromBinaryData(SignMessageHMAC(Var_Key, StringForSignature)));

	PreparedRequest.Headers["Authorization"] = StrTemplate( //@non-nls-1
		"%1 Credential=%2/%3, SignedHeaders=%4, Signature=%5", //@non-nls-1
		PreparedRequest.Authentication.Type,
		PreparedRequest.Authentication.AccessKeyID,
		Scope,
		CanonicalHeaders.SignedHeaders,
		Signature);

	PreparedRequest.HTTPRequest.Headers = PreparedRequest.Headers;

EndProcedure

Function CanonicalHeadersAWS4(Headers, URLComposition)

	List = New ValueList;

	HostHeadersIsInRequest = False;
	DefaultHeaders = HeadersByDefaultAWS4();
	For Each NextHeader In Headers Do
		Header = Lower(NextHeader.Key);
		If DefaultHeaders.Exceptions.Find(Header) <> Undefined Then
			Continue;
		EndIf;
		HostHeadersIsInRequest = Max(HostHeadersIsInRequest, Header = "host"); //@non-nls-1

		If DefaultHeaders.EqualSign.Find(Header) <> Undefined Then
			List.Add(Header, TrimAll(NextHeader.Value));
		Else
			For Each Prefix In DefaultHeaders.BeginsWith Do
				If StrStartsWith(Header, Prefix) Then
					List.Add(Header, TrimAll(NextHeader.Value));
					Break;
				EndIf;
			EndDo;
		EndIf;
	EndDo;

	If Not HostHeadersIsInRequest Then
		List.Add("host", CreateHostHeaderValue(URLComposition)); //@non-nls-1
	EndIf;

	List.SortByValue(SortDirection.Asc);

	CanonicalHeaders = New Array;
	SignedHeaders = New Array;
	For Each ListItem In List Do
		CanonicalHeaders.Add(ListItem.Value + ":" + ListItem.Presentation);
		SignedHeaders.Add(ListItem.Value);
	EndDo;
	CanonicalHeaders.Add("");

	CanonicalHeaders = StrConcat(CanonicalHeaders, Chars.LF);
	SignedHeaders = StrConcat(SignedHeaders, ";");
	Return New Structure(
		"CanonicalHeaders, SignedHeaders",
		CanonicalHeaders, SignedHeaders);

EndFunction

Function CanonicalRequestParametersAWS4(RequestParameters)

	List = New ValueList;
	For Each NextRequestParameter In RequestParameters Do
		List.Add(NextRequestParameter.Key, TrimAll(NextRequestParameter.Value));
	EndDo;
	List.SortByValue(SortDirection.Asc);

	CanonicalParameters = New Array;
	For Each ListItem In List Do
		ParameterValue = EncodeString(ListItem.Presentation, StringEncodingMethod.URLEncoding);
		CanonicalParameters.Add(ListItem.Value + "=" + ParameterValue);
	EndDo;

	Return StrConcat(CanonicalParameters, "&");

EndFunction

Function HeadersByDefaultAWS4()

	Headers = New Structure;
	Headers.Insert("EqualSign", StrSplit("host,content-type,date", ",")); //@non-nls-2
	Headers.Insert("BeginsWith", StrSplit("x-amz-", ",")); //@non-nls-2
	Headers.Insert("Exceptions", StrSplit("x-amz-client-context", ",")); //@non-nls-2

	Return Headers;

EndFunction

#EndRegion

#Region EncodingDecodingData

#Region ServiceStructuresZip

// Описание структур см. здесь https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT

Function ZipLFHSize()

	Return 34;

EndFunction

Function ZipDDSize()

	Return 16;

EndFunction

Function ZipCDHSize()

	Return 50;

EndFunction

Function ZipEOCDSize()

	Return 22;

EndFunction

Function ZipLFH()

	// Local file header
	Buffer = New BinaryDataBuffer(ZipLFHSize());
	Buffer.WriteInt32(0, 67324752); // signature 0x04034b50
	Buffer.WriteInt16(4, 20);       // version
	Buffer.WriteInt16(6, 10);       // bit flags
	Buffer.WriteInt16(8, 8);        // compression method
	Buffer.WriteInt16(10, 0);       // time
	Buffer.WriteInt16(12, 0);       // date
	Buffer.WriteInt32(14, 0);       // crc-32
	Buffer.WriteInt32(18, 0);       // compressed size
	Buffer.WriteInt32(22, 0);       // uncompressed size
	Buffer.WriteInt16(26, 4);       // filename legth - "data"
	Buffer.WriteInt16(28, 0);       // extra field length
	Buffer.Write(30, GetBinaryDataBufferFromString("data", "ascii", False)); //@non-nls-1 //@non-nls-2

	Return Buffer;

EndFunction

Function ZipDD(CRC32, CompressedDataSize, UncompressedDataSize)

	// Data descriptor
	Buffer = New BinaryDataBuffer(ZipDDSize());
	Buffer.WriteInt32(0, 134695760);
	Buffer.WriteInt32(4, CRC32);
	Buffer.WriteInt32(8, CompressedDataSize);
	Buffer.WriteInt32(12, UncompressedDataSize);

	Return Buffer;

EndFunction

Function ZipCDH(CRC32, CompressedDataSize, UncompressedDataSize)

	// Central directory header
	Buffer = New BinaryDataBuffer(ZipCDHSize());
	Buffer.WriteInt32(0, 33639248);              // signature 0x02014b50
	Buffer.WriteInt16(4, 798);                   // version made by
	Buffer.WriteInt16(6, 20);                    // version needed to extract
	Buffer.WriteInt16(8, 10);                    // bit flags
	Buffer.WriteInt16(10, 8);                    // compression method
	Buffer.WriteInt16(12, 0);                    // time
	Buffer.WriteInt16(14, 0);                    // date
	Buffer.WriteInt32(16, CRC32);                // crc-32
	Buffer.WriteInt32(20, CompressedDataSize);   // compressed size
	Buffer.WriteInt32(24, UncompressedDataSize); // uncompressed size
	Buffer.WriteInt16(28, 4);                    // file name length
	Buffer.WriteInt16(30, 0);                    // extra field length
	Buffer.WriteInt16(32, 0);                    // file comment length
	Buffer.WriteInt16(34, 0);                    // disk number start
	Buffer.WriteInt16(36, 0);                    // internal file attributes
	Buffer.WriteInt32(38, 2176057344);           // external file attributes
	Buffer.WriteInt32(42, 0);                    // relative offset of local header
	Buffer.Write(46, GetBinaryDataBufferFromString("data", "ascii", False)); //@non-nls-1 //@non-nls-2

	Return Buffer;

EndFunction

Function ZipEOCD(CompressedDataSize)

	// End of central directory
	CDHSize = 50;
	Buffer = New BinaryDataBuffer(ZipEOCDSize());
	Buffer.WriteInt32(0, 101010256); // signature 0x06054b50
	Buffer.WriteInt16(4, 0); // number of this disk
	Buffer.WriteInt16(6, 0); // number of the disk with the start of the central directory
	Buffer.WriteInt16(8, 1); // total number of entries in the central directory on this disk
	Buffer.WriteInt16(10, 1); // total number of entries in the central directory
	Buffer.WriteInt32(12, CDHSize); // size of the central directory
	// offset of start of central directory with respect to the starting disk number
	Buffer.WriteInt32(16, ZipLFHSize() + CompressedDataSize + ZipDDSize());
	Buffer.WriteInt16(20, 0); // the starting disk number

	Return Buffer;

EndFunction

#EndRegion

#Region ServiceStructuresGZip

// Описание структур см. здесь https://www.ietf.org/rfc/rfc1952.txt

Function GZipHeaderSize()

	Return 10;

EndFunction

Function GZipFooterSize()

	Return 8;

EndFunction

Function GZipHeader()

	Buffer = New BinaryDataBuffer(GZipHeaderSize());
	Buffer[0] = 31;               // ID1 0x1f
	Buffer[1] = 139;              // ID2 0x8b
	Buffer[2] = 8;                // compression method (08 for DEFLATE)
	Buffer[3] = 0;                // header flags
	Buffer.WriteInt32(4, 0); // timestamp
	Buffer[8] = 0;                // compression flags
	Buffer[9] = 255;              // operating system ID

	Return Buffer;

EndFunction

Function GZipFooter(CRC32, SourceDataSize)

	Buffer = New BinaryDataBuffer(GZipFooterSize());
	Buffer.WriteInt32(0, CRC32);
	Buffer.WriteInt32(4, SourceDataSize);

	Return Buffer;

EndFunction

#EndRegion

Function ReadZip(CompressedData, ErrorText = Undefined)

#If MobileAppServer Then
	Raise(NStr("ru = 'Работа с Zip-файлами в мобильной платформе не поддерживается';
							|en = 'zip-files are not sup[ported at mobile application';"));
#Else
	FolderName = GetTempFileName();
	ZipReader = New ZipFileReader(CompressedData);
	FileName = ZipReader.Items[0].Name;
	Try
		ZipReader.Extract(ZipReader.Items[0], FolderName, ZIPRestoreFilePathsMode.DontRestore);
	Except
		// Игнорируем проверку целостности архива, просто читаем результат
		ErrorText = DetailErrorDescription(ErrorInfo());
	EndTry;
	ZipReader.Close();

	Result = New BinaryData(FolderName + GetPathSeparator() + FileName);
	DeleteFiles(FolderName);

	Return Result;
#EndIf

EndFunction

Function WriteZip(Data)

#If MobileAppServer Then
	Raise(NStr("ru = 'Работа с Zip-файлами в мобильной платформе не поддерживается';
							|en = 'zip-files are not suppported at mobile applixation';"));
#Else
	TemporaryFile = GetTempFileName(".bin"); //@non-nls-1
	Data.Write(TemporaryFile);
	ZipStream = New MemoryStream;
	ZipWriter = New ZipFileWriter(ZipStream);
	ZipWriter.Add(TemporaryFile);
	ZipWriter.Write();
	DeleteFiles(TemporaryFile);

	Return ZipStream.CloseAndGetBinaryData();
#EndIf

EndFunction

#EndRegion

#Region ParametersByDefault

Function DefaultHeaders()

	Headers = New Map;
#If MobileAppServer Then
	Headers.Insert("Accept-Encoding", "identity"); //@non-nls-1 //@non-nls-2
#Else
	Headers.Insert("Accept-Encoding", "gzip"); //@non-nls-1 //@non-nls-2
#EndIf
	Headers.Insert("Accept", "*/*"); //@non-nls-1
	Headers.Insert("Connection", "keep-alive"); //@non-nls-1 //@non-nls-2

	Return Headers;

EndFunction

Function MaximumNumberOfRedirects()

	Return 30;

EndFunction

Function TimeoutByDefault()

	Return 30;

EndFunction

Function JSONConversionParametersByDefault()

	ConversionParametersByDefault = New Structure;
	ConversionParametersByDefault.Insert("ReadToMap", True);
	ConversionParametersByDefault.Insert("JSONDateFormat", JSONDateFormat.ISO);
	ConversionParametersByDefault.Insert("PropertiesNamesWithDateValues", Undefined);
	ConversionParametersByDefault.Insert("JSONDateWritingVariant", JSONDateWritingVariant.LocalDate);
	ConversionParametersByDefault.Insert("ConvertionFunctionName", Undefined);
	ConversionParametersByDefault.Insert("ConvertionFunctionModule", Undefined);
	ConversionParametersByDefault.Insert("ConvertionFunctionAdditionalParameters", Undefined);
	ConversionParametersByDefault.Insert("ReviverFunctionName", Undefined);
	ConversionParametersByDefault.Insert("ReviverFunctionModule", Undefined);
	ConversionParametersByDefault.Insert("ReviverFunctionAdditionalParameters", Undefined);
	ConversionParametersByDefault.Insert("RetriverPropertiesNames", Undefined);
	ConversionParametersByDefault.Insert("MaximumNesting", 500);

	Return ConversionParametersByDefault;

EndFunction

Function JSONWriterSettingsByDeafult()

	JSONWriterSettingsByDeafult = New Structure;
	JSONWriterSettingsByDeafult.Insert("NewLines", JSONLineBreak.Auto);
	JSONWriterSettingsByDeafult.Insert("PaddingSymbols", " ");
	JSONWriterSettingsByDeafult.Insert("UseDoubleQuotes", True);
	JSONWriterSettingsByDeafult.Insert("EscapeCharacters", JSONCharactersEscapeMode.None);
	JSONWriterSettingsByDeafult.Insert("EscapeAngleBrackets", False);
	JSONWriterSettingsByDeafult.Insert("EscapeLineTerminators", True);
	JSONWriterSettingsByDeafult.Insert("EscapeAmpersand", False);
	JSONWriterSettingsByDeafult.Insert("EscapeSingleQuotes", False);
	JSONWriterSettingsByDeafult.Insert("EscapeSlash", False);

	Return JSONWriterSettingsByDeafult;

EndFunction

#EndRegion

#Region StatusCodes

Function HTTPStatusesCodesDescriptions()

	Codes = New Array;
	Codes.Add(NewHTTPCode(100, "Continue_100", "Continue")); //@non-nls-2
	Codes.Add(NewHTTPCode(101, "SwitchingProtocols_101", "Switching Protocols")); //@non-nls-2
	Codes.Add(NewHTTPCode(102, "Processing_102", "Processing")); //@non-nls-2
	Codes.Add(NewHTTPCode(103, "EarlyHints_103", "Early Hints")); //@non-nls-2

	Codes.Add(NewHTTPCode(200, "OK_200", "OK")); //@non-nls-2
	Codes.Add(NewHTTPCode(201, "Created_201", "Created")); //@non-nls-2
	Codes.Add(NewHTTPCode(202, "Accepted_202", "Accepted")); //@non-nls-2
	Codes.Add(NewHTTPCode(203, "NonAuthoritativeInformation_203", "Non-Authoritative Information")); //@non-nls-2
	Codes.Add(NewHTTPCode(204, "NoContent_204", "No Content")); //@non-nls-2
	Codes.Add(NewHTTPCode(205, "ResetContent_205", "Reset Content")); //@non-nls-2
	Codes.Add(NewHTTPCode(206, "PartialContent_206", "Partial Content")); //@non-nls-2
	Codes.Add(NewHTTPCode(207, "MultiStatus_207", "Multi-Status")); //@non-nls-2
	Codes.Add(NewHTTPCode(208, "AlreadyReported_208", "Already Reported")); //@non-nls-2
	Codes.Add(NewHTTPCode(226, "IMUsed_226", "IM Used")); //@non-nls-2

	Codes.Add(NewHTTPCode(300, "MultipleChoices_300", "Multiple Choices")); //@non-nls-2
	Codes.Add(NewHTTPCode(301, "MovedPermanently_301", "Moved Permanently")); //@non-nls-2
	Codes.Add(NewHTTPCode(302, "MovedTemporarily_302", "Moved Temporarily")); //@non-nls-2
	Codes.Add(NewHTTPCode(303, "SeeOther_303", "See Other")); //@non-nls-2
	Codes.Add(NewHTTPCode(304, "NotModified_304", "Not Modified")); //@non-nls-2
	Codes.Add(NewHTTPCode(305, "UseProxy_305", "Use Proxy")); //@non-nls-2
	Codes.Add(NewHTTPCode(307, "TemporaryRedirect_307", "Temporary Redirect")); //@non-nls-2
	Codes.Add(NewHTTPCode(308, "PermanentRedirect_308", "Permanent Redirect")); //@non-nls-2

	Codes.Add(NewHTTPCode(400, "BadRequest_400", "Bad Request")); //@non-nls-2
	Codes.Add(NewHTTPCode(401, "Unauthorized_401", "Unauthorized")); //@non-nls-2
	Codes.Add(NewHTTPCode(402, "PaymentRequired_402", "Payment Required")); //@non-nls-2
	Codes.Add(NewHTTPCode(403, "Forbidden_403", "Forbidden")); //@non-nls-2
	Codes.Add(NewHTTPCode(404, "NotFound_404", "Not Found")); //@non-nls-2
	Codes.Add(NewHTTPCode(405, "MethodNotAllowed_405", "Method Not Allowed")); //@non-nls-2
	Codes.Add(NewHTTPCode(406, "NotAcceptable_406", "Not Acceptable")); //@non-nls-2
	Codes.Add(NewHTTPCode(407, "ProxyAuthenticationRequired_407", "Proxy Authentication Required")); //@non-nls-2
	Codes.Add(NewHTTPCode(408, "RequestTimeout_408", "Request Timeout")); //@non-nls-2
	Codes.Add(NewHTTPCode(409, "Conflict_409", "Conflict")); //@non-nls-2
	Codes.Add(NewHTTPCode(410, "Gone_410", "Gone")); //@non-nls-2
	Codes.Add(NewHTTPCode(411, "LengthRequired_411", "Length Required")); //@non-nls-2
	Codes.Add(NewHTTPCode(412, "PreconditionFailed_412", "Precondition Failed")); //@non-nls-2
	Codes.Add(NewHTTPCode(413, "PayloadTooLarge_413", "Payload Too Large")); //@non-nls-2
	Codes.Add(NewHTTPCode(414, "URITooLong_414", "URI Too Long")); //@non-nls-2
	Codes.Add(NewHTTPCode(415, "UnsupportedMediaType_415", "Unsupported Media Type")); //@non-nls-2
	Codes.Add(NewHTTPCode(416, "RangeNotSatisfiable_416", "Range Not Satisfiable")); //@non-nls-2
	Codes.Add(NewHTTPCode(417, "ExpectationFailed_417", "Expectation Failed")); //@non-nls-2
	Codes.Add(NewHTTPCode(419, "AuthenticationTimeout_419", "Authentication Timeout")); //@non-nls-2
	Codes.Add(NewHTTPCode(421, "MisdirectedRequest_421", "Misdirected Request")); //@non-nls-2
	Codes.Add(NewHTTPCode(422, "UnprocessableEntity_422", "Unprocessable Entity")); //@non-nls-2
	Codes.Add(NewHTTPCode(423, "Locked_423", "Locked")); //@non-nls-2
	Codes.Add(NewHTTPCode(424, "FailedDependency_424", "Failed Dependency")); //@non-nls-2
	Codes.Add(NewHTTPCode(425, "TooEarly_425", "Too Early")); //@non-nls-2
	Codes.Add(NewHTTPCode(426, "UpgradeRequired_426", "Upgrade Required")); //@non-nls-2
	Codes.Add(NewHTTPCode(428, "PreconditionRequired_428", "Precondition Required")); //@non-nls-2
	Codes.Add(NewHTTPCode(429, "TooManyRequests_429", "Too Many Requests")); //@non-nls-2
	Codes.Add(NewHTTPCode(431, "RequestHeaderFieldsTooLarge_431", "Request Header Fields Too Large")); //@non-nls-2
	Codes.Add(NewHTTPCode(449, "RetryWith_449", "Retry With")); //@non-nls-2
	Codes.Add(NewHTTPCode(451, "UnavailableForLegalReasons_451", "Unavailable For Legal Reasons")); //@non-nls-2
	Codes.Add(NewHTTPCode(499, "ClientClosedRequest_499", "Client Closed Request")); //@non-nls-2

	Codes.Add(NewHTTPCode(500, "InternalServerError_500", "Internal Server Error")); //@non-nls-2
	Codes.Add(NewHTTPCode(501, "NotImplemented_501", "Not Implemented")); //@non-nls-2
	Codes.Add(NewHTTPCode(502, "BadGateway_502", "Bad Gateway")); //@non-nls-2
	Codes.Add(NewHTTPCode(503, "ServiceUnavailable_503", "Service Unavailable")); //@non-nls-2
	Codes.Add(NewHTTPCode(504, "GatewayTimeout_504", "Gateway Timeout")); //@non-nls-2
	Codes.Add(NewHTTPCode(505, "HTTPVersionNotSupported_505", "HTTP Version Not Supported")); //@non-nls-2
	Codes.Add(NewHTTPCode(506, "VariantAlsoNegotiates_506", "Variant Also Negotiates")); //@non-nls-2
	Codes.Add(NewHTTPCode(507, "InsufficientStorage_507", "Insufficient Storage")); //@non-nls-2
	Codes.Add(NewHTTPCode(508, "LoopDetected_508", "Loop Detected")); //@non-nls-2
	Codes.Add(NewHTTPCode(509, "BandwidthLimitExceeded_509", "Bandwidth Limit Exceeded")); //@non-nls-2
	Codes.Add(NewHTTPCode(510, "NotExtended_510", "Not Extended")); //@non-nls-2
	Codes.Add(NewHTTPCode(511, "NetworkAuthenticationRequired_511", "Network Authentication Required")); //@non-nls-2
	Codes.Add(NewHTTPCode(520, "UnknownError_520", "Unknown Error")); //@non-nls-2
	Codes.Add(NewHTTPCode(521, "WebServerIsDown_521", "Web Server Is Down")); //@non-nls-2
	Codes.Add(NewHTTPCode(522, "ConnectionTimedOut_522", "Connection Timed Out")); //@non-nls-2
	Codes.Add(NewHTTPCode(523, "OriginIsUnreachable_523", "Origin Is Unreachable")); //@non-nls-2
	Codes.Add(NewHTTPCode(524, "ATimeoutOccurred_524", "A Timeout Occurred")); //@non-nls-2
	Codes.Add(NewHTTPCode(525, "SSLHandshakeFailed_525", "SSL Handshake Failed")); //@non-nls-2
	Codes.Add(NewHTTPCode(526, "InvalidSSLCertificate_526", "Invalid SSL Certificate")); //@non-nls-2

	Return Codes;

EndFunction

Function NewHTTPCode(Code, Var_Key, Descr)

	Return New Structure("Code, Key, Descr", Code, Var_Key, Descr);

EndFunction

Function IsStatusCodeForWhichRetryAfterHeaderMustBeConsidered(StatusCode)

	Codes = HTTPStatusCodes();
	Return StatusCode = Codes.PayloadTooLarge_413
		Or StatusCode = Codes.TooManyRequests_429
		Or StatusCode = Codes.ServiceUnavailable_503;

EndFunction

#EndRegion

#Region Others

Function DetermineHashFunction(Val Algorithm)

	Algorithm = Upper(Algorithm);
	If Not ValueIsFilled(Algorithm) Or Algorithm = "MD5" Or Algorithm = "MD5-SESS" Then //@non-nls-1  //@non-nls-2
		HashingAlgorithm = HashFunction.MD5;
	ElsIf Algorithm = "SHA" Then //@non-nls-1
		HashingAlgorithm = HashFunction.SHA1;
	ElsIf Algorithm = "SHA-256" Then //@non-nls-1
		HashingAlgorithm = HashFunction.SHA256;
	Else
		HashingAlgorithm = Undefined;
	EndIf;

	Return HashingAlgorithm;

EndFunction

Function DataHashing(Val Algorithm, Val Data)

	If TypeOf(Data) = Type("String") Then
		Data = GetBinaryDataFromString(Data, TextEncoding.UTF8, False);
	EndIf;

	Hashing = New DataHashing(Algorithm);
	Hashing.Append(Data);

	Return Lower(GetHexStringFromBinaryData(Hashing.HashSum));

EndFunction

Procedure Pause(StopDurationInSeconds)

	// Когда-нибудь в платформе сделают паузу и это можно будет выкинуть

	If StopDurationInSeconds < 1 Then
		Return;
	EndIf;

	CurrentDate = CurrentUniversalDate();
	WaitUntill = CurrentDate + StopDurationInSeconds;

	// BSLLS:UsingHardcodeNetworkAddress-off
	LocalHost = "127.0.0.0";
	RandomFreePort = 56476;
	// BSLLS:UsingHardcodeNetworkAddress-on
	While CurrentDate < WaitUntill Do
		Timeout = WaitUntill - CurrentDate;
		Start = CurrentUniversalDateInMilliseconds();
		Try
			Connection = New HTTPConnection(
				LocalHost, RandomFreePort, Undefined, Undefined, Undefined, Timeout);
			Connection.Get(New HTTPRequest("/does_not_matter")); //@non-nls-1
		Except
			RealTimeout = CurrentUniversalDateInMilliseconds() - Start;
		EndTry;
		MinimalTimeoutInMilliseconds = 1000;
		If RealTimeout < MinimalTimeoutInMilliseconds Then
			Raise(NStr("ru = 'Процедура Приостановить не работает должным образом';
									|en = 'Pause wrong.';"));
		EndIf;
		CurrentDate = CurrentUniversalDate();
	EndDo;

EndProcedure

Function CalculatePauseDuration(RetriesNumber, ExponentialDelayRatio, RetryAfterHeader, Remainder)

	If RetryAfterHeader <> False Then
		Duration = NumberFromString(RetryAfterHeader);

		If Duration = 0 Then
			Date = DateFromStringRFC7231(RetryAfterHeader);
			If ValueIsFilled(Date) Then
				Duration = Date - CurrentUniversalDate();
			EndIf;
		EndIf;
	Else
		Duration = ExponentialDelayRatio * Pow(2, RetriesNumber - 1);
	EndIf;

	Duration = Min(Duration, Remainder);

	If Duration < 0 Then
		Duration = 0;
	EndIf;

	Return Duration;

EndFunction

#EndRegion

#Region GenericDataStructures

Function SelectValue(MainValue, AdditionalValues, Var_Key, ValueByDefault)

	If MainValue <> Undefined Then
		Return MainValue;
	EndIf;

	Value = ValueByKey(AdditionalValues, Var_Key);
	If Value <> Undefined Then
		Return Value;
	EndIf;

	Return ValueByDefault;

EndFunction

Function ValueByKey(Structure, Var_Key, ValueByDefault = Undefined)

	If TypeOf(Structure) = Type("Structure") And Structure.Property(Var_Key) Then
		Value = Structure[Var_Key];
	ElsIf TypeOf(Structure) = Type("Map") And Structure.Get(Var_Key) <> Undefined Then
		Value = Structure.Get(Var_Key);
	Else
		Value = ValueByDefault;
	EndIf;

	Return Value;

EndFunction

#EndRegion

#Region StringMethods

Function NumberFromString(Val String) Export

	ATypeDescription = New TypeDescription("Number");
	Return ATypeDescription.AdjustValue(String);

EndFunction

Function DateFromString(Val String) Export

	DateQualifier = New DateQualifiers(DateFractions.DateTime);
	ATypeDescription = New TypeDescription("Date", Undefined, Undefined, DateQualifier);
	Return ATypeDescription.AdjustValue(String);

EndFunction

Function DateFromStringRFC7231(Val String) Export

	Delimiters = ",-:/\.";
	For Index = 1 To StrLen(Delimiters) Do
		Delimiter = Mid(Delimiters, Index, 1);
		String = StrReplace(String, Delimiter, " ");
	EndDo;
	String = StrReplace(String, "  ", " ");
	DateComponents = StrSplit(String, " ");
	MonthString = DateComponents[2];

	Months = StrSplit("Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec", ","); //@non-nls-1
	Month = Months.Find(MonthString);
	If Month = Undefined Then
		Return '00010101';
	EndIf;

	Date = DateComponents[3] + Format(Month + 1, "ND=2; NLZ=;") + DateComponents[1];
	Time = DateComponents[4] + DateComponents[5] + DateComponents[6];

	Return DateFromString(Date + Time);

EndFunction

Procedure SplitStringByDelimiter(ExtractedPart, RemainingPart, Delimiter, Inversion = False)

	Index = StrFind(RemainingPart, Delimiter);
	If Index Then
		ExtractedPart = Left(RemainingPart, Index - 1);
		RemainingPart = Mid(RemainingPart, Index + StrLen(Delimiter));
		If Inversion Then
			ForValuesSwap = ExtractedPart;
			ExtractedPart = RemainingPart;
			RemainingPart = ForValuesSwap;
		EndIf;
	EndIf;

EndProcedure

Function SplitByFirstFoundDelimiter(String, Delimiters)

	MinimalIndex = StrLen(String);
	FirstDelimiter = "";

	For Each Delimiter In Delimiters Do
		Index = StrFind(String, Delimiter);
		If Index = 0 Then
			Continue;
		EndIf;
		If Index < MinimalIndex Then
			MinimalIndex = Index;
			FirstDelimiter = Delimiter;
		EndIf;
	EndDo;

	Result = New Array;
	If ValueIsFilled(FirstDelimiter) Then
		Result.Add(Left(String, MinimalIndex - 1));
		Result.Add(Mid(String, MinimalIndex + StrLen(FirstDelimiter)));
		Result.Add(FirstDelimiter);
	Else
		Result.Add(String);
		Result.Add("");
		Result.Add(Undefined);
	EndIf;

	Return Result;

EndFunction

Function SplitStringByString(Val String, Delimiter)

	Result = New Array;
	While True Do
		Position = StrFind(String, Delimiter);
		If Position = 0 And ValueIsFilled(String) Then
			Result.Add(String);
			Break;
		EndIf;

		FirstPart = Left(String, Position - StrLen(Delimiter) + 1);
		Result.Add(FirstPart);
		String = Mid(String, Position + StrLen(Delimiter));
	EndDo;

	Return Result;

EndFunction

Function AddLeadingDot(Val Domain)

	If Not StrStartsWith(Domain, ".") Then
		Domain = "." + Domain;
	EndIf;

	Return Domain;

EndFunction

Function CutText(Text, MaxTextLength = 1000)
	
	If FindDisallowedXMLCharacters(Text) Then
		Return NStr("ru = '<Данные>';
					|en = '<Data>';");
	EndIf;
	
	If StrLen(Text) <= MaxTextLength Then
		Result = Text;
	Else
		HalfOfMaxTextLength = MaxTextLength / 2;
		Result = Left(Text, HalfOfMaxTextLength);
		Result = Result + Chars.LF + "..." + Chars.LF;
		Result = Result + Right(Text, HalfOfMaxTextLength);
	EndIf;
	
	Return Result;
	
EndFunction

Function Join(MainSource, AdditionalSource)

	Result = MainSource;
	Supplement(MainSource, AdditionalSource);
	Return Result;

EndFunction

Function Copy(Source)
	
	Return ValueFromStringInternal(ValueToStringInternal(Source));

EndFunction

Procedure Supplement(Destination, Source)
	
	If Source = Undefined Then
		Return;
	EndIf;
	
	For Each SourceItem In Source Do
		ParameterIsFound = False;
		
		If TypeOf(Destination) = Type("Map") Then
			ParameterIsFound = Destination.Get(SourceItem) <> Undefined;
		EndIf;
		
		If TypeOf(Destination) = Type("Structure") Then
			ParameterIsFound = Destination.Property(SourceItem);
		EndIf;
		
		If Not ParameterIsFound Then
			Destination.Insert(SourceItem.Key, SourceItem.Value);
		EndIf;
	EndDo;
		
EndProcedure

#EndRegion

#EndRegion
