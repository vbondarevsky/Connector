Publication on [Infostart](https://infostart.ru/public/709325/)


[![Quality Gate Status](https://sonar.openbsl.ru/api/project_badges/measure?project=connector_en&metric=alert_status)](https://sonar.openbsl.ru/dashboard?id=connector_en)
[![Stars](https://img.shields.io/github/stars/vbondarevsky/Connector.svg?label=Github%20%E2%98%85&a)](https://github.com/vbondarevsky/Connector/stargazers)
[![Release](https://img.shields.io/github/tag/vbondarevsky/Connector.svg?label=Last%20release&a)](https://github.com/vbondarevsky/Connector/releases)

# Connector: handy HTTP-client for 1C:Enterprise 8 platform
Python world has a very popular library working with HTTP requests - [Requests](http://docs.python-requests.org/en/master) (author: Kenneth Reitz).
The library allows you to send HTTP requests extremely easily. 
Literally a single line of your code can receive or send data, not caring about making URL, encoding data etc. 

**Connector** is "Requests" for 1C world.

The original of the library in Russian is [here](./README.md)

## Features
Main library features:
- Passing parameters in URLs
- Working with requests and responses in `JSON` format
- Submitting form data (form fields), `application/x-www-form-urlencoded`
- Submitting form data (form fields and files), `multipart/form-data`
- `GZip` compressed response support
- `GZip` request body compression
- `Basic`, `Digest` and `AWS4-HMAC-SHA256` authentification
- Auto resolution of redirections
- Cookies setting and getting
- Session with state persistance across requests (cookies, authentification и пр.)
- Reusing `HTTPConnection` in the session
- Configurable retries of connection/sending request with exponential latency
- Mobile platform support
- And much more

## Requirements
- 1C:Enterprise platform version **8.3.10** and higher.
- Mobile platform (tested version **8.3.15** only)

## How to use
To use the library in your code simply copy the `HTTPConnector` common module to your configuration.

## Library's power example
*What is so good about the library? Let’s show you an example.*

Let's get `JSON` data using `GET` request:

This is how it's done using built-in programming language
```bsl
SecureConnection = New OpenSSLSecureConnection(Undefined, New OSCertificationAuthorityCertificates);
Connection = New HTTPConnection("api.github.com", 443,,,, 30, SecureConnection);	
Query = New HTTPRequest("/events");
Response = Connection.Get(Query);
Stream = Response.GetBodyAsStream();
Encoding = "utf-8"; // suppose we know that there is such encoding

Reader = New JSONReader;
Reader.OpenStream(Stream, Encoding); // Encoding in response header
Result = ReadJSON(Reader);
Reader.Close();
```

This is how it's done using **Connector**
```bsl
Result = HTTPConnector.GetJson("https://api.github.com/events");
```

That's all! You will get in `Result` a deserialized server response from `JSON`. 
At the same time:
- Connector parsed the URL
- Established secured connection 
- Defined response encoding from headers
- Deserialized `JSON`
 
And this is a simple example enough. All the library's power follows further.

## Passing parameters in URLs
Working with request parameters is very easy:
```bsl
RequestParameters = New Structure;
RequestParameters.Insert("name", StrSplit("John,Doe", ","));
RequestParameters.Insert("salary", Format(100000, "ЧГ="));

Response = HTTPConnector.GetJson("https://httpbin.org/anything/params", RequestParameters);	
```

You can also pass an `Array` of values for a parameter (see. `name`).

Request parameters can be set:
- In URL by hand
- In `RequestParameters` parameter
- Combined both

The result will be the same:
- Connector will add parameters as key/value pairs in the URL after a question mark
- Encode URL, using `URLEncoding`
- Execute request

You can see that the URL has been correctly encoded by checking the reponse property `URL`
```bsl
Response = HTTPConnector.Get("https://httpbin.org/anything/params", RequestParameters);
```
`Response.URL` - https://httpbin.org/anything/params?name=%D0%98%D0%B2%D0%B0%D0%BD%D0%BE%D0%B2&name=%D0%9F%D0%B5%D1%82%D1%80%D0%BE%D0%B2&salary=100000

## Custom HTTP headers
In the main scenarios of using the library, headers are generated automatically.
Custom headers can be set using `AdditionalParameters` parameter, property `Headers`.
```bsl
Headers = New Map;
Headers.Insert("X-My-Header", "Hello!!!");
Result = HTTPConnector.GetJson("http://httpbin.org/headers", Undefined, New Structure("Headers", Headers));
```

## Working with JSON
To make it easier to work with JSON, there are methods: 
`GetJson`, `PostJson`, `PutJson`, `DeleteJson`.
Requests are sent in JSON format, responses are converted into `Map`/`Structure` from JSON. 
```bsl
Result = HTTPConnector.GetJson("http://httpbin.org/get");
Result = HTTPConnector.PostJson("http://httpbin.org/post", New Structure("Title", "HTTPConnector"));
Result = HTTPConnector.PutJson("http://httpbin.org/put", New Structure("Title", "HTTPConnector"));
Result = HTTPConnector.DeleteJson("http://httpbin.org/delete", New Structure("Title", "HTTPConnector"));
```

Serialization to JSON and deserialization from JSON are configured in parameters of `AdditionalParameters.JSONConversionParameters`.

## Submitting form data
Submitting form data is easy.
We transfer (`Structure` or `Map`) in `POST` method and that's all. 
```bsl
Data = New Structure;
Data.Insert("comments", "Knock to the door");
Data.Insert("custemail", "vasya@mail.ru");
Data.Insert("custname", "Вася");
Data.Insert("custtel", "112");
Data.Insert("delivery", "20:20");
Data.Insert("size", "medium");
Data.Insert("topping", StrSplit("bacon,mushroom", ","));

Response = HTTPConnector.Post("http://httpbin.org/post", Data);
```

The `Data` will be encoded, `Content-Type` header value will be set to `application/x-www-form-urlencoded`.

## Submitting file
To send a file you should create its description and put it to `AdditionalParameters.Files` parameter.
```bsl
Files = New Structure;
Files.Insert("Name", "f1");
Files.Insert("FileName", "file1.txt");
Files.Insert("Data", Base64Value("0J/RgNC40LLQtdGCINCc0LjRgCE="));
Files.Insert("Type", "text/plain");

Result = HTTPConnector.Post("https://httpbin.org/post", Undefined, New Structure("Files", Files));
```

The file will be encoded in a request body, `Content-Type` header value will be set to `multipart/form-data`.

## Submitting files and form data
For submitting form data and files in a single request you should create a description of files and from data and transfer them to `AdditionalParameters.Files`, `AdditionalParameters.Data` parameters.
```bsl
Files = New Array;
Files.Add(New Structure("Name,Data,FileName", "f1", Base64Value("ZmlsZTE="), "file1.txt"));
Files.Add(New Structure("Name,Data,FileName", "f2", Base64Value("ZmlsZTI="), "file2.txt"));

Data = New Structure("field1,field2", "value1", "Значение2");

Result = HTTPConnector.Post("https://httpbin.org/post", Undefined, New Structure("Files,Data", Files, Data));
```

Files and form data will be encoded in a request body, `Content-Type` header value will be set to `multipart/form-data`.

## Sending arbitrary data
Arbitrary data (`String`, `BinaryData`) should be put to `Data` parameter.
```bsl
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
```

## Response content
Methods that do not end with Json, return response as `Structure`:
- `ExecutionTime` - Number - execution response duration in milliseconds
- `Cookies` - cookies received from host
- `Headers` - HTTP response headers
- `IsPermanentRedirect` - permanent redirect flag
- `IsRedirect` - redirect flag
- `Encoding` - response text encoding
- `Body` - response body
- `StatusCode` - response status code
- `URL` - final request URL

You can get the data from the response in JSON, text or binary data using methods described below.

### Reading response as JSON
Method `AsJson` returns deserialized JSON data of a response.
```bsl
Result = HTTPConnector.AsJson(HTTPConnector.Get("http://httpbin.org/get"));
```

### Reading response as Text
Method `AsText` returns response data as text.
```bsl
Result = HTTPConnector.AsText(HTTPConnector.Get("http://httpbin.org/encoding/utf8"));
```
You can set the encoding as an argument. 
If the encoding argument is undefined, **Connector** will get its value from response headers.
 
### Reading response as BinaryData
Method `AsBinaryData` converts response into `BinaryData`.
```bsl
Result = HTTPConnector.AsBinaryData(HTTPConnector.Get("http://httpbin.org/image/png"));
```

### Reading XML response as XDTO 
Method `КакXDTO` converts XML response into `XDTOObject`.
```bsl
Result = HTTPConnector.КакXDTO(Response);
```

## Request body GZip-encoding
**Connector** can automatically compress the request body into `GZip`.
To do this you should add the header `Content-Encoding` = `gzip`.

**Note**: the server must be configured appropriately to decompress incoming requests.

```bsl
Json = New Structure;
Json.Insert("field", "value");
Json.Insert("field2", "value2");
Headers = New Map;
Headers.Insert("Content-Encoding", "gzip");
Result = HTTPConnector.PostJson("http://httpbin.org/anything", Json, New Structure("Headers", Headers));
```

## Response body GZip-decoding
**Connector** by default asks the host to encode responses into `GZip` format.

**Note**: any response body encoding can be turned off by setting the header `Accept-Encoding` = `identity`.

Decoding is perfomed in methods `GetJson`, `PostJson`, `PutJson`, `DeleteJson`, `AsJson`, `AsText`, `AsBinaryData`.
```bsl
Result = HTTPConnector.GetJson("http://httpbin.org/gzip");
```

## Timeout
Timeout can be set in `AdditionalParameters.Timeout` parameter.
```bsl
Response = HTTPConnector.Get("https://httpbin.org/delay/10", Undefined, New Structure("Timeout", 1));
```
Value by default - 30 sec.

## Basic-authentification
Basic-authentification parameters can be set in `AdditionalParameters.authentification` parameter.
```bsl
Authentication = New Structure("User, Password", "user", "pass");
Result = HTTPConnector.GetJson(
    "https://httpbin.org/basic-auth/user/pass",
    Undefined,
    New Structure("Authentication", Authentication));
```
or in `URL`
```bsl
Result = HTTPConnector.GetJson("https://user:pass@httpbin.org/basic-auth/user/pass");
```

## Digest-authentification
Digest-authentification parameters can be set in `AdditionalParameters.authentification` parameter.
In this case `Type` must be set to the value `Digest`.
```bsl
Authentication = New Structure("User, Password, Type", "user", "pass", "Digest");
Result = HTTPConnector.GetJson(
    "https://httpbin.org/digest-auth/auth/user/pass",
    Undefined,
    New Structure("Authentication", Authentication));
```

## AWS4-HMAC-SHA256-authentification
AWS4-HMAC-SHA256-authentification parameters can be set in `AdditionalParameters.authentification` parameter.
In this case `Type` must be set to the value `AWS4-HMAC-SHA256` and properties `AccessKeyID`, `SecretKey`, `Service`, `Region` must be filled.

```bsl
Authentication = New Structure;
Authentication.Insert("Type", "AWS4-HMAC-SHA256");
Authentication.Insert("AccessKeyID", "AKIAU00002SQ4MT");
Authentication.Insert("SecretKey", "MySecretKey");
Authentication.Insert("Region", "ru-central1");
Authentication.Insert("Service", "s3");

File = New BinaryData("my_file.txt");

Headers = New Map;
Headers.Insert("Content-Type", "text/plain");
Headers.Insert("x-amz-meta-author", "Vladimir Bondarevskiy");
Headers.Insert("Expect", "100-continue");

AdditionalParameters = New Structure;
AdditionalParameters.Insert("Headers", Headers);
AdditionalParameters.Insert("Authentication", Authentication);
AdditionalParameters.Insert("Timeout", 300);
Response = HTTPConnector.Put("https://test.storage.yandexcloud.net/my_file.txt", File, AdditionalParameters);
```

## Proxies
Proxy settings can be set in the `AdditionalParameters.Proxy` parameter.
```bsl
Proxy = New InternetProxy;
Proxy.Set("http", "192.168.1.51", 8192);
Result = HTTPConnector.GetJson("http://httpbin.org/headers", Undefined, New Structure("Proxy", Proxy));
```
If your configuration based on `SSL`, proxy settings will be taken from `SSL` by default.

## Supported HTTP verbs
Such HTTP verbs as `GET`, `OPTIONS`, `HEAD`, `POST`, `PUT`, `PATCH`, `DELETE` have their corresponding methods in Connector.
You can send request for any of HTTP verbs calling `CallMethod` method.

## Redirections
**Connector** automatically allows redirections by default.
Let's try to get a search result from Yandex (http://ya.ru).
```bsl
Result = HTTPConnector.Get("http://ya.ru/", New Structure("q", "how to delete metadata cache infostart"));
```
What will happen actually while executing this code line:
- **Connector** will perform the request to URL `http://ya.ru/`
- Host will require to perform a request with `https` scheme, i.e. will return the status code `302` and the header `Location`=`https://ya.ru/?q=...`
- **Connector** will perform the redirect using `https` scheme
- Host will require to perform a request with another URL, i.e. will return the status code `302` and the header `Location`=`https://yandex.ru/search/?text=...` 
- **Connector** will perform the redirect to URL `https://yandex.ru/search/?text=...`
- Finally, the host will response with `html` result

Auto redirection can be turned off in the parameter of argument `AdditionalParameters.AllowRedirect`.

## Server SSL certificate verification
The `AdditionalParameters.VerifySSL` parameter is responsible for server SSL certificate verification and which root certificates to use.
```bsl
Result = HTTPConnector.Get("https://my_super_secret_server.ru/", New Structure("VerifySSL", False));
```

## Client certificates
Client certificate can be set in the parameter `AdditionalParameters.ClientSSLCertificate`.
```bsl
ClientSSLCertificate = New FileClientCertificate("my_cert.p12", "123");
Result = HTTPConnector.Get("https://my_super_secret_server.ru/", New Structure("ClientSSLCertificate", ClientSSLCertificate));
```

## Cookies
**Connector** extracts cookies from response headers `Set-Cookie` for future use. 
Received cookies can be found in a response property `Cookies`.

You can send custom cookies to the server using the parameter `AdditionalParameters.Cookies`.
```bsl
Cookies = New Array;
Cookies.Add(New Structure("Description,Value", "k1", String(New UUID)));
Cookies.Add(New Structure("Description,Value", "k2", String(New UUID)));
Response = HTTPConnector.Get("http://httpbin.org/cookies", Undefined, New Structure("Cookies", Cookies));
```

## Session object
**Connector** allows you to persist certain parameters across requests using Session object.
For this you need:
- To create a `Session` object with `NewSession` method
- To use the created `Session` object in every request method

For example, let's try to get a list of updates from the releases.1c.ru website.
```bsl
Session = HTTPConnector.NewSession();
Response = HTTPConnector.Get("https://releases.1c.ru/total", Undefined, Undefined, Session);

Data = New Structure;
Data.Insert("execution", ExtractExecution(Response));
Data.Insert("username", Login);
Data.Insert("password", Password);
Data.Insert("_eventId", "submit");
Data.Insert("geolocation", "");
Data.Insert("submit", "Login");
Data.Insert("rememberMe", "on");

Response = HTTPConnector.Post(Response.URL, Data, Undefined, Session);
```

What will happen:
- **Connector** will perform `GET` request to URL `https://releases.1c.ru/total`
- Host will require to perform request to URL `https://login.1c.ru/login?service=https%3A%2F%2Freleases.1c.ru%2Fpublic%2Fsecurity_check`
- **Connector** will save received cookies and perform `GET` request to URL `https://releases.1c.ru/total`
- Host will return the authorization form
- We will extract the data from the form and send them to the host together with our login and password
- **Connector** will perform `POST` request and send the form data with previously received cookies
- Host will verify form parameters and if everything is ok issue a ticket and require to perform the request to `https://releases.1c.ru/total`
- **Connector** will perform `GET` request to URL `https://releases.1c.ru/total` and transfer previously received cookies
- Host will response with `html` result

Then using `Session` you can make requests to the server and download updates.

## Retry attempts of connection/sending request
**Connector** can automatically retry connection/request sending attempts with delay.
This is useful if:
- Connection is unstable
- Host is overloaded and returns 500th codes
- Host is under maintenance (reboot, configs change, update etc)
- Host limits the number of requests from the client

You can enable retries using the parameter `AdditionalParameters.MaximumNumberOfRetries`, setting a value > 0.

Parameter `AdditionalParameters.MaximumTimeOfRetries` allows you to limit the total time (timeouts + delays between retries).
Value by default: 10 min.

Delay duration between attempts:
- Grows exponentially (1 sec, 2 sec, 4 sec, 8 sec, 16 sec, ...). Can be adjusted by the parameter 
`AdditionalParameters.ExponentialDelayRatio`
- For staus codes `413`, `429` or `503` delay duration value is taken from the header `Retry-After` (duration in seconds or the exact date).

The parameter `AdditionalParameters.ToRetryForStatusesCodes` allows to set status codes, for which retry attempt should be run.
If this parameter is empty, retry attempt will run for all status codes >=`500`.

```bsl
AdditionalParameters = New Structure;
AdditionalParameters.Insert("MaximumNumberOfRetries", 5);
AdditionalParameters.Insert("Headers", Headers);
    
URL = "http://127.0.0.1:5000/retry_after_date";
Response = HTTPConnector.Get(URL, Undefined, AdditionalParameters);
```
