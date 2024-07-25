﻿#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ПрограммныйИнтерфейс 

//Производит инициализацию построителя HTTP запросов
//
// Параметры:
//  ПараметрыИнициализации  - Струткура - структура с параметрами которые надо установить при инициализации
//    *URL - URL сервиса к которому нужно послать запрос
//    *Метод - HTTP метод который будет отправляться
//
Процедура Инициализировать(ПараметрыИнициализации) Экспорт 
	
	URL = ПараметрыИнициализации.URL;
	Метод = ПараметрыИнициализации.Метод;
	ДополнительныеПараметры = КоннекторHTTP.НовыеПараметры();
	Парамтеры = Новый Соответствие;
	
КонецПроцедуры

//Выполняет http запрос с параметрами установленными в построителе
//
// Возвращаемое значение:
//   HTTPОтвет   - Объект содержащий ответ на http запрос
//
Функция ВыполнитьЗапрос() Экспорт
	
	Если Метод = "GET" Тогда
		Ответ = КоннекторHTTP.Get(URL, Параметры, ДополнительныеПараметры, Сессия);
	Иначе
		ВызватьИсключение НСтр("ru='Метод не поддерживается.'", "ru");
	КонецЕсли;
	
	Результат = Обработки.HTTPОтвет.Создать();
	Результат.Инициализировать(Ответ);
	
	Возврат Результат;
	
КонецФункции

//Добавляет новый заголовок запроса или изменяет существующий
//
// Параметры:
//  Ключ  - Строка - Имя заголовка
//  Значение  - Строка - Значение передаваемое в заголовке
//
// Возвращаемое значение:
//   ПостроительHTTPЗапроса   - построитель с установленной аутентификацией
//
Функция УстановитьЗаголовок(Ключ, Значение) Экспорт
	
	ДополнительныеПараметры.Заголовки.Вставить(Ключ, Значение);
	
	Возврат ЭтотОбъект;
	
КонецФункции

Функция УстановитьПараметрЗапроса(Ключ, Значение)
	
	Параметры.Вставить(Ключ, Значение);
	
	Возврат ЭтотОбъект;
	
КонецФункции

#Область Аутентификация 

//Устанавливает Digest аутентификацию
//
// Параметры:
//  Пользователь  - Строка - имя пользователя используемое для аутентификации
//  Пароль  - Строка - пароль для аутентификации
//
// Возвращаемое значение:
//   ПостроительHTTPЗапроса   - построитель с установленной аутентификацией
//
Функция УстановитьАутентификациюDigest(Пользователь = "", Пароль = "") Экспорт
	
	Параметры.Аутентификация = КоннекторHTTP.НоваяАутентификацияDigest(Пользователь, Пароль);
	
	Возврат ЭтотОбъект; 
	
КонецФункции

//Устанавливает Basic аутентификацию
//
// Параметры:
//  Пользователь  - Строка - имя пользователя используемое для аутентификации
//  Пароль  - Строка - пароль для аутентификации
//
// Возвращаемое значение:
//   ПостроительHTTPЗапроса   - построитель с установленной аутентификацией
//
Функция УстановитьАутентификациюBasic(Пользователь = "", Пароль = "") Экспорт
	
	ДополнительныеПараметры.Аутентификация = КоннекторHTTP.НоваяАутентификацияBasic(Пользователь, Пароль);
	
	Возврат ЭтотОбъект;
	
КонецФункции 

//Устанавливает аутентификацию AWS4-HMAC-SHA256
//
// Возвращаемое значение:
//   ПостроительHTTPЗапроса   - построитель с установленной аутентификацией
//
Функция УстановитьАутентификациюAWS4(КлючДоступа = "", СекретныйКлюч = "", Сервис = "", Регион = "") Экспорт
	
	ДополнительныеПараметры.Аутентификация = КоннекторHTTP.НоваяАутентификацияAWS4(КлючДоступа = "", СекретныйКлюч = "", Сервис = "", Регион = "");
	
	Возврат ЭтотОбъект;
	
КонецФункции

//Устанавливает аутентификацию операционной системы
//
// Возвращаемое значение:
//   ПостроительHTTPЗапроса   - построитель с установленной аутентификацией
//
Функция УстановитьАутентификациюОС() Экспорт
	
	ДополнительныеПараметры.Аутентификация = КоннекторHTTP.НоваяАутентификацияОС();
	
	Возврат ЭтотОбъект;
	
КонецФункции

#КонецОбласти
#КонецОбласти

#КонецЕсли
