#Region ОбработчикиСобытийФормы

&AtServer
Procedure OnCreateAtServer(Cancel, StandardProcessing)

	ЗаполнитьСписокТестов();

EndProcedure

&AtServer
Procedure OnLoadDataFromSettingsAtServer(Settings)

	ЗаполнитьСписокТестов();

EndProcedure

#EndRegion

#Region ОбработчикиСобытийЭлементовШапкиФормы

&AtClient
Procedure ТестироватьСоединениеЧерезПроксиOnChange(Item)
	ТестироватьСоединениеЧерезПроксиПриИзмененииНаСервере();
EndProcedure

&AtClient
Procedure ТестироватьПолучениеСпискаРелизовВСайта1СOnChange(Item)
	ТестироватьПолучениеСпискаРелизовВСайта1СПриИзмененииНаСервере();
EndProcedure

&AtClient
Procedure ТестироватьАутентификациюAWS4_HMAC_SHA256OnChange(Item)
	ТестироватьАутентификациюAWS4_HMAC_SHA256ПриИзмененииНаСервере();
EndProcedure

&AtClient
Procedure ТестироватьПовторыOnChange(Item)
	ТестироватьПовторыПриИзмененииНаСервере();
EndProcedure

#EndRegion

#Region ОбработчикиКомандФормы

&AtClient
Procedure ВыполнитьТесты(Command)
	
	ВыполнитьТестыНаСервере();
	
EndProcedure

&AtClient
Procedure УстановитьФлажки(Command)
	
	For Each СтрокаТаблицы In Тесты Do
		СтрокаТаблицы.Использование = True;
	EndDo;
	
EndProcedure

&AtClient
Procedure СнятьФлажки(Command)
	
	For Each СтрокаТаблицы In Тесты Do
		СтрокаТаблицы.Использование = False;
	EndDo;
	
EndProcedure

#EndRegion

#Region СлужебныеПроцедурыИФункции

&AtServer
Procedure ЗаполнитьСписокТестов()
	
	Тесты.Clear();
	For Each Тест In FormAttributeToValue("Объект").ПолучитьСписокТестов() Do
		НоваяСтрока = Тесты.Add();
		НоваяСтрока.Использование = True;
		НоваяСтрока.Тест = Тест;
	EndDo;
	КоличествоТестов = Тесты.Count();

EndProcedure

&AtServer
Procedure ТестироватьСоединениеЧерезПроксиПриИзмененииНаСервере()
	
	ЗаполнитьСписокТестов();
	
EndProcedure

&AtServer
Procedure ТестироватьПолучениеСпискаРелизовВСайта1СПриИзмененииНаСервере()

	ЗаполнитьСписокТестов();

EndProcedure

&AtServer
Procedure ТестироватьАутентификациюAWS4_HMAC_SHA256ПриИзмененииНаСервере()

	ЗаполнитьСписокТестов();

EndProcedure

&AtServer
Procedure ТестироватьПовторыПриИзмененииНаСервере()

	ЗаполнитьСписокТестов();

EndProcedure

&AtServer
Procedure ВыполнитьТестыНаСервере()
	
	If CheckFilling() Then
		РезультатаВыполнения = FormAttributeToValue("Объект").ВыполнитьТестыНаСервере(FormAttributeToValue("Тесты"));
		ValueToFormAttribute(РезультатаВыполнения, "Тесты");
	EndIf;
	
EndProcedure

#EndRegion
