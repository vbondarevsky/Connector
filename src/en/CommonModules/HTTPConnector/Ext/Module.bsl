// Connector: handy HTTP-client for 1C:Enterprise 8 platform
//
// Copyright 2017-2023 Vladimir Bondarevskiy
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
//    See the License for the specific language governing permissions and
//   limitations under the License.
//
//
// URL:    https://github.com/vbondarevsky/Connector
// e-mail: vbondarevsky@gmail.com
// Version: 2.6.0
//
// Requirements: 1C:Enterprise platform version **8.3.10** and higher.

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
//                  - Array - builds a string from multiple parameters: key=value1&key=value2 etc.
//   AdditionalParameters - See NewParameters
//   Session - See NewSession
//
// Returns:
//   See CallMethod
//
Function Get(URL, RequestParameters = Undefined, AdditionalParameters = Undefined, Session = Undefined) Export

	CurrentSession = CurrentSession(Session);
	
	Parameters = NewParameters();
	Supplement(Parameters, AdditionalParameters);
	Supplement(Parameters, ParametersFromArguments(RequestParameters, Undefined, Undefined));
	
	Return CallHTTPMethod(CurrentSession, "GET", URL, Parameters);

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
	Supplement(Parameters, AdditionalParameters);
	Supplement(Parameters, ParametersFromArguments(Undefined, Undefined, Undefined));
	
	Return CallHTTPMethod(CurrentSession, "OPTIONS", URL, Parameters);

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
	Supplement(Parameters, AdditionalParameters);
	Supplement(Parameters, ParametersFromArguments(Undefined, Undefined, Undefined));
	
	Return CallHTTPMethod(CurrentSession, "HEAD", URL, Parameters);

EndFunction

// Sends a POST request
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
Function Post(URL, Data = Undefined, AdditionalParameters = Undefined, Session = Undefined) Export

	CurrentSession = CurrentSession(Session);
	
	Parameters = NewParameters();
	Supplement(Parameters, AdditionalParameters);
	Supplement(Parameters, ParametersFromArguments(Undefined, Data, Undefined));
	
	Return CallHTTPMethod(CurrentSession, "POST", URL, Parameters);

EndFunction

// Sends a PUT request
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
Function Put(URL, Data = Undefined, AdditionalParameters = Undefined, Session = Undefined) Export

	CurrentSession = CurrentSession(Session);
	
	Parameters = NewParameters();
	Supplement(Parameters, AdditionalParameters);
	Supplement(Parameters, ParametersFromArguments(Undefined, Data, Undefined));
	
	Return CallHTTPMethod(CurrentSession, "PUT", URL, Parameters);

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
	Supplement(Parameters, AdditionalParameters);
	Supplement(Parameters, ParametersFromArguments(Undefined, Data, Undefined));
	
	Return CallHTTPMethod(CurrentSession, "PATCH", URL, Parameters);

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
	Supplement(Parameters, AdditionalParameters);
	Supplement(Parameters, ParametersFromArguments(Undefined, Data, Undefined));
	
	Return CallHTTPMethod(CurrentSession, "DELETE", URL, Parameters);

EndFunction

// Sends a MKCOL request
//
// Parameters:
//   URL - String - HTTP URL to send the request to.
//   AdditionalParameters - See NewParameters
//   Session - See NewSession
//
// Returns:
//   See CallMethod
//
Function Mkcol(URL, Data = Undefined, AdditionalParameters = Undefined, Session = Undefined) Export

	CurrentSession = CurrentSession(Session);
	
	Parameters = NewParameters();
	Supplement(Parameters, AdditionalParameters);
	Supplement(Parameters, ParametersFromArguments(Undefined, Data, Undefined));
	
	Return CallHTTPMethod(CurrentSession, "MKCOL", URL, Parameters);

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
//     * TimeExecution - Number - execution response duration in milliseconds.
//     * Cookies - Map - cookies received from host.
//     * Headers - Map - HTTP response headers.
//     * IsPermanentRedirect - Boolean - permanent redirect flag.
//     * IsRedirect - Boolean - redirect flag.
//     * Encoding - String - response text encoding.
//     * Body - BinaryData - response body.
//     * StatusCode - Number - response status code.
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
//      see details in Session.RequestParameters.
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
	Supplement(Parameters, AdditionalParameters);
	Supplement(Parameters, ParametersFromArguments(RequestParameters, Undefined, Undefined));
	
	JSONConversionParameters =
		SelectValue(Undefined, Parameters, "JSONConversionParameters", Undefined);
	
	Return AsJson(CallHTTPMethod(CurrentSession, "GET", URL, Parameters), JSONConversionParameters);

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
	Supplement(Parameters, AdditionalParameters);
	Supplement(Parameters, ParametersFromArguments(Undefined, Undefined, Json));
	
	JSONConversionParameters =
		SelectValue(Undefined, Parameters, "JSONConversionParameters", Undefined);
	
	Return AsJson(CallHTTPMethod(CurrentSession, "POST", URL, Parameters), JSONConversionParameters);

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
	Supplement(Parameters, AdditionalParameters);
	Supplement(Parameters, ParametersFromArguments(Undefined, Undefined, Json));
	
	JSONConversionParameters =
		SelectValue(Undefined, Parameters, "JSONConversionParameters", Undefined);
	Return AsJson(CallHTTPMethod(CurrentSession, "PUT", URL, Parameters), JSONConversionParameters);

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
	Supplement(Parameters, AdditionalParameters);
	Supplement(Parameters, ParametersFromArguments(Undefined, Undefined, Json));
	
	JSONConversionParameters =
		SelectValue(Undefined, Parameters, "JSONConversionParameters", Undefined);
	Return AsJson(CallHTTPMethod(CurrentSession, "DELETE", URL, Parameters), JSONConversionParameters);

EndFunction

#EndRegion

#Region Constructors

// Additional parameters constructor
//
// Returns:
//  Structure - allows specifying additional parameters:
//    * Headers - Map - see description of Session.Headers.
//    * Authentication - Structure - see description of Session.Authentication
//    * Proxy - InternetProxy - see description of Session.Proxy.
//    * ParametersRequest - Structure, Map - see description of Session.ParametersRequest.
//    * VerifySSL - Boolean - see description of Session.VerifySSL.
//    * ClientCertificateSSL - FileClientCertificate, WindowsClientCertificate - Default value: Undefined.
//    * Cookies - Array - see description of Session.Cookies.
//    * Timeout - Number - timeout for the connection and operations, in seconds.
//        Default value - 30 sec.
//    * AllowRedirect - Boolean - True - redirects will be automatically allowed.
//                                          False - only a single request to the server will be made.
//    * Json - Structure, Map - data to serialize to JSON.
//    * ParametersConversionJSON - Structure - specifies JSON conversion parameters:
//        ** ReadInMap - Boolean - If True, JSON object reading will be done into Map.
//             If False, objects will be read into an object of type Structure.
//        ** JSONDateFormat - JSONDateFormat - format in which the date is represented in the string,
//             to be converted.
//        ** NamesPropertiesWithDateValues -  String, Array Of String - JSON property names
//             for which date restoration from string should be called.
//        ** NameFunctionRestore - String - specifies the name of the function that will be called when reading
//            each property and must have the following parameters:
//               ** Property - String - specified only when reading JSON objects
//               ** Value - Arbitrary - value of a serializable type
//               ** AdditionalParameters - Arbitrary
//            Returns:
//               Arbitrary - allows to specify additional parameters 
//        
//            allows to specify additional parameters
//        
//            
//        
//            
//        
//    
//     
//             
//                 
//                 
//     See NewFileToSend See NewFileToSend
//    
//        
//        
//        
//        
//        
//    
//        
//    
//        
//        
//        
//        
//    
//                                 
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
	Parameters.Insert("JSONConversionParameters", ParametersConversionJSONByDefault());
	Parameters.Insert("Data", Undefined);
	Parameters.Insert("Files", New Array);
	Parameters.Insert("MaximumNumberOfRetries", 0);
	Parameters.Insert("MaximumTimeOfRetries", 600);
	Parameters.Insert("ExponentialDelayRatio", 1);
	Parameters.Insert("ToRetryForStatusesCodes", Undefined);
	
	Return Parameters;

EndFunction

// Constructor of the file-to-send description.
//
// Parameters:
//   Name - String - form field name.
//   FileName - String - file name.
//   Data - BinaryData - file binary data.
//   Type - String - file MIME type
//
// Returns:
//  Structure:
//    * Name - String - form field name.
//    * FileName - String - file name.
//    * Data - BinaryData - file binary data.
//    * Type - String - file MIME type.
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

// Creates an object to store session parameters.
//
// Returns:
//  Structure - session parameters:
//    * Headers - Map - HTTP request headers.
//    * Authentication - Structure - request authentication parameters.
//          ** Token - String - token.
//                                                   If Type = AWS4-HMAC-SHA256:
//          ** Token - String - token.
//       If Type = AWS4-HMAC-SHA256:
//          ** Token - String - token.
//             If Type = AWS4-HMAC-SHA256:
//          ** Token - String - token.
// 	 	 If Type = AWS4-HMAC-SHA256:
// 			** Token - String - token.
//       If Type = AWS4-HMAC-SHA256:
//          ** Token - String - token.
//             If Type = AWS4-HMAC-SHA256:
//          ** Token - String - token.
//             If Type = AWS4-HMAC-SHA256:
//          ** Token - String - token.
//             If Type = AWS4-HMAC-SHA256:
//          ** Token - String - token.
//             If Type = AWS4-HMAC-SHA256:
//    * Proxy - InternetProxy - proxy parameters to be used when sending the request.
//        Default value: Undefined. If the configuration uses SSL (Standard Subsystems Library),
//        the proxy values will be taken from SSL.
//    * RequestParameters - Structure, Map - parameters to send in the URL (the part after ?):
//        * Key - String - URL parameter key.
//        * Value - String - URL parameter value
//                     - Array - builds a string from multiple parameters: key=value1&key=value2 etc.
//    * VerifySSL - Boolean - False - server certificate verification is not performed.
//                            - True - the value of CACertificatesOS is used.
//                   - FileCertificationAuthorityCertificates - See CACertificatesFile.
//        Default value: True.
//    * ClientSSLCertificate - FileClientCertificate, WindowsClientCertificate - Default value: Undefined.
//    * MaximumNumberOfRedirects - Number - maximum redirect count. Loop protection.
//        Default value: 30
//    * Cookies - Map - cookies storage.
//
Function NewSession() Export

	Session = New Structure;
	Session.Insert("Headers", DefaultHeaders());
	Session.Insert("Authentication", Undefined);
	Session.Insert("Proxy", Undefined);
	Session.Insert("RequestParameters", New Map);
	Session.Insert("VerifySSL", True);
	Session.Insert("ClientSSLCertificate", Undefined);
	Session.Insert("MaximumNumberOfRedirects", MaximumNumberOfRedirects());
	Session.Insert("Cookies", New Map);
	Session.Insert("ServiceData", New Structure("DigestParameters"));

	Return Session;

EndFunction

// Response package of an HTTP method call result.
//
// Returns:
//   * Method - String - HTTP request verb name
//   * URL - String - final request URL.
//   String - HTTP request verb name
//   * URL - String - final request URL.
//   
//   
//   
//   
//   
//   
//   
//
Function NewResponse() Export
	
	Result = New Structure;
	Result.Insert("Method", "GET");
	Result.Insert("URL", "");
	Result.Insert("StatusCode", 600); // Network error (>500)
	Result.Insert("Headers", New Map);
	Result.Insert("Body", Base64Value(""));
	Result.Insert("Encoding", "utf-8");
	Result.Insert("TimeExecution", Undefined);
	Result.Insert("IsPermanentRedirect", False);
	Result.Insert("IsRedirect", False);
	Result.Insert("Cookies", New Map);
	Result.Insert("Error", New Array);
	
	Return Result;
	
EndFunction


// Operating system authentication constructor
// 
// Returns:
//  Structure:
//    * UseOSAuthentication - String - enables the use of NTLM or Negotiate authentication.
//
Function NewAuthenticationOS() Export
	
	Result = New Structure;
	Result.Insert("UseOSAuthentication", True);
	
	Return Result;
	
EndFunction


// Basic authentication constructor
// 
// Returns:
//  Structure:
//    * User - String - user name.
//    * Password - String - user password.
//
Function NewAuthenticationBasic(User = "", Password = "") Export
	
	Result = New Structure;
	Result.Insert("Type", "Basic");
	Result.Insert("User", User);
	Result.Insert("Password", Password);
	
	Return Result;
		
EndFunction

// Digest authentication constructor
// 
// Returns:
//  Structure:
//    * Type - String - Authentication type code. Always "Digest".
//    * User - String - user name.
//    * Password - String - user password.
//
Function NewAuthenticationDigest(User = "", Password = "") Export
	
	Result = New Structure;
	Result.Insert("Type", "Digest");
	Result.Insert("User", User);
	Result.Insert("Password", Password);
	
	Return Result;
	
EndFunction

// Bearer authentication constructor
// 
// Returns:
//  Structure:
//    * Type - String - Authentication type code. Always "Bearer".
//    * Token - String - Bearer token.
//
Function NewAuthenticationBearer(Token = "") Export
	
	Result = New Structure;
	Result.Insert("Type", "Bearer");
	Result.Insert("Token", Token);
	
	Return Result;
	
EndFunction

// AWS4-HMAC-SHA256 authentication constructor
// 
// Returns:
//  Structure:
//    * Type - String - Authentication type code. Always "AWS4-HMAC-SHA256".
//    * AccessKeyID - String - access key identifier (AccessKey).
//    * SecretKey - String - secret key (SecretKey).
//    * Service - String - service being connected to.
//    * Region - String - region being connected to.
//
Function NewAuthenticationAWS4(KeyAccess = "", SecretKey = "", Service = "", Region = "") Export
	
	Result = New Structure;
	Result.Insert("Type", "AWS4-HMAC-SHA256");
	Result.Insert("AccessKeyID", KeyAccess);
	Result.Insert("SecretKey", SecretKey);
	Result.Insert("Service", Service);
	Result.Insert("Region", Region);
	
	Return Result;
	
EndFunction

#EndRegion

#EndRegion

#Region ResponsesFormats

// Returns host response as deserialized JSON value.
//
// Parameters:
//   Response - See NewResponse
//   JSONConversionParameters - Structure - If False, objects will be read into a Structure.
//     * JSONDateFormat - JSONDateFormat - the format in which the date is represented in the string being converted.
//                                             * PropertiesNamesWithDateValues -  Array, String - JSON property names,
//                                             for which date restoration from string should be called.
//                                             * RestoreFunctionName - String - specifies the name of the function that will be called when reading
//                                             each property and must have the following parameters:
//                                             ** Property - String - specified only when reading JSON objects
//                                             ** Value - Arbitrary - value of a serializable type
//                                             ** AdditionalParameters - Arbitrary
//                                         If False, objects will be read into a Structure.
//     * JSONDateFormat - JSONDateFormat - the format in which the date is represented in the string being converted.
//     * PropertiesNamesWithDateValues -  Array, String - JSON property names,
//         for which date restoration from string should be called.
//     * RestoreFunctionName - String - specifies the name of the function that will be called when reading
//         each property and must have the following parameters:
//            ** Property - String - specified only when reading JSON objects
//            ** Value - Arbitrary - value of a serializable type
//            ** AdditionalParameters - Arbitrary
//         Returns:
//            Arbitrary - value deserialized from JSON. 
//     * ModuleFunctionRestore - Arbitrary - specifies the module whose procedure will be used for
//         value restoration.
//     * AdditionalParametersFunctionRestore - Arbitrary - specifies additional parameters that
//         will be passed to the value restoration function.
//     * NamesPropertiesForProcessingRestore - Array - specifies an array of JSON property names for which
//         the restoration function will be called.
//     * MaxNesting - Number - specifies the maximum nesting level of the JSON object.
//
// Returns:
//   Map - host response as deserialized JSON value.
//     If ConversionParameters.ReadToMap = True (by default).
//   Structure - If ConversionParameters.ReadToMap = False.
//
Function AsJson(Response, JSONConversionParameters = Undefined) Export
		
	Try
		Return JsonToObject(UnpackResponse(Response), Response.Encoding, JSONConversionParameters);
	Except
		Raise AsException(Response, NStr("en = 'JSON deserialization error.'"));
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
//      See details of the method XMLReader.OpenStream in the Syntax Assistant
//   XMLSchemaSet - XMLSchemaSet - An XML schema set used for validation of the document being read.
//     If a schema set is specified but not validated and XML document validation is enabled, the schema set is validated.
//      See details of the method XMLReader.OpenStream in the Syntax Assistant
//     
//   Encoding - String, TextEncoding - Contains the input stream encoding.
//      See details of the method XMLReader.OpenStream in the Syntax Assistant
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
		Raise AsException(Response, NStr("en = 'XDTO deserialization error.'"));
	EndTry;

	Return XDTOObject;

EndFunction

// Returns host response as text intended for use in Raise.
//
// Parameters:
//   Response - See NewResponse.
//   TextForUser - String - Reason explanation text for the user.
//
// Returns:
//   String - host response as exception text.
//
Function AsException(Response, Val TextForUser = Undefined) Export
	
	ExceptionText = StrTemplate(
		NStr("en = 'HTTP %1 %2
		           |%3'"),
		Response.Method,
		Response.URL,
		HTTPStatusCodePresentation(Response.StatusCode)
	);
	
	BodyResponse = CutText(AsText(Response));
	
	If Not IsBlankString(BodyResponse) Then
		ExceptionText = ExceptionText + Chars.LF + StrTemplate(
			NStr("en = 'Response body:
			           |%1'"),
			BodyResponse);
	EndIf;
	
	If Response.Error.Count() Then
		ExceptionText = ExceptionText + Chars.LF + Chars.LF
			+ StrConcat(Response.Error, Chars.LF + Chars.LF);
	EndIf;
	
	If Not IsBlankString(TextForUser) Then
		ExceptionText = TextForUser + Chars.LF + Chars.LF + ExceptionText;
	EndIf;
	
	Return ExceptionText;
	
EndFunction

#EndRegion

#Region SupportingMethods

// Returns a structured representation of a URL.
//
// Parameters:
//   URL - String - HTTP URL to send the request to.
//
// Returns:
//   Structure - URL structure:
//     * Scheme - String - server access scheme (http, https).
//     * Authentication - Structure - authentication parameters:
//         ** User - String - user name.
//         ** Password - String - user password.
//     * Host - String - server address.
//     * Port - Number - server port.
//     * Path - String - resource address on the server.
//     * RequestParameters - Map - request parameters passed to the server in the URL (the part after ?):
//         ** Key - String - URL parameter key.
//         ** Value - String - URL parameter value;
//                       - Array - parameter values (key=value1&key=value2).
//     * Fragment - String - URL part after #.
//
Function ParseURL(Val URL) Export

	Scheme = "";
	Path = "";
	Authentication = New Structure("User, Password", "", "");
	Host = "";
	Port = "";
	Fragment = "";

	ValidSchemes = StrSplit("http,https", ",");

	URLWithoutScheme = URL;
	SplitStringByDelimiter(Scheme, URLWithoutScheme, "://");
	If ValidSchemes.Find(Lower(Scheme)) <> Undefined Then
		URL = URLWithoutScheme;
	Else
		Scheme = "";
	EndIf;

	Result = SplitByFirstFoundSeparator(URL, StrSplit("/,?,#", ","));
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
		Scheme = "http";
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

// Converts an Object to JSON.
//
// Parameters:
//   Object - Arbitrary - data to convert to JSON.
//   ConversionParameters - Structure - * JSONDateWriteMode - JSONDateWriteMode - specifies how dates are written in JSON format.
//     * ConversionFunctionName - String - a function called for all properties
//                                         whose type does not support automatic serialization to JSON.
//                                         The function must be exported and have the following parameters:
//                                         ** Property - String - a data structure property that cannot be
//                                         automatically serialized to JSON.
//                                         ** Value - String - the value of a data structure property that
//                                         cannot be automatically serialized to JSON.
//                                         ** AdditionalParameters - Arbitrary - this parameter will receive
//                                         AdditionalConversionFunctionParameters.
//                                         ** Cancel - Boolean - cancels the property-write operation.
//                                         Return value of the function:
//                                         Arbitrary - conversion result.
//                                         * ConversionFunctionModule - Arbitrary - module where the ConversionFunctionName function is defined.
//                                         * AdditionalConversionFunctionParameters - Arbitrary - parameters that will be passed
//                                         to the ConversionFunctionName function.
//     * JSONDateWriteMode - JSONDateWriteMode - specifies how dates are written in JSON format.
//     * ConversionFunctionName - String - a function called for all properties
//         whose type does not support automatic serialization to JSON.
//         The function must be exported and have the following parameters:
//           ** Property - String - a data structure property that cannot be
//                automatically serialized to JSON.
//           ** Value - String - the value of a data structure property that
//                cannot be automatically serialized to JSON.
//           ** AdditionalParameters - Arbitrary - this parameter will receive
//                AdditionalConversionFunctionParameters.
//           ** Cancel - Boolean - cancels the property-write operation.
//         Return value of the function:
//           Arbitrary - conversion result.
//     * ConversionFunctionModule - Arbitrary - module where the ConversionFunctionName function is defined.
//     * AdditionalConversionFunctionParameters - Arbitrary - parameters that will be passed
//                                                                     to the ConversionFunctionName function.
//   WriterSettings - Structure - JSON conversion parameters:
//     * NewLines - JSONLineBreak - specifies the line-break method
//         to be used when writing JSON data.
//     * PaddingSymbols - String - specifies the indent characters used when writing JSON data.
//     * UseDoubleQuotes - Boolean - specifies whether JSON property names will be
//         written in double quotes.
//     * EscapeCharacters - JSONCharactersEscapeMode - specifies the character escaping (replacement) method
//         to use when writing JSON data.
//     * EscapeAngleBrackets - Boolean - specifies whether the "<" and ">" characters will be escaped when writing.
//     * EscapeLineTerminators - Boolean - specifies whether the line separators
//         U+2028 (line-separator) and U+2029 (page-separator) will be escaped.
//     * EscapeAmpersand - Boolean - specifies whether the ampersand "&" character will be escaped when writing.
//     * EscapeSingleQuotes - Boolean - specifies whether single quotes will be escaped.
//     * EscapeSlash - Boolean - specifies whether the slash will be escaped when writing the value.
//
// Returns:
//   String - object in JSON format.
//
Function ObjectToJson(Object, Val ConversionParameters = Undefined, Val WriterSettings = Undefined) Export

	JSONConversionParameters = Merge(ParametersConversionJSONByDefault(), ConversionParameters);

	SerializerSettings = New JSONSerializerSettings;
	SerializerSettings.DateSerializationFormat = JSONConversionParameters.JSONDateFormat;
	SerializerSettings.DateWritingVariant = JSONConversionParameters.JSONDateWritingVariant;

	WriterSettings = Merge(JSONWriterSettingsByDeafult(), WriterSettings);

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

// Converts JSON to Object.
//
// Parameters:
//   Json - Stream, BinaryData, String - JSON-formatted data.
//   Encoding - String - JSON text encoding. Default value - utf-8.
//   ConversionParameters - Structure - JSON conversion parameters:
//     * ReadToMap - Boolean - if True, the JSON object will be read into a Map,
//         otherwise into a Structure.
//     * PropertiesNamesWithDateValues - Array, String, FixedArray - JSON property names
//         for which date restoration from string should be called.
//     * JSONDateFormat - JSONDateFormat - specifies the deserialization format of JSON object dates.
//     * NameFunctionRestore - String - specifies the name of the function that will be called when reading
//         each property and must have the following parameters:
//            ** Property - String - specified only when reading JSON objects
//            ** Value - Arbitrary - value of a serializable type
//            ** AdditionalParameters - Arbitrary
//         Returns:
//            Arbitrary - value deserialized from JSON. 
//     * ModuleFunctionRestore - Arbitrary - specifies the module whose procedure will be used for
//         value restoration.
//     * AdditionalParametersFunctionRestore - Arbitrary - specifies additional parameters that
//         will be passed to the value restoration function.
//     * NamesPropertiesForProcessingRestore - Array - specifies an array of JSON property names for which
//         the restoration function will be called.
//     * MaxNesting - Number - specifies the maximum nesting level of the JSON object.
//
// Returns:
//   Arbitrary - value deserialized from JSON.
//
Function JsonToObject(Json, Encoding = "utf-8", ConversionParameters = Undefined) Export

	JSONConversionParameters = Merge(ParametersConversionJSONByDefault(), ConversionParameters);

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
		JSONConversionParameters.NameFunctionRestore,
		JSONConversionParameters.ModuleFunctionRestore,
		JSONConversionParameters.AdditionalParametersFunctionRestore,
		JSONConversionParameters.NamesPropertiesForProcessingRestore,
		JSONConversionParameters.MaxNesting);
	JSONReader.Close();

	Return Object;

EndFunction

// Calculates HMAC (hash-based message authentication code).
//
// Parameters:
//   Key_ - BinaryData - secret key.
//   Data - BinaryData - data to calculate HMAC.
//   Algorithm - HashFunction - Defines method for calculating the hash-sum.
//
// Returns:
//   BinaryData - calculated HMAC value.
//
Function HMAC(Key_, Data, Algorithm) Export

	BlockSize = 64;

	If Key_.Size() > BlockSize Then
		Hashing = New DataHashing(Algorithm);
		Hashing.Append(Key_);

		BufferKey = GetBinaryDataBufferFromBinaryData(Hashing.HashSum);
	Else
		BufferKey = GetBinaryDataBufferFromBinaryData(Key_);
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

// Returns a structure of named HTTP status codes.
//
// Returns:
//   Structure - named HTTP status codes.
//
Function HTTPStatusCodes() Export

	StatusCodes = New Structure;
	For Each Description In HTTPStatusesCodesDescriptions() Do
		StatusCodes.Insert(Description.Key, Description.Code);
	EndDo;

	Return StatusCodes;

EndFunction

// Returns a text representation of the given HTTP status code.
//
// Parameters:
//   StatusCode - Number - HTTP status code for which to obtain a text representation.
//
// Returns:
//   String - text representation of the HTTP status code.
//
Function HTTPStatusCodePresentation(StatusCode) Export

	StatusCodeDescription = Undefined;
	For Each Description In HTTPStatusesCodesDescriptions() Do
		If Description.Code = StatusCode Then
			StatusCodeDescription = Description;
			Break;
		EndIf;
	EndDo;

	If StatusCodeDescription = Undefined Then
		Return StrTemplate(NStr("en = '%1: Unknown HTTP status code'"), StatusCode);
	Else
		Return StrTemplate("%1: %2", StatusCodeDescription.Code, StatusCodeDescription.Description);
	EndIf;

EndFunction

// Reads data from a GZip archive.
//
// Parameters:
//   CompressedData - BinaryData - GZip-packed data.
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

// Writes data to a GZip archive.
//
// Parameters:
//   Data - BinaryData - source data.
//
// Returns:
//   BinaryData - GZip-packed data.
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
	ParametersRequestFromAdditionalParameters =
		SelectValue(Undefined, AdditionalParameters, "RequestParameters", New Map);
	HeadersFromAdditionalParameters =
		SelectValue(Undefined, AdditionalParameters, "Headers", New Map);

	Authentication = Merge(Copy(AuthenticationFromAdditionalParameters), Session.Authentication);
	RequestParameters = Merge(Copy(ParametersRequestFromAdditionalParameters), Session.RequestParameters);
	Headers = Merge(Copy(HeadersFromAdditionalParameters), Session.Headers);
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

	PrepareBodyRequest(PreparedRequest, Data, Files, Json, JSONWriterSettings);
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

	ConnectionSettings = ConnectionSettings(Session, Method, URL, AdditionalParameters);

	Response = SendRequest(Session, PreparedRequest, ConnectionSettings);
	
	If ConnectionSettings.AllowRedirect And Response.IsRedirect Then
		// INFO: in general, authentication should be aligned with new parameters, but we'll ignore it for now.
		Response = RedirectRequest(Session, ConnectionSettings, PreparedRequest, Response);
	EndIf;
	
	Return Response;

EndFunction

Function RedirectRequest(Session, ConnectionSettings, PreparedRequest, RedirectedResponse)
	
	Redirect = 0;
	
	While RedirectedResponse.IsRedirect Do
		
		PrepareRequestForRedirect(Session, PreparedRequest, RedirectedResponse);
		
		RedirectedResponse = SendRequest(Session, PreparedRequest, ConnectionSettings);
		
		Redirect = Redirect + 1;
		
		If Redirect > Session.MaximumNumberOfRedirects Then
			Raise("TooManyRedirects");
		EndIf;
		
	EndDo;
	
	Return RedirectedResponse;
	
EndFunction

Procedure PrepareRequestForRedirect(Session, PreparedRequest, RedirectedResponse)
	
	HTTPStatusCodes = HTTPStatusCodes();
	
	NewURL = BuildNewURLOnRedirect(RedirectedResponse);
	
	PreparedRequest.URL = EncodeString(NewURL, StringEncodingMethod.URLInURLEncoding);
	NewHTTPRequest = New HTTPRequest(BuildAddressResource(ParseURL(NewURL), New Map));
	OverrideMethod(PreparedRequest, RedirectedResponse);

	If RedirectedResponse.StatusCode <> HTTPStatusCodes.TemporaryRedirect_307
		And RedirectedResponse.StatusCode <> HTTPStatusCodes.PermanentRedirect_308 Then
		RemoveHeaders(PreparedRequest.Headers, "content-length,content-type,transfer-encoding");
		NewHTTPRequest.Headers = PreparedRequest.Headers;
	Else
		SourceStream = PreparedRequest.HTTPRequest.GetBodyAsStream();
		SourceStream.CopyTo(NewHTTPRequest.GetBodyAsStream());
	EndIf;
	
	PreparedRequest.HTTPRequest = NewHTTPRequest;
	RemoveHeaders(PreparedRequest.Headers, "cookies");

	PreparedRequest.Cookies = MergeCookies(PreparedRequest.Cookies, Session.Cookies);
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
			TypeAuthentication = Lower(PreparedRequest.Authentication.Type);
			If TypeAuthentication = "digest" Then
				PreparedRequest.ResponseEvents.Add("Code401_ResponseHandler");
			EndIf;
			If TypeAuthentication = "aws4-hmac-sha256" Then
				PrepareAuthenticationAWS4(PreparedRequest);	
			EndIf;                                              
			If TypeAuthentication = "bearer" Then
				PrepareAuthenticationBearer(PreparedRequest);	
			EndIf;
		EndIf;
	EndIf;

EndProcedure

Procedure PrepareBodyRequest(PreparedRequest, Data, Files, Json, JSONWriterSettings)

	URLComposition = ParseURL(PreparedRequest.URL);

	HTTPRequest = New HTTPRequest;
	HTTPRequest.ResourceAddress = BuildAddressResource(URLComposition, PreparedRequest.RequestParameters);
	If ValueIsFilled(Files) Then
		ContentType = EncodeFiles(HTTPRequest, Files, Data);
	ElsIf ValueIsFilled(Data) Then
		ContentType = "application/x-www-form-urlencoded";
		If TypeOf(Data) = Type("BinaryData") Then
			HTTPRequest.SetBodyFromBinaryData(Data);
		Else
			If TypeOf(Data) = Type("String") Then
				Body = Data;
			Else
				Body = EncodeRequestParameters(Data);
			EndIf;
			ContentType = "application/x-www-form-urlencoded; charset=utf-8";
			HTTPRequest.SetBodyFromString(Body, TextEncoding.UTF8, ByteOrderMarkUse.DontUse);
		EndIf;
	ElsIf Json <> Undefined Then
		ContentType = "application/json; charset=utf-8";
		StringJson = ObjectToJson(Json, PreparedRequest.JSONConversionParameters, JSONWriterSettings);
		HTTPRequest.SetBodyFromString(StringJson, TextEncoding.UTF8, ByteOrderMarkUse.DontUse);
	Else
		ContentType = Undefined;
	EndIf;
	HeaderValue = HeaderValue("content-type", PreparedRequest.Headers);
	If HeaderValue = False And ValueIsFilled(ContentType) Then
		PreparedRequest.Headers.Insert("Content-Type", ContentType);
	EndIf;

	HTTPRequest.Headers = PreparedRequest.Headers;

	PackRequest(HTTPRequest);

	PreparedRequest.Insert("HTTPRequest", HTTPRequest);

EndProcedure

Function EncodeFiles(HTTPRequest, Files, Data)

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

	Separator = StrReplace(New UUID, "-", "");
	StringDelimiter = Chars.CR + Chars.LF;

	RequestBody = HTTPRequest.GetBodyAsStream();
	DataWriter = New DataWriter(RequestBody, TextEncoding.UTF8, ByteOrder.LittleEndian, "", "", False);
	For Each Part In Parts Do
		DataWriter.WriteLine("--" + Separator + StringDelimiter);
		DataWriter.WriteLine(HeadersInString(Part.Headers));
		If TypeOf(Part.Data) = Type("BinaryData") Then
			DataWriter.Write(Part.Data);
		Else
			DataWriter.WriteLine(Part.Data);
		EndIf;
		DataWriter.WriteLine(StringDelimiter);
	EndDo;
	DataWriter.WriteLine("--" + Separator + "--" + StringDelimiter);
	DataWriter.Close();

	Return StrTemplate("multipart/form-data; boundary=%1", Separator);

EndFunction

Function NewFormField(SourceParameters)

	Field = New Structure("Name,FileName,Data,Type,Headers");
	Field.Name = SourceParameters.Name;
	Field.Data = SourceParameters.Data;

	Field.Type = ValueByKey(SourceParameters, "Type");
	Field.Headers = ValueByKey(SourceParameters, "Headers", New Map);
	Field.FileName = ValueByKey(SourceParameters, "FileName");

	Key_ = "Content-Disposition";
	If HeaderValue("content-disposition", Field.Headers, Key_) = False Then
		Field.Headers.Insert("Content-Disposition", "form-data");
	EndIf;

	Parts = New Array;
	Parts.Add(Field.Headers[Key_]);
	Parts.Add(StrTemplate("name=""%1""", Field.Name));
	If ValueIsFilled(Field.FileName) Then
		Parts.Add(StrTemplate("filename=""%1""", Field.FileName));
	EndIf;

	Field.Headers[Key_] = StrConcat(Parts, "; ");
	Field.Headers["Content-Type"] = Field.Type;

	Return Field;

EndFunction

Function FillRequestParameters(Path)

	RequestParameters = New Map;

	Request = "";
	SplitStringByDelimiter(Request, Path, "?", True);
	For Each StringKeyEqualsParameter In StrSplit(Request, "&", False) Do
		StringKeyEqualsParameter = DecodeString(
			StringKeyEqualsParameter, StringEncodingMethod.URLInURLEncoding);

		PositionEquals = StrFind(StringKeyEqualsParameter, "=");
		If PositionEquals = 0 Then
			Key_ = StringKeyEqualsParameter;
			Value = Undefined;
		Else
			Key_ = Left(StringKeyEqualsParameter, PositionEquals - 1);
			Value = Mid(StringKeyEqualsParameter, PositionEquals + 1);
		EndIf;

		If RequestParameters.Get(Key_) <> Undefined Then
			If TypeOf(RequestParameters[Key_]) = Type("Array") Then
				RequestParameters[Key_].Add(Value);
			Else
				Values = New Array;
				Values.Add(RequestParameters[Key_]);
				Values.Add(Value);
				RequestParameters[Key_] = Values;
			EndIf;
		Else
			RequestParameters.Insert(Key_, Value);
		EndIf;

	EndDo;

	Return RequestParameters;

EndFunction

Function EncodeRequestParameters(RequestParameters)

	PartsParametersRequest = New Array;
	For Each Parameter In RequestParameters Do
		If TypeOf(Parameter.Value) = Type("Array") Then
			Values = Parameter.Value;
		Else
			Values = New Array;
			Values.Add(Parameter.Value);
		EndIf;

		If Parameter.Value = Undefined Then
			PartsParametersRequest.Add(Parameter.Key);
		Else
			For Each Value In Values Do
				ParameterValue = EncodeString(Value, StringEncodingMethod.URLEncoding);
				PartsParametersRequest.Add(StrTemplate("%1=%2", Parameter.Key, ParameterValue));
			EndDo;
		EndIf;
	EndDo;

	Return StrConcat(PartsParametersRequest, "&");

EndFunction

Procedure OverrideMethod(PreparedRequest, Response)

	HTTPStatusCodes = HTTPStatusCodes();

	Method = PreparedRequest.Method;

	// http://tools.ietf.org/html/rfc7231#section-6.4.4
	If Response.StatusCode = HTTPStatusCodes.SeeOther_303 And Method <> "HEAD" Then
		Method = "GET";
	EndIf;

	// Browser behavior
	If Response.StatusCode = HTTPStatusCodes.MovedTemporarily_302 And Method <> "HEAD" Then
		Method = "GET";
	EndIf;

	PreparedRequest.Method = Method;

EndProcedure

Function SendRequest(Session, PreparedRequest, Settings)

	Start = CurrentUniversalDateInMilliseconds();
	MillisecondsInSecond = 1000;

	Retry = 0;
	Duration = 0;
	Error = New Array;
	
	While True Do
		Try
			Response = SendHTTPRequest(Session, PreparedRequest, Settings);
			ErrorExecutionRequest = Undefined;
		Except
			Response = Undefined;
			ErrorExecutionRequest = ErrorInfo();
			
			ErrorText = StrTemplate(
				NStr("en = 'HTTP %1 %2
				           |Network error:
				           |%3'"),
				PreparedRequest.Method,
				PreparedRequest.URL,
				DetailErrorDescription(ErrorInfo())
			);
			Error.Add(ErrorText);
		EndTry;

		Retry = Retry + 1;
		Duration = (CurrentUniversalDateInMilliseconds() - Start) / MillisecondsInSecond;

		If Not RequiredRetryRequest(Response, Settings, ErrorExecutionRequest) Then
			Break;
		EndIf;

		If Retry > Settings.MaximumNumberOfRetries
			Or Duration > Settings.MaximumTimeOfRetries Then
			Break;
		EndIf;

		If ErrorExecutionRequest <> Undefined
			Or Not IsCodeStatusOnWhichMustConsiderHeaderRetryAfter(Response.StatusCode) Then
			RetryAfterHeader = False;
		Else
			RetryAfterHeader = HeaderValue("retry-after", Response.Headers);
		EndIf;
		
		DurationPause = CalculateDurationPause(
			Retry,
			Settings.ExponentialDelayRatio,
			RetryAfterHeader,
			Settings.MaximumTimeOfRetries - Duration);
		Pause(DurationPause);
	EndDo;

	If ErrorExecutionRequest <> Undefined Then
		Raise(DetailErrorDescription(ErrorExecutionRequest));
	EndIf;

	HeaderContentType = HeaderValue("content-type", Response.Headers);
	If HeaderContentType = False Then
		HeaderContentType = "";
	EndIf;

	PreparedResponse = NewResponse();
	PreparedResponse.Method = PreparedRequest.Method;
	PreparedResponse.URL = PreparedRequest.URL;
	PreparedResponse.StatusCode = Response.StatusCode;
	PreparedResponse.Headers = Response.Headers;
	PreparedResponse.Body = Response.GetBodyAsBinaryData();
	PreparedResponse.Encoding = EncodingFromHeader(HeaderContentType);
	PreparedResponse.TimeExecution = CurrentUniversalDateInMilliseconds() - Start;
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

Function RequiredRetryRequest(Response, Settings, ErrorExecutionRequest)

	If Settings.MaximumNumberOfRetries < 1 Then
		RetryRequest = False;
	ElsIf ErrorExecutionRequest <> Undefined Or RetryOnCodeStatus(Response.StatusCode, Settings) Then
		RetryRequest = True;
	Else
		RetryAfterHeader = HeaderValue("retry-after", Response.Headers);
		RetryRequest = RetryAfterHeader <> False
			And IsCodeStatusOnWhichMustConsiderHeaderRetryAfter(Response.StatusCode);
	EndIf;

	Return RetryRequest;

EndFunction

Function RetryOnCodeStatus(StatusCode, Settings)

	RetryOnAnyCodeStatusGreaterOrEqual500 = Settings.ToRetryForStatusesCodes = Undefined
		And StatusCode >= HTTPStatusCodes().InternalServerError_500;
	CodeStatusMatchesCodeStatusRetry = TypeOf(Settings.ToRetryForStatusesCodes) = Type("Array")
		And Settings.ToRetryForStatusesCodes.Find(StatusCode) <> Undefined;
	Return RetryOnAnyCodeStatusGreaterOrEqual500 Or CodeStatusMatchesCodeStatusRetry;

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

Procedure PackRequest(Request)

	Header = HeaderValue("content-encoding", Request.Headers);
	If Header <> False Then
		If Lower(Header) = "gzip" Then
			Request.SetBodyFromBinaryData(WriteGZip(Request.GetBodyAsBinaryData()));
		EndIf;
	EndIf;

EndProcedure

Function UnpackResponse(Response)

	Header = HeaderValue("content-encoding", Response.Headers);
	If Header <> False Then
		If Lower(Header) = "gzip" Then
			Return ReadGZip(Response.Body);
		EndIf;
	EndIf;

	Return Response.Body;

EndFunction

#EndRegion

#Region EventHandlers

Procedure Code401_ResponseHandler(Session, PreparedRequest, Settings, Response)

	If IsRedirect(Response.StatusCode, Response.Headers) Then
		Return;
	EndIf;

	HTTPStatusCodes = HTTPStatusCodes();
	If Response.StatusCode < HTTPStatusCodes.InvalidRequest_400
		Or Response.StatusCode >= HTTPStatusCodes.InternalServerError_500 Then
		Return;
	EndIf;

	Value = HeaderValue("www-authenticate", Response.Headers);
	If Value <> False And StrFind(Lower(Value), "digest") Then
		Position = StrFind(Lower(Value), "digest");
		Value = Mid(Value, Position + StrLen("digest") + 1);
		Value = StrReplace(Value, """", "");
		Value = StrReplace(Value, Chars.LF, "");

		DigestParameters = New Structure("algorithm,realm,nonce,qop,opaque");
		For Each Part In SplitStringByString(Value, ", ") Do
			KeyValue = StrSplit(Part, "=");
			DigestParameters.Insert(KeyValue[0], KeyValue[1]);
		EndDo;

		Session.ServiceData.DigestParameters = DigestParameters;

		PreparedRequest.Headers.Insert("Authorization", PrepareHeaderDigest(Session, PreparedRequest));
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

	PreparedURL = PreparedURL + BuildAddressResource(URLComposition, RequestParameters);

	Return PreparedURL;

EndFunction

Function BuildAddressResource(URLComposition, RequestParameters)

	ResourceAddress = URLComposition.Path;

	MergedRequestParameters = Merge(Copy(RequestParameters), URLComposition.RequestParameters);
	If ValueIsFilled(MergedRequestParameters) Then
		ResourceAddress = ResourceAddress + "?" + EncodeRequestParameters(MergedRequestParameters);
	EndIf;
	If ValueIsFilled(URLComposition.Fragment) Then
		ResourceAddress = ResourceAddress + "#" + URLComposition.Fragment;
	EndIf;

	Return ResourceAddress;

EndFunction

Function BuildNewURLOnRedirect(Response)

	NewURL = HeaderValue("location", Response.Headers);
	NewURL = DecodeString(NewURL, StringEncodingMethod.URLInURLEncoding);

	// Redirect without scheme
	If StrStartWith(NewURL, "//") Then
		URLComposition = ParseURL(Response.URL);
		NewURL = URLComposition.Scheme + ":" + NewURL;
	EndIf;

	URLComposition = ParseURL(NewURL);
	If SplitStringByString(NewURL, "://").Count() < 2 Then
		StructureURLResponse = ParseURL(Response.URL);
		BaseURL = StrTemplate("%1://%2", StructureURLResponse.Scheme, StructureURLResponse.Host);
		If ValueIsFilled(StructureURLResponse.Port) Then
			BaseURL = BaseURL + ":" + Format(StructureURLResponse.Port, "NGS=; NG=");
		EndIf;
		If StrStartWith(NewURL, "/") Then
			NewURL = BaseURL + NewURL;
		Else
			IndexLastSlash = StrFind(StructureURLResponse.Path, "/", SearchDirection.FromEnd);
			ParentDirectory = Left(StructureURLResponse.Path, IndexLastSlash);
			NewURL = BaseURL + ParentDirectory + NewURL;
		EndIf;
	EndIf;

	Return NewURL;

EndFunction

Function IsStandardPort(URLComposition)

	StandardPortHTTP = 80;
	StandardPortHTTPS = 443;

	Return (URLComposition.Scheme = "http" And URLComposition.Port = StandardPortHTTP)
		Or (URLComposition.Scheme = "https" And URLComposition.Port = StandardPortHTTPS);

EndFunction

#EndRegion

#Region WorkWithConnection

Function ConnectionSettings(Session, Method, URL, AdditionalParameters)
	
	VerifySSLFromSession = ValueByKey(Session, "VerifySSL", True);
	VerifySSLFromAdditionalParameters = ValueByKey(AdditionalParameters, "VerifySSL", True);
	ClientCertificateSSLFromAdditionalParameters =
		ValueByKey(AdditionalParameters, "ClientSSLCertificate");
	
	AllowRedirect =
		ValueByKey(AdditionalParameters, "AllowRedirect", Upper(Method) <> "HEAD");
	VerifySSL = ?(VerifySSLFromAdditionalParameters, True, VerifySSLFromSession);
	ClientSSLCertificate =
		SelectValue(ClientCertificateSSLFromAdditionalParameters, Session, "ClientSSLCertificate", Undefined);
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
		If ConnectionParameters.Scheme = "https" Then
			ConnectionParameters.Port = 443;
		Else
			ConnectionParameters.Port = 80;
		EndIf;
	EndIf;

	SecureConnection = Undefined;
	If ConnectionParameters.Scheme = "https" Then
		SecureConnection = ObjectProtectedConnection(AdditionalParameters);
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
			// For simplicity, we'll assume that certificates do not change within a session
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

Function ObjectProtectedConnection(AdditionalParameters)

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

	If AdditionalParameters.Property("Timeout") And AdditionalParameters.Timeout <> Undefined Then
		Timeout = AdditionalParameters.Timeout;
	Else
		Timeout = TimeoutByDefault();
	EndIf;

	Return Timeout;

EndFunction

Function ProxyByDefault(URL)

	ProxyByDefault = New InternetProxy;
	// BSLLS:ExecuteExternalCodeInCommonModule-off
	NameOMGetFilesSSL = "GetFilesFromInternet";
	If Metadata.CommonModules.Find(NameOMGetFilesSSL) <> Undefined Then
		URLComposition = ParseURL(URL);
		Module = Eval(NameOMGetFilesSSL);
		ProxyByDefault = Module.GetProxy(URLComposition.Scheme);
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

Function HeadersInString(Headers)

	StringDelimiter = Chars.CR + Chars.LF;
	Lines = New Array;

	SortedHeaders = "Content-Disposition,Content-Type,Content-Location";
	For Each Key_ In StrSplit(SortedHeaders, ",") Do
		Value = HeaderValue(Key_, Headers);
		If Value <> False And ValueIsFilled(Value) Then
			Lines.Add(StrTemplate("%1: %2", Key_, Value));
		EndIf;
	EndDo;

	Keys = StrSplit(Upper(SortedHeaders), ",");
	For Each Header In Headers Do
		If Keys.Find(Upper(Header.Key)) = Undefined Then
			Lines.Add(StrTemplate("%1: %2", Header.Key, Header.Value));
		EndIf;
	EndDo;
	Lines.Add(StringDelimiter);

	Return StrConcat(Lines, StringDelimiter);

EndFunction

Procedure RemoveHeaders(Headers, ListHeadersString)

	HeadersForDelete = New Array;
	ListHeaders = StrSplit(ListHeadersString, ",", False);
	For Each Header In Headers Do
		If ListHeaders.Find(Lower(Header.Key)) <> Undefined Then
			HeadersForDelete.Add(Header.Key);
		EndIf;
	EndDo;
	For Each HeaderForDelete In HeadersForDelete Do
		Headers.Delete(HeaderForDelete);
	EndDo;

EndProcedure

Function ExistsLocationHeader(Headers)

	Return HeaderValue("location", Headers) <> False;

EndFunction

Function EncodingFromHeader(Val Header)

	Encoding = Undefined;

	Header = Lower(TrimAll(Header));
	IndexSeparator = StrFind(Header, ";");
	If IndexSeparator Then
		TypeContent = TrimAll(Left(Header, IndexSeparator - 1));
		KeyEncoding = "charset=";
		IndexEncoding = StrFind(Header, KeyEncoding);
		If IndexEncoding Then
			IndexSeparator = StrFind(Header, ";", SearchDirection.FromBegin, IndexEncoding);
			InitialPosition = IndexEncoding + StrLen(KeyEncoding);
			If IndexSeparator Then
				LengthEncoding = IndexSeparator - InitialPosition;
			Else
				LengthEncoding = StrLen(Header);
			EndIf;
			Encoding = Mid(Header, InitialPosition, LengthEncoding);
			Encoding = StrReplace(Encoding, """", "");
			Encoding = StrReplace(Encoding, "'", "");
		EndIf;
	Else
		TypeContent = Header;
	EndIf;

	If Encoding = Undefined And StrFind(TypeContent, "text") Then
		Encoding = "iso-8859-1";
	EndIf;

	Return Encoding;

EndFunction

Function HeaderValue(Header, AllHeaders, Key_ = Undefined)

	For Each NextHeader In AllHeaders Do
		If Lower(NextHeader.Key) = Lower(Header) Then
			Key_ = NextHeader.Key;
			Return NextHeader.Value;
		EndIf;
	EndDo;

	Return False;

EndFunction

Function CreateHostHeaderValue(URLComposition)

	Host = URLComposition.Host;
	If ValueIsFilled(URLComposition.Port) And Not IsStandardPort(URLComposition) Then
		Host = Host + ":" + Format(URLComposition.Port, "NGS=; NG=");
	EndIf;

	Return Host;

EndFunction

Function PrepareHeaderDigest(Session, PreparedRequest)

	DigestParameters = Session.ServiceData.DigestParameters;

	Algorithm = DefineHashFunction(DigestParameters.algorithm);
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

	If Not DigestParameters.Property("last_nonce") Then
		DigestParameters.Insert("last_nonce");
	EndIf;

	If DigestParameters.nonce = DigestParameters.last_nonce Then
		DigestParameters.nonce_count = DigestParameters.nonce_count + 1;
	Else
		DigestParameters.Insert("nonce_count", 1);
	EndIf;

	ValueNC = Format(DigestParameters.nonce_count, "ND=8; NLZ=; NG=");
	ValueNonce = Left(StrReplace(Lower(New UUID), "-", ""), 16);

	If AlgorithmString = "MD5-SESS" Then
		HA1 = DataHashing(Algorithm, StrTemplate("%1:%2:%3", HA1, DigestParameters.nonce, ValueNonce));
	EndIf;

	If Not ValueIsFilled(DigestParameters.qop) Then
		ValueResponse = DataHashing(Algorithm, StrTemplate("%1:%2:%3", HA1, DigestParameters.nonce, HA2));
	ElsIf DigestParameters.qop = "auth"
		Or StrSplit(DigestParameters.qop, ",", False).Find("auth") <> Undefined Then
		ValueNonceBit = StrTemplate("%1:%2:%3:%4:%5", DigestParameters.nonce, ValueNC, ValueNonce, "auth", HA2);
		ValueResponse = DataHashing(Algorithm, StrTemplate("%1:%2", HA1, ValueNonceBit));
	Else
		// INFO: auth-int is not implemented
		Return Undefined;
	EndIf;

	DigestParameters.last_nonce = DigestParameters.nonce;

	Base = StrTemplate("username=""%1"", realm=""%2"", nonce=""%3"", uri=""%4"", response=""%5""",
		PreparedRequest.Authentication.User,
		DigestParameters.realm,
		DigestParameters.nonce,
		Path,
		ValueResponse);
	Lines = New Array;
	Lines.Add(Base);

	If ValueIsFilled(DigestParameters.opaque) Then
		Lines.Add(StrTemplate(", opaque=""%1""", DigestParameters.opaque));
	EndIf;
	If ValueIsFilled(DigestParameters.algorithm) Then
		Lines.Add(StrTemplate(", algorithm=""%1""", DigestParameters.algorithm));
	EndIf;
	If ValueIsFilled(DigestParameters.qop) Then
		Lines.Add(StrTemplate(", qop=""auth"", nc=%1, cnonce=""%2""", ValueNC, ValueNonce));
	EndIf;

	Return StrTemplate("Digest %1", StrConcat(Lines, ""));

EndFunction

#EndRegion

#Region Cookies

Procedure PrepareCookies(PreparedRequest)

	HeaderCookie = PrepareHeaderCookie(PreparedRequest);
	If ValueIsFilled(HeaderCookie) Then
		PreparedRequest.Headers["Cookie"] = HeaderCookie;
	EndIf;

EndProcedure

Function PrepareHeaderCookie(PreparedRequest)

	URLComposition = ParseURL(PreparedRequest.URL);

	Cookies = New Array;
	For Each Cookie In FilterCookiesForRequest(URLComposition, PreparedRequest.Cookies) Do
		Cookies.Add(StrTemplate("%1=%2", Cookie.Name, Cookie.Value));
	EndDo;

	Return StrConcat(Cookies, "; ");

EndFunction

Function MergeCookies(MainSource, AdditionalSource)

	Cookies = New Map;
	For Each Cookie In ConvertStorageCookiesInArrayCookies(MainSource) Do
		AddCookieInStorage(Cookies, Cookie, True);
	EndDo;
	For Each Cookie In ConvertStorageCookiesInArrayCookies(AdditionalSource) Do
		AddCookieInStorage(Cookies, Cookie, True);
	EndDo;

	Return Cookies;

EndFunction

Function ConvertStorageCookiesInArrayCookies(StorageCookies)

	Cookies = New Array;
	If TypeOf(StorageCookies) = Type("Array") Then
		For Each Cookie In StorageCookies Do
			NewCookie = ConstructorCookie();
			FillPropertyValues(NewCookie, Cookie);
			Cookies.Add(NewCookie);
		EndDo;

		Return Cookies;
	EndIf;

	For Each Domain In StorageCookies Do
		For Each Path In Domain.Value Do
			For Each Name In Path.Value Do
				Cookies.Add(Name.Value);
			EndDo;
		EndDo;
	EndDo;

	Return Cookies;

EndFunction

Function FilterCookiesForRequest(URLComposition, Cookies)

	ServerInRequest = AddLeadingDot(URLComposition.Host);

	Result = New Array;
	For Each Domain In Cookies Do
		If Not StrEndsWith(ServerInRequest, Domain.Key) Then
			Continue;
		EndIf;
		For Each Path In Domain.Value Do
			If Not StrStartWith(URLComposition.Path, Path.Key) Then
				Continue;
			EndIf;
			FillListFilteredCookies(Path.Value, URLComposition, Result);
		EndDo;
	EndDo;

	Return Result;

EndFunction

Procedure FillListFilteredCookies(Cookies, URLComposition, List)

	For Each Cookie In Cookies Do
		If Cookie.Value.OnlySafeConnection = True And URLComposition.Scheme <> "https" Then
			Continue;
		EndIf;
		// INFO: expiration check is ignored (Cookie.Value.Expires)
		// INFO: port check is ignored

		List.Add(Cookie.Value);
	EndDo;

EndProcedure

Function RefillCookie(Cookies, URL)

	URLComposition = ParseURL(URL);
	NewCookies = New Array;
	If TypeOf(Cookies) = Type("Array") Then
		For Each Cookie In Cookies Do
			NewCookie = ConstructorCookie(Cookie.Name, Cookie.Value);
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
		If Lower(NextHeader.Key) = "set-cookie" Then
			For Each HeaderCookie In SplitOnSeparateHeadersCookies(NextHeader.Value) Do
				Cookie = ParseCookie(HeaderCookie, URL, CurrentTime);
				If Cookie = Undefined Then
					Continue;
				EndIf;
				If Cookie.ExpirationAction <= CurrentTime Then
					RemoveCookieFromStorage(Cookies, Cookie);
				Else
					AddCookieInStorage(Cookies, Cookie);
				EndIf;
			EndDo;
		EndIf;
	EndDo;

	Return Cookies;

EndFunction

Function SplitOnSeparateHeadersCookies(Val Header)

	Headers = New Array;

	If Not ValueIsFilled(Header) Then
		Return Headers;
	EndIf;

	SparesHeaders = StrSplit(Header, ",", False);

	SeparateHeader = SparesHeaders[0];
	For Index = 1 To SparesHeaders.UBound() Do
		DotWithComma = StrFind(SparesHeaders[Index], ";");
		equals = StrFind(SparesHeaders[Index], "=");
		If DotWithComma And equals And equals < DotWithComma Then
			Headers.Add(SeparateHeader);
			SeparateHeader = SparesHeaders[Index];
		Else
			SeparateHeader = SeparateHeader + SparesHeaders[Index];
		EndIf;
	EndDo;
	Headers.Add(SeparateHeader);

	Return Headers;

EndFunction

Procedure AddCookieInStorage(StorageCookies, Cookie, Replace = False)

	If StorageCookies.Get(Cookie.Domain) = Undefined Then
		StorageCookies[Cookie.Domain] = New Map;
	EndIf;
	If StorageCookies[Cookie.Domain].Get(Cookie.Path) = Undefined Then
		StorageCookies[Cookie.Domain][Cookie.Path] = New Map;
	EndIf;
	If StorageCookies[Cookie.Domain][Cookie.Path].Get(Cookie.Name) = Undefined Or Replace Then
		StorageCookies[Cookie.Domain][Cookie.Path][Cookie.Name] = Cookie;
	EndIf;

EndProcedure

Procedure RemoveCookieFromStorage(StorageCookies, Cookie)

	If StorageCookies.Get(Cookie.Domain) <> Undefined
		And StorageCookies[Cookie.Domain].Get(Cookie.Path) <> Undefined
		And StorageCookies[Cookie.Domain][Cookie.Path].Get(Cookie.Name) <> Undefined Then
		StorageCookies[Cookie.Domain][Cookie.Path].Delete(Cookie.Name);
	EndIf;

EndProcedure

Function ParseCookie(Header, URL, CurrentTime)

	Cookie = Undefined;
	Index = 0;

	For Each Parameter In StrSplit(Header, ";", False) Do
		Index = Index + 1;
		Parameter = TrimAll(Parameter);

		If Index = 1 Then
			Cookie = CreateCookieAndFillMainParameters(Parameter);
			Continue;
		EndIf;

		Parts = StrSplit(Parameter, "=", False);
		Key_ = Lower(Parts[0]);
		If Parts.Count() > 1 Then
			Value = Parts[1];
		EndIf;

		If Key_ = "domain" Then
			Cookie.Domain = Value;
		ElsIf Key_ = "path" Then
			Cookie.Path = Value;
		ElsIf Key_ = "secure" Then
			Cookie.OnlySafeConnection = True;
		ElsIf Key_ = "max-age" Then
			ExpirationActionMaxAge = CurrentTime + NumberFromString(Value);
		ElsIf Key_ = "expires" Then
			Cookie.ExpirationAction = DateFromStringRFC7231(Value);
		Else
			Continue;
		EndIf;
	EndDo;
	If ValueIsFilled(Cookie) And ValueIsFilled(ExpirationActionMaxAge) Then
		Cookie.ExpirationAction = ExpirationActionMaxAge;
	EndIf;

	FillCookieImplicitValues(Cookie, URL);

	Return Cookie;

EndFunction

Function CreateCookieAndFillMainParameters(Parameter)

	Parts = StrSplit(Parameter, "=", False);
	Name = Parts[0];
	If Parts.Count() > 1 Then
		Value = Mid(Parameter, StrLen(Name) + 2);
	EndIf;

	Return ConstructorCookie(Name, Value);

EndFunction

Procedure FillCookieImplicitValues(Cookie, URL)

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
		PositionLastSlash = StrFind(URLComposition.Path, "/", SearchDirection.FromEnd);
		If PositionLastSlash <= 1 Then
			Cookie.Path = "/";
		Else
			Cookie.Path = Left(URLComposition.Path, PositionLastSlash - 1);
		EndIf;
	EndIf;

EndProcedure

Function ConstructorCookie(Name = "", Value = Undefined)

	NewCookie = New Structure;
	NewCookie.Insert("Name", Name);
	NewCookie.Insert("Value", Value);
	NewCookie.Insert("Domain", "");
	NewCookie.Insert("Path", "");
	NewCookie.Insert("Port");
	NewCookie.Insert("ExpirationAction", '39990101');
	NewCookie.Insert("OnlySafeConnection");

	Return NewCookie;

EndFunction

#EndRegion

#Region ParametersWorkWithJSON

// Converts a value to a type whose serialization is supported.
//
// Parameters:
//   Property - String - property name, if writing a structure or map.
//   Value - Arbitrary - source value.
//   AdditionalParameters - Arbitrary - additional parameters specified in the WriteJSON method call.
//   Cancel - Boolean - cancellation of the property write.
//
// Returns:
//   Arbitrary - see types in WriteJSON.
//
Function JsonConversion(Property, Value, AdditionalParameters, Cancel) Export

	If TypeOf(Value) = Type("UUID") Then
		Return String(Value);
	ElsIf TypeOf(Value) = Type("BinaryData") Then
		Return GetBase64StringFromBinaryData(Value);
	Else
		// If the value does not support serialization to JSON, an exception will be raised
		Return Value;
	EndIf;

EndFunction

// Restores a value of a type whose deserialization is not supported.
//
// Parameters:
//   Property - String - name of the property whose value needs to be restored.
//   Value - String - value to restore.
//   TypesProperties - Map - property types to restore.
//     * Key - String - property name. Equals the value of the Property parameter.
//     property types to restore.
//     * Key - String - property name. Equals the value of the Property parameter.
//
// Returns:
//   Arbitrary - restored value.
//
Function RestoreJson(Property, Value, TypesProperties) Export

	TypeProperties = TypesProperties.Get(Property);
	If TypeProperties = Type("UUID") Then
		Return New UUID(Value);
	ElsIf TypeProperties = Type("BinaryData") Then
		Return GetBinaryDataFromBase64String(Value);
	Else
		Return Value;
	EndIf;

EndFunction

#EndRegion

#Region AWS4Authentication

Function KeySignatureAWS4(SecretKey, Date, Region, Service)

	KeyDate = SignMessageHMAC("AWS4" + SecretKey, Date);
	KeyRegion = SignMessageHMAC(KeyDate, Region);
	ServiceKey = SignMessageHMAC(KeyRegion, Service);

	Return SignMessageHMAC(ServiceKey, "aws4_request");

EndFunction

Function SignMessageHMAC(Val Key_, Val Message, Val Algorithm = Undefined)

	If Algorithm = Undefined Then
		Algorithm = HashFunction.SHA256;
	EndIf;

	If TypeOf(Key_) = Type("String") Then
		Key_ = GetBinaryDataFromString(Key_, TextEncoding.UTF8, False);
	EndIf;
	If TypeOf(Message) = Type("String") Then
		Message = GetBinaryDataFromString(Message, TextEncoding.UTF8, False);
	EndIf;

	Return HMAC(Key_, Message, Algorithm);

EndFunction

Procedure PrepareAuthenticationAWS4(PreparedRequest)

	HeaderValue = HeaderValue("x-amz-date", PreparedRequest.Headers);
	If HeaderValue <> False Then
		CurrentTime = Date(StrReplace(StrReplace(HeaderValue, "T", ""), "Z", ""));
	Else
		CurrentTime = CurrentUniversalDate();
	EndIf;
	PreparedRequest.Headers["x-amz-date"] = Format(CurrentTime, "DF=yyyyMMddTHHmmssZ");
	ScopeDate = Format(CurrentTime, "DF=yyyyMMdd");

	PreparedRequest.Headers["x-amz-content-sha256"] =
		DataHashing(HashFunction.SHA256, PreparedRequest.HTTPRequest.GetBodyAsBinaryData());

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
	RequestParts.Add(PreparedRequest.Headers["x-amz-content-sha256"]);
	CanonicalRequest = StrConcat(RequestParts, Chars.LF);

	ScopeParts = New Array;
	ScopeParts.Add(ScopeDate);
	ScopeParts.Add(PreparedRequest.Authentication.Region);
	ScopeParts.Add(PreparedRequest.Authentication.Service);
	ScopeParts.Add("aws4_request");
	Scope = StrConcat(ScopeParts, "/");

	StringForSignatureParts = New Array;
	StringForSignatureParts.Add(PreparedRequest.Authentication.Type);
	StringForSignatureParts.Add(PreparedRequest.Headers["x-amz-date"]);
	StringForSignatureParts.Add(Scope);
	StringForSignatureParts.Add(DataHashing(HashFunction.SHA256, CanonicalRequest));
	StringForSignature = StrConcat(StringForSignatureParts, Chars.LF);

	Key_ = KeySignatureAWS4(
		PreparedRequest.Authentication.SecretKey,
		ScopeDate,
		PreparedRequest.Authentication.Region,
		PreparedRequest.Authentication.Service);
	Signature = Lower(GetHexStringFromBinaryData(SignMessageHMAC(Key_, StringForSignature)));

	PreparedRequest.Headers["Authorization"] = StrTemplate(
		"%1 Credential=%2/%3, SignedHeaders=%4, Signature=%5",
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
		If DefaultHeaders.Exception.Find(Header) <> Undefined Then
			Continue;
		EndIf;
		HostHeadersIsInRequest = Max(HostHeadersIsInRequest, Header = "host");

		If DefaultHeaders.equals.Find(Header) <> Undefined Then
			List.Add(Header, TrimAll(NextHeader.Value));
		Else
			For Each Prefix In DefaultHeaders.BeginsWith Do
				If StrStartWith(Header, Prefix) Then
					List.Add(Header, TrimAll(NextHeader.Value));
					Break;
				EndIf;
			EndDo;
		EndIf;
	EndDo;

	If Not HostHeadersIsInRequest Then
		List.Add("host", CreateHostHeaderValue(URLComposition));
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
	Headers.Insert("equals", StrSplit("host,content-type,date", ","));
	Headers.Insert("BeginsWith", StrSplit("x-amz-", ","));
	Headers.Insert("Exception", StrSplit("x-amz-client-context", ","));

	Return Headers;

EndFunction

#EndRegion 

Procedure PrepareAuthenticationBearer(PreparedRequest)   
	
	If Not PreparedRequest.Authentication.Property("Token") Or Not ValueIsFilled(PreparedRequest.Authentication.Token) Then 
		// Token is not set.
		Return;	
	EndIf;

	PreparedRequest.Headers.Insert("Authorization", StrTemplate("Bearer %1", PreparedRequest.Authentication.Token));
			
EndProcedure


#Region EncodingDecodingData

#Region ServiceStructureZip

// Structure description see here https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT 

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
	Buffer.WriteInt16(12, 0);       // Date
	Buffer.WriteInt32(14, 0);       // crc-32
	Buffer.WriteInt32(18, 0);       // compressed size
	Buffer.WriteInt32(22, 0);       // uncompressed size
	Buffer.WriteInt16(26, 4);       // filename legth - "data"
	Buffer.WriteInt16(28, 0);       // extra field length
	Buffer.Write(30, GetBinaryDataBufferFromString("data", "ascii", False));

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
	Buffer.WriteInt16(14, 0);                    // Date
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
	Buffer.Write(46, GetBinaryDataBufferFromString("data", "ascii", False));

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

#Region ServiceStructureGZip

// Structure description see here https://www.ietf.org/rfc/rfc1952.txt 

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
	Raise(NStr("en = 'Zip files are not supported on the mobile platform'"));
#Else
	Directory = GetTempFileName();
	ZipReader = New ZipFileReader(CompressedData);
	FileName = ZipReader.Items[0].Name;
	Try
		ZipReader.Extract(ZipReader.Items[0], Directory, ZIPRestoreFilePathsMode.DontRestore);
	Except
		// Ignoring the archive integrity check, just reading the result
		ErrorText = DetailErrorDescription(ErrorInfo());
	EndTry;
	ZipReader.Close();

	Result = New BinaryData(Directory + GetPathSeparator() + FileName);
	DeleteFiles(Directory);

	Return Result;
#EndIf

EndFunction

Function WriteZip(Data)

#If MobileAppServer Then
	Raise(NStr("en = 'Zip files are not supported on the mobile platform'"));
#Else
	TemporaryFile = GetTempFileName(".bin");
	Data.Write(TemporaryFile);
	ZipStream = New MemoryStream;
	RecordZip = New ZipFileWriter(ZipStream);
	RecordZip.Add(TemporaryFile);
	RecordZip.Write();
	DeleteFiles(TemporaryFile);

	Return ZipStream.CloseAndGetBinaryData();
#EndIf

EndFunction

#EndRegion

#Region ParametersByDefault

Function DefaultHeaders()

	Headers = New Map;
#If MobileAppServer Then
	Headers.Insert("Accept-Encoding", "identity");
#Else
	Headers.Insert("Accept-Encoding", "gzip");
#EndIf
	Headers.Insert("Accept", "*/*");
	Headers.Insert("Connection", "keep-alive");

	Return Headers;

EndFunction

Function MaximumNumberOfRedirects()

	Return 30;

EndFunction

Function TimeoutByDefault()

	Return 30;

EndFunction

Function ParametersConversionJSONByDefault()

	ConversionParametersByDefault = New Structure;
	ConversionParametersByDefault.Insert("ReadToMap", True);
	ConversionParametersByDefault.Insert("JSONDateFormat", JSONDateFormat.iso);
	ConversionParametersByDefault.Insert("PropertiesNamesWithDateValues", Undefined);
	ConversionParametersByDefault.Insert("JSONDateWritingVariant", JSONDateWritingVariant.LocalDate);
	ConversionParametersByDefault.Insert("ConvertionFunctionName", Undefined);
	ConversionParametersByDefault.Insert("ConvertionFunctionModule", Undefined);
	ConversionParametersByDefault.Insert("ConvertionFunctionAdditionalParameters", Undefined);
	ConversionParametersByDefault.Insert("NameFunctionRestore", Undefined);
	ConversionParametersByDefault.Insert("ModuleFunctionRestore", Undefined);
	ConversionParametersByDefault.Insert("AdditionalParametersFunctionRestore", Undefined);
	ConversionParametersByDefault.Insert("NamesPropertiesForProcessingRestore", Undefined);
	ConversionParametersByDefault.Insert("MaxNesting", 500);

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
	Codes.Add(NewHTTPCode(100, "Continue_100", "Continue"));
	Codes.Add(NewHTTPCode(101, "SwitchProtocol_101", "Switching Protocols"));
	Codes.Add(NewHTTPCode(102, "GoesProcessing_102", "Processing"));
	Codes.Add(NewHTTPCode(103, "EarlyMetainformation_103", "Early Hints"));

	Codes.Add(NewHTTPCode(200, "OK_200", "OK"));
	Codes.Add(NewHTTPCode(201, "Created_201", "Created"));
	Codes.Add(NewHTTPCode(202, "Accepted_202", "Accepted"));
	Codes.Add(NewHTTPCode(203, "InformationNotAuthoritative_203", "Non-Authoritative Information"));
	Codes.Add(NewHTTPCode(204, "NoContent_204", "No Content"));
	Codes.Add(NewHTTPCode(205, "ResetContent_205", "Reset Content"));
	Codes.Add(NewHTTPCode(206, "PartialContent_206", "Partial Content"));
	Codes.Add(NewHTTPCode(207, "MultiStatus_207", "Multi-Status"));
	Codes.Add(NewHTTPCode(208, "AlreadyReported_208", "Already Reported"));
	Codes.Add(NewHTTPCode(226, "UsedIM_226", "IM Used"));

	Codes.Add(NewHTTPCode(300, "SetChoices_300", "Multiple Choices"));
	Codes.Add(NewHTTPCode(301, "MovedPermanently_301", "Moved Permanently"));
	Codes.Add(NewHTTPCode(302, "MovedTemporarily_302", "Moved Temporarily"));
	Codes.Add(NewHTTPCode(303, "SeeOther_303", "See Other"));
	Codes.Add(NewHTTPCode(304, "NotChanged_304", "Not Modified"));
	Codes.Add(NewHTTPCode(305, "UseProxy_305", "Use Proxy"));
	Codes.Add(NewHTTPCode(307, "TemporaryRedirect_307", "Temporary Redirect"));
	Codes.Add(NewHTTPCode(308, "PermanentRedirect_308", "Permanent Redirect"));

	Codes.Add(NewHTTPCode(400, "InvalidRequest_400", "Bad Request"));
	Codes.Add(NewHTTPCode(401, "NotAuthorized_401", "Unauthorized"));
	Codes.Add(NewHTTPCode(402, "RequiredPayment_402", "Payment Required"));
	Codes.Add(NewHTTPCode(403, "Forbidden_403", "Forbidden"));
	Codes.Add(NewHTTPCode(404, "NotFound_404", "Not Found"));
	Codes.Add(NewHTTPCode(405, "MethodNotSupported_405", "Method Not Allowed"));
	Codes.Add(NewHTTPCode(406, "Unacceptable_406", "Not Acceptable"));
	Codes.Add(NewHTTPCode(407, "RequiredAuthenticationProxy_407", "Proxy Authentication Required"));
	Codes.Add(NewHTTPCode(408, "ExpiredTimeWait_408", "Request Timeout"));
	Codes.Add(NewHTTPCode(409, "Conflict_409", "Conflict"));
	Codes.Add(NewHTTPCode(410, "Removed_410", "Gone"));
	Codes.Add(NewHTTPCode(411, "RequiredLength_411", "Length Required"));
	Codes.Add(NewHTTPCode(412, "ConditionFalse_412", "Precondition Failed"));
	Codes.Add(NewHTTPCode(413, "PayloadPayloadTooLarge_413", "Payload Too Large"));
	Codes.Add(NewHTTPCode(414, "TooLongURI_414", "URI Too Long"));
	Codes.Add(NewHTTPCode(415, "UnsupportedTypeData_415", "Unsupported Media Type"));
	Codes.Add(NewHTTPCode(416, "RangeNotReachable_416", "Range Not Satisfiable"));
	Codes.Add(NewHTTPCode(417, "WaitNotSucceeded_417", "Expectation Failed"));
	Codes.Add(NewHTTPCode(419, "ErrorCheckCSRF_419", "Authentication Timeout"));
	Codes.Add(NewHTTPCode(421, "IncorrectlyDirectedRequest_421", "Misdirected Request"));
	Codes.Add(NewHTTPCode(422, "UnprocessableInstance_422", "Unprocessable Entity"));
	Codes.Add(NewHTTPCode(423, "Blocked_423", "Locked"));
	Codes.Add(NewHTTPCode(424, "UnfulfilledDependency_424", "Failed Dependency"));
	Codes.Add(NewHTTPCode(425, "TooEarly_425", "Too Early"));
	Codes.Add(NewHTTPCode(426, "RequiredUpdate_426", "Upgrade Required"));
	Codes.Add(NewHTTPCode(428, "RequiredPrecondition_428", "Precondition Required"));
	Codes.Add(NewHTTPCode(429, "TooManyRequests_429", "Too Many Requests"));
	Codes.Add(NewHTTPCode(431, "FieldsHeaderRequestTooLarge_431", "Request Header Fields Too Large"));
	Codes.Add(NewHTTPCode(449, "RetryWith_449", "Retry With"));
	Codes.Add(NewHTTPCode(451, "UnavailableByLegalReasons_451", "Unavailable For Legal Reasons"));
	Codes.Add(NewHTTPCode(499, "ClientClosedConnection_499", "Client Closed Request"));

	Codes.Add(NewHTTPCode(500, "InternalServerError_500", "Internal Server Error"));
	Codes.Add(NewHTTPCode(501, "NotImplemented_501", "Not Implemented"));
	Codes.Add(NewHTTPCode(502, "BadGateway_502", "Bad Gateway"));
	Codes.Add(NewHTTPCode(503, "ServiceUnavailable_503", "Service Unavailable"));
	Codes.Add(NewHTTPCode(504, "GatewayNotResponds_504", "Gateway Timeout"));
	Codes.Add(NewHTTPCode(505, "VersionHTTPNotSupported_505", "HTTP Version Not Supported"));
	Codes.Add(NewHTTPCode(506, "VariantAlsoPerformsNegotiation_506", "Variant Also Negotiates"));
	Codes.Add(NewHTTPCode(507, "OverflowStorage_507", "Insufficient Storage"));
	Codes.Add(NewHTTPCode(508, "DetectedInfiniteRedirect_508", "Loop Detected"));
	Codes.Add(NewHTTPCode(509, "ExhaustedBandwidthWidthChannel_509", "Bandwidth Limit Exceeded"));
	Codes.Add(NewHTTPCode(510, "NotExtended_510", "Not Extended"));
	Codes.Add(NewHTTPCode(511, "RequiredNetworkAuthentication_511", "Network Authentication Required"));
	Codes.Add(NewHTTPCode(520, "UnknownError_520", "Unknown Error"));
	Codes.Add(NewHTTPCode(521, "WebServerNotWorks_521", "Web Server is Down"));
	Codes.Add(NewHTTPCode(522, "ConnectionNotResponds_522", "Connection Timed Out"));
	Codes.Add(NewHTTPCode(523, "SourceUnavailable_523", "Origin is Unreachable"));
	Codes.Add(NewHTTPCode(524, "TimeWaitExpired_524", "A Timeout Occurred"));
	Codes.Add(NewHTTPCode(525, "HandshakeSSNotSucceeded_525", "SSL Handshake Failed"));
	Codes.Add(NewHTTPCode(526, "InvalidCertificateSSL_526", "Invalid SSL Certificate"));

	Return Codes;

EndFunction

Function NewHTTPCode(Code, Key_, Description)

	Return New Structure("Code, Key, Description", Code, Key_, Description);

EndFunction

Function IsCodeStatusOnWhichMustConsiderHeaderRetryAfter(StatusCode)

	Codes = HTTPStatusCodes();
	Return StatusCode = Codes.PayloadPayloadTooLarge_413
		Or StatusCode = Codes.TooManyRequests_429
		Or StatusCode = Codes.ServiceUnavailable_503;

EndFunction

#EndRegion

#Region Other

Function DefineHashFunction(Val Algorithm)

	Algorithm = Upper(Algorithm);
	If Not ValueIsFilled(Algorithm) Or Algorithm = "MD5" Or Algorithm = "MD5-SESS" Then
		AlgorithmHashing = HashFunction.MD5;
	ElsIf Algorithm = "SHA" Then
		AlgorithmHashing = HashFunction.SHA1;
	ElsIf Algorithm = "SHA-256" Then
		AlgorithmHashing = HashFunction.SHA256;
	Else
		AlgorithmHashing = Undefined;
	EndIf;

	Return AlgorithmHashing;

EndFunction

Function DataHashing(Val Algorithm, Val Data)

	If TypeOf(Data) = Type("String") Then
		Data = GetBinaryDataFromString(Data, TextEncoding.UTF8, False);
	ElsIf Data = Undefined Then
		Data = GetBinaryDataFromString("", TextEncoding.UTF8, False);
	EndIf;

	Hashing = New DataHashing(Algorithm);
	Hashing.Append(Data);

	Return Lower(GetHexStringFromBinaryData(Hashing.HashSum));

EndFunction

Procedure Pause(DurationStopInSeconds)

	// Someday the platform will implement pause and this can be removed

	If DurationStopInSeconds < 1 Then
		Return;
	EndIf;

	CurrentDate = CurrentUniversalDate();
	WaitUntil = CurrentDate + DurationStopInSeconds;

	// BSLLS:UsingHardcodeNetworkAddress-off
	LocalHost = "127.0.0.0";
	WhichSomeFreePort = 56476;
	// BSLLS:UsingHardcodeNetworkAddress-on
	While CurrentDate < WaitUntil Do
		Timeout = WaitUntil - CurrentDate;
		Start = CurrentUniversalDateInMilliseconds();
		Try
			Connection = New HTTPConnection(
				LocalHost, WhichSomeFreePort, Undefined, Undefined, New InternetProxy(False), Timeout);
			Connection.Get(New HTTPRequest("/does_not_matter"));
		Except
			RealTimeout = CurrentUniversalDateInMilliseconds() - Start;
		EndTry;
		MinTimeoutInMilliseconds = 1000;
		If RealTimeout < MinTimeoutInMilliseconds Then
			Raise(NStr("en = 'Pause procedure does not work as expected'"));
		EndIf;
		CurrentDate = CurrentUniversalDate();
	EndDo;

EndProcedure

Function CalculateDurationPause(Retry, ExponentialDelayRatio, RetryAfterHeader, Remainder)

	If RetryAfterHeader <> False Then
		Duration = NumberFromString(RetryAfterHeader);

		If Duration = 0 Then
			Date = DateFromStringRFC7231(RetryAfterHeader);
			If ValueIsFilled(Date) Then
				Duration = Date - CurrentUniversalDate();
			EndIf;
			
			If Duration <= 0 Then
				Duration = 1;
			EndIf
		EndIf;
	Else
		Duration = ExponentialDelayRatio * Pow(2, Retry - 1);
	EndIf;

	Duration = Min(Duration, Remainder);

	If Duration < 0 Then
		Duration = 0;
	EndIf;

	Return Duration;

EndFunction

#EndRegion

#Region UniversalStructureData

Function SelectValue(MainValue, AdditionalValues, Key_, ValueByDefault)

	If MainValue <> Undefined Then
		Return MainValue;
	EndIf;

	Value = ValueByKey(AdditionalValues, Key_);
	If Value <> Undefined Then
		Return Value;
	EndIf;

	Return ValueByDefault;

EndFunction

Function ValueByKey(Structure, Key_, ValueByDefault = Undefined)

	If TypeOf(Structure) = Type("Structure") And Structure.Property(Key_) Then
		Value = Structure[Key_];
	ElsIf TypeOf(Structure) = Type("Map") And Structure.Get(Key_) <> Undefined Then
		Value = Structure.Get(Key_);
	Else
		Value = ValueByDefault;
	EndIf;

	Return Value;

EndFunction

#EndRegion

#Region WorkWithLines

Function NumberFromString(Val String) Export

	DescriptionType = New TypeDescription("Number");
	Return DescriptionType.AdjustValue(String);

EndFunction

Function DateFromString(Val String) Export

	QualifierDate = New DateQualifiers(DateFractions.DateTime);
	DescriptionType = New TypeDescription("Date", Undefined, Undefined, QualifierDate);
	Return DescriptionType.AdjustValue(String);

EndFunction

Function DateFromStringRFC7231(Val String) Export

	Separators = ",-:/\.";
	For Index = 1 To StrLen(Separators) Do
		Separator = Mid(Separators, Index, 1);
		String = StrReplace(String, Separator, " ");
	EndDo;
	String = StrReplace(String, "  ", " ");
	ComponentsDate = StrSplit(String, " ");
	
	If ComponentsDate.Count() < 7 Then
		Return '00010101';
	EndIf;
	
	MonthStr = ComponentsDate[2];

	Months = StrSplit("Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec", ",");
	Month = Months.Find(MonthStr);
	If Month = Undefined Then
		Return '00010101';
	EndIf;
	
	LengthYear = StrLen(ComponentsDate[3]);
	Year = ?(LengthYear = 2, "20", "") + ComponentsDate[3];

	Date = Year + Format(Month + 1, "ND=2; NLZ=;") + ComponentsDate[1];
	Time = ComponentsDate[4] + ComponentsDate[5] + ComponentsDate[6];

	Return DateFromString(Date + Time);

EndFunction

Procedure SplitStringByDelimiter(ExtractedPart, RestPart, Separator, Inversion = False)

	Index = StrFind(RestPart, Separator);
	If Index Then
		ExtractedPart = Left(RestPart, Index - 1);
		RestPart = Mid(RestPart, Index + StrLen(Separator));
		If Inversion Then
			ForExchange = ExtractedPart;
			ExtractedPart = RestPart;
			RestPart = ForExchange;
		EndIf;
	EndIf;

EndProcedure

Function SplitByFirstFoundSeparator(String, Separators)

	MinIndex = StrLen(String);
	FirstSeparator = "";

	For Each Separator In Separators Do
		Index = StrFind(String, Separator);
		If Index = 0 Then
			Continue;
		EndIf;
		If Index < MinIndex Then
			MinIndex = Index;
			FirstSeparator = Separator;
		EndIf;
	EndDo;

	Result = New Array;
	If ValueIsFilled(FirstSeparator) Then
		Result.Add(Left(String, MinIndex - 1));
		Result.Add(Mid(String, MinIndex + StrLen(FirstSeparator)));
		Result.Add(FirstSeparator);
	Else
		Result.Add(String);
		Result.Add("");
		Result.Add(Undefined);
	EndIf;

	Return Result;

EndFunction

Function SplitStringByString(Val String, Separator)

	Result = New Array;
	While True Do
		Position = StrFind(String, Separator);
		If Position = 0 And ValueIsFilled(String) Then
			Result.Add(String);
			Break;
		EndIf;

		FirstPart = Left(String, Position - StrLen(Separator) + 1);
		Result.Add(FirstPart);
		String = Mid(String, Position + StrLen(Separator));
	EndDo;

	Return Result;

EndFunction

Function AddLeadingDot(Val Domain)

	If Not StrStartWith(Domain, ".") Then
		Domain = "." + Domain;
	EndIf;

	Return Domain;

EndFunction

Function CutText(Text, MaxLengthText = 1000)
	
	If FindDisallowedXMLCharacters(Text) Then
		Return NStr("en = '<Data>'");
	EndIf;
	
	If StrLen(Text) <= MaxLengthText Then
		Result = Text;
	Else
		HalfMaxLengthText = MaxLengthText / 2;
		Result = Left(Text, HalfMaxLengthText);
		Result = Result + Chars.LF + "..." + Chars.LF;
		Result = Result + Right(Text, HalfMaxLengthText);
	EndIf;
	
	Return Result;
	
EndFunction

Function Merge(MainSource, AdditionalSource)

	Result = MainSource;
	Supplement(MainSource, AdditionalSource);
	Return Result;

EndFunction

Function Copy(Source)

	#If MobileAppServer Then
		ConversionParameters = Undefined;
		If TypeOf(Source) =  Type("Structure") Then
			ConversionParameters = New Structure("ReadToMap", False);	
		EndIf;
		Return JsonToObject(ObjectToJson(Source),, ConversionParameters);
	#Else
		Return ValueFromStringInternal(ValueToStringInternal(Source));
	#EndIf

EndFunction

Procedure Supplement(Receiver, Source)
	
	If Source = Undefined Then
		Return;
	EndIf;
	
	For Each ElementSource In Source Do
		ParameterFound = False;
		
		If TypeOf(Receiver) = Type("Map") Then
			ParameterFound = Receiver.Get(ElementSource.Key) <> Undefined;
		EndIf;
		
		If TypeOf(Receiver) = Type("Structure") Then
			ParameterFound = Receiver.Property(ElementSource.Key);
		EndIf;
		
		If Not ParameterFound Or ParameterFound And ElementSource.Value <> Undefined Then
			Receiver.Insert(ElementSource.Key, ElementSource.Value);
		EndIf;
	EndDo;
		
EndProcedure

#EndRegion

#EndRegion