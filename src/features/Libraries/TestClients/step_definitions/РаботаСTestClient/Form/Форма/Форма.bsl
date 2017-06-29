﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;

&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;

&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
Перем МаксКоличествоСекундПодключения,ТекКоличествоСекундПодключения;

// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
&НаКлиенте
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПодключаюКлиентТестированияИзТаблицыКлиентовТестирования(ИмяКлиентаТестирования)","ЯПодключаюКлиентТестированияИзТаблицыКлиентовТестирования","И Я подключаю клиент тестирования ""ИмяКлиентаТестирования"" из таблицы клиентов тестирования",, "Подключение TestClient.Работа с подключенными TestClient");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПодключаюКлиентТестированияИзТаблицыКлиентовТестированияОтИмениСПаролем(ИмяКлиентаТестирования,Логин,Пароль)","ЯПодключаюКлиентТестированияИзТаблицыКлиентовТестированияОтИмениСПаролем","Когда Я подключаю клиент тестирования ""ИмяКлиентаТестирования"" из таблицы клиентов тестирования от имени ""Логин"" с паролем ""Пароль""",, "Подключение TestClient.Работа с подключенными TestClient");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПодключаюКлиентТестированияСПараметрами(ТабПарам)","ЯПодключаюКлиентТестированияСПараметрами",
		"Когда Я подключаю клиент тестирования с параметрами:
     	|    | 'Имя подключения' | 'Порт' | 'Строка соединения'                 | 'Логин' | 'Пароль' | 'Запускаемая обработка' |  'Дополнительные параметры строки запуска'  |
     	|    | 'Test 1'          | '1538' | 'Srvr=""localhost:1941"";Ref=""Test"";' | 'Админ' | 'Админ'  | 'c:\СуперОбработка.epf' |  '/UC'                                      |"
		,, "Подключение TestClient.Работа с подключенными TestClient");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗакрываюСеансTESTCLIENT()","ЯЗакрываюСеансTESTCLIENT","И я закрываю сеанс TESTCLIENT");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПодключаюTestClientЛогинПароль(Парам01,Парам02,Парам03)","ЯПодключаюTestClientЛогинПароль","И я подключаю TestClient ""Кладовщик"" логин ""Пользователь1"" пароль ""1""","Позволяет подключить TestClient с нужным логином и паролем в тойже базе, в которой запущен TestManager","Подключение TestClient.Новое подключение к той же базе, где запущен TestManager");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯАктивизируюTestClient(Парам01)","ЯАктивизируюTestClient","И я активизирую TestClient ""Кладовщик""","Позволяет переключить контекст на нужный TestClient","Подключение TestClient.Работа с подключенными TestClient");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗакрываюTestClient(Парам01)","ЯЗакрываюTestClient","И я закрываю TestClient ""Кладовщик""","Закрывает указанный TestClient Перед этим закрывает все окна в нём.","Подключение TestClient.Работа с подключенными TestClient");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПодключаюПрофильTestClient(Парам01)","ЯПодключаюПрофильTestClient","И я подключаю профиль TestClient ""Оператор""","Позволяет подключить TestClient по имени уже существующего профиля","Подключение TestClient.Работа с подключенными TestClient");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрылНовыйСеансTestClientИлиПодключилУжеСуществующий()","ЯОткрылНовыйСеансTestClientИлиПодключилУжеСуществующий","Дано Я открыл новый сеанс TestClient или подключил уже существующий");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрылНовыйСеансTestClientИлиПодключилУжеСуществующийБезЗагрузкиНастроек()","ЯОткрылНовыйСеансTestClientИлиПодключилУжеСуществующийБезЗагрузкиНастроек","Дано Я открыл новый сеанс TestClient или подключил уже существующий без загрузки настроек");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрылСеансTestClientОтИмениСПаролемИлиПодключаюУжеСуществующий(Логин,Пароль)","ЯОткрылСеансTestClientОтИмениСПаролемИлиПодключаюУжеСуществующий","Дано Я открыл сеанс TestClient от имени ""МойПользователь"" с паролем ""МойПароль"" или подключаю уже существующий","Позволяет подключить TestClient с нужным логином и паролем в тойже базе, в которой запущен TestManager","Подключение TestClient.Новое подключение к той же базе, где запущен TestManager");

	
	
	Возврат ВсеТесты;
КонецФункции

&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции

&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры

///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//И Я подключаю клиент тестирования "ИмяКлиентаТестирования" из таблицы клиентов тестирования
//@ЯПодключаюКлиентТестированияИзТаблицыКлиентовТестирования(ИмяКлиентаТестирования)
Процедура ЯПодключаюКлиентТестированияИзТаблицыКлиентовТестирования(ИмяКлиентаТестирования) Экспорт

	Если ИмяКлиентаТестирования = "" Тогда
		ИмяКлиентаТестирования = "Этот клиент";
	КонецЕсли;
	
	ПодключитьTestClientИзТаблицыКлиентовТестирования(ИмяКлиентаТестирования);
	//Если НЕ ПодключитьTestClientИзТаблицыКлиентовТестирования(ИмяКлиентаТестирования) Тогда
	//	ВызватьИсключение "Не смог подключить TestClient!";
	//КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Функция ПодключитьTestClientИзТаблицыКлиентовТестирования(ИмяTestClient, Знач Логин = "", Знач Пароль = "")

	ДопПараметры = "";
	Если ЗначениеЗаполнено(Логин) Тогда
		ДопПараметры = ДопПараметры + "/N""" + Логин + """ ";
	КонецЕсли;
	Если ЗначениеЗаполнено(Пароль) Тогда
		ДопПараметры = ДопПараметры + "/P""" + Пароль + """ ";
	КонецЕсли;
	
	СтрокаОшибки = "";
	ЕстьПодключение = Ванесса.ПолучитьКлиентаТестирования(ИмяTestClient, ДопПараметры,СтрокаОшибки);
	Если Не ЕстьПодключение Тогда
		ВызватьИсключение "Не удалось подключить клиент тестирования. " + СтрокаОшибки;
	КонецЕсли;
	
	Возврат Истина;

КонецФункции

&НаКлиенте
Процедура УдалитьЭлементПодключенныеTestClient(ПодключенныеTestClient,ИмяTestClient)
	Если ПодключенныеTestClient = Неопределено Тогда
		Возврат;
	КонецЕсли;	 
	
	Для Ккк = 0 По ПодключенныеTestClient.Количество()-1 Цикл
		Если ПодключенныеTestClient[Ккк].Имя = ИмяTestClient Тогда
			ПодключенныеTestClient.Удалить(Ккк);
			Прервать;
		КонецЕсли;	 
	КонецЦикла;	
КонецПроцедуры

&НаКлиенте
//Когда Я подключаю клиент тестирования "ИмяКлиентаТестирования" из таблицы клиентов тестирования от имени "Логин" с паролем "Пароль"
//@ЯПодключаюКлиентТестированияИзТаблицыКлиентовТестированияОтИмениСПаролем(ИмяКлиентаТестирования,Логин,Пароль)
Процедура ЯПодключаюКлиентТестированияИзТаблицыКлиентовТестированияОтИмениСПаролем(ИмяКлиентаТестирования, Знач Логин = "", Знач Пароль = "") Экспорт
	
	Если Не ЗначениеЗаполнено(ИмяКлиентаТестирования) Тогда
		ИмяКлиентаТестирования = "Этот клиент";
	КонецЕсли;
	
	Логин = СокрЛП(Логин);
	Пароль = СокрЛП(Пароль);
	
	Если НЕ ПодключитьTestClientИзТаблицыКлиентовТестирования(ИмяКлиентаТестирования, Логин, Пароль) Тогда
		ВызватьИсключение "Не смог подключить TestClient!";
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
//Когда Я подключаю клиент тестирования с параметрами:
//@ЯПодключаюКлиентТестированияСПараметрами(ТабПарам)
Процедура ЯПодключаюКлиентТестированияСПараметрами(ТабПарам) Экспорт

	Если ТабПарам.Количество() <> 2 Тогда
		ВызватьИсключение "Должно быть передано 2 строки";
	КонецЕсли;
	ИмяКлиентаТестирования = ПолучитьПараметрыПодключения(ТабПарам);

	//Ванесса.Шаг("И Я подключаю клиент тестирования """+ИмяКлиентаТестирования+""" из таблицы клиентов тестирования");
	ЯПодключаюКлиентТестированияИзТаблицыКлиентовТестирования(ИмяКлиентаТестирования);

КонецПроцедуры

&НаКлиенте
// заполнение таблицы Test Client в vanesse
Функция ПолучитьПараметрыПодключения(ТабПарам)

	ЭтоLinux = Ложь;
	СисИнфо = Новый СистемнаяИнформация;
	Если Найти(Строка(СисИнфо.ТипПлатформы), "Linux")>0 Тогда
		ЭтоLinux = Истина;
	КонецЕсли;

	Стр = Новый Структура;
	Стр.Вставить("Имя",                    "");
	Стр.Вставить("ПутьКИнфобазе",          "");
	Стр.Вставить("ПортЗапускаТестКлиента", "");
	Стр.Вставить("ДопПараметры",           "");
	Стр.Вставить("ТипКлиента",             "");
	Стр.Вставить("ИмяКомпьютера",          "");

	ИменаПараметров      = ТабПарам[0];// шапка
	ЗначенияПараметров   = ТабПарам[1];
	СтрокаАутентификации = "";
	Логин       = "";
	ДопПараметр = "";

	Для ккк = 1 По ИменаПараметров.Количество() Цикл
		ИмяПараметра = "";
		ЗначениеПараметра = "";

		ИменаПараметров.Свойство("Кол" + ккк, ИмяПараметра);
		ЗначенияПараметров.Свойство("Кол" + ккк, ЗначениеПараметра);

		Если ВРег(ИмяПараметра) = ВРег("Имя подключения") Тогда
			Стр.Имя = ЗначениеПараметра;
			// проверка заполнения данных
			Если Не ЗначениеЗаполнено(Стр.Имя) Тогда
				ВызватьИсключение "Параметр <Имя подключения> является обязательным!";
			КонецЕсли;

		ИначеЕсли ВРег(ИмяПараметра) = ВРег("Строка соединения") Тогда
			Стр.ПутьКИнфобазе  = ЗначениеПараметра;

		ИначеЕсли ВРег(ИмяПараметра) = ВРег("Порт") Тогда
			Стр.ПортЗапускаТестКлиента = ЗначениеПараметра;

		ИначеЕсли ВРег(ИмяПараметра) = ВРег("Логин") Тогда
			Логин = ЗначениеПараметра;
			Если Не ПустаяСтрока(Логин) Тогда
				СтрокаАутентификации = "/N"+Логин;
				Если Найти(Логин, " ") > 0 Тогда
					СтрокаАутентификации = "/N""" + СокрЛП(Логин)+ """";
				КонецЕсли;
			КонецЕсли;

		ИначеЕсли ВРег(ИмяПараметра) = ВРег("Пароль") Тогда
			Если Не ПустаяСтрока(ЗначениеПараметра) Тогда
				Если Найти(ЗначениеПараметра, " ") > 0 Тогда
					СтрокаАутентификации = СтрокаАутентификации + " /P """ + ЗначениеПараметра + "";
				Иначе
					СтрокаАутентификации = СтрокаАутентификации + " /P" + ЗначениеПараметра;
				КонецЕсли;
			КонецЕсли;

		ИначеЕсли ВРег(ИмяПараметра) = ВРег("Запускаемая обработка") Тогда
			Если ЗначениеЗаполнено(ЗначениеПараметра) Тогда
				Файл = Новый Файл(ЗначениеПараметра);
				Если Не Файл.Существует() Тогда
					ВызватьИсключение "Параметр <Запускаемая обработка> указывает на не существующий файл!";
				КонецЕсли;
				ДопПараметр = ДопПараметр + " /EXECUTE " + """" + ЗначениеПараметра + """";
			КонецЕсли;

		ИначеЕсли ВРег(ИмяПараметра) = ВРег("Дополнительные параметры строки запуска") Тогда
			ДопПараметр = ДопПараметр + " " + ЗначениеПараметра;

		ИначеЕсли ВРег(ИмяПараметра) = ВРег("Тип клиента") Тогда
			Стр.ТипКлиента = ЗначениеПараметра;

		ИначеЕсли ВРег(ИмяПараметра) = ВРег("Имя компьютера") Тогда
			Стр.ИмяКомпьютера = ЗначениеПараметра;

		КонецЕсли;
	КонецЦикла;

	Если Не ЗначениеЗаполнено(Стр.ТипКлиента) Тогда
		Стр.ТипКлиента = "Тонкий";
	КонецЕсли;
	
	Если Не ЗначениеЗаполнено(Стр.ПортЗапускаТестКлиента) Тогда
		Стр.ПортЗапускаТестКлиента = 1538;
	Иначе
		Стр.ПортЗапускаТестКлиента = Число(Стр.ПортЗапускаТестКлиента);
	КонецЕсли;

	Если Не ЗначениеЗаполнено(Стр.ПутьКИнфобазе) Тогда
		Стр.ПутьКИнфобазе = СтрокаСоединенияИнформационнойБазы();
	КонецЕсли;

	Если СтрокаАутентификации <> "" И Найти(СтрокаАутентификации, "/N") = 0 Тогда
		ВызватьИсключение "Параметр <Логин> не задан";
	КонецЕсли;
	Стр.ДопПараметры = СтрокаАутентификации + " " +ДопПараметр;

	ДанныеКлиентовТестирования = Ванесса.ДанныеКлиентовТестирования;

	Отбор = Новый Структура;
	Отбор.Вставить("Имя", Стр.Имя);
	НайденныеСтрокиИмя = ДанныеКлиентовТестирования.НайтиСтроки(Отбор);
	Если НайденныеСтрокиИмя.Количество() = 0 Тогда
		
		//проверить нахождение нового порта подключения в таблице клиентов
		Отбор = Новый Структура;
		Отбор.Вставить("ПортЗапускаТестКлиента", Стр.ПортЗапускаТестКлиента);
		НайденныеСтрокиПорт = ДанныеКлиентовТестирования.НайтиСтроки(Отбор);
		Если НайденныеСтрокиПорт.Количество() > 0 Тогда
			Сообщить("Для подключения с именем <"+Стр.Имя+"> изменен порт подключения, указанный порт уже есть в таблице подключений.");
			Стр.ПортЗапускаТестКлиента = Ванесса.ПроверитьПортНаЗанятость(Стр.ПортЗапускаТестКлиента);
		КонецЕсли;
		
		НоваяСтрока = ДанныеКлиентовТестирования.Добавить();
		ЗаполнитьЗначенияСвойств(НоваяСтрока, Стр);
	Иначе
		НоваяСтрока = НайденныеСтрокиИмя.Получить(0);
		Стр.ПортЗапускаТестКлиента = НоваяСтрока.ПортЗапускаТестКлиента;
		ЗаполнитьЗначенияСвойств(НоваяСтрока, Стр);
		Сообщить("Подключение с именем <"+Стр.Имя+"> перезаполнено в таблице подключений");
	КонецЕсли;

	Возврат Стр.Имя;

КонецФункции

&НаКлиенте
//я закрываю сеанс TESTCLIENT
//@ЯЗакрываюСеансTESTCLIENT()
Процедура ЯЗакрываюСеансTESTCLIENT() Экспорт
	
	Попытка
		КонтекстСохраняемый.ГлавноеОкноТестируемого.Закрыть();
	Исключение
		КонтекстСохраняемый.Вставить("ГлавноеОкноТестируемого",Неопределено);
	КонецПопытки;
	КонтекстСохраняемый.ГлавноеОкноТестируемого = Неопределено;

	// Закрытие платформенного-бспшного окна "Завершить работу"
	Попытка
		ИскомаяКнопка = КонтекстСохраняемый.ТестовоеПриложение.НайтиОбъект(Тип("ТестируемаяКнопкаФормы"), "Завершить работу");
		Если Не ИскомаяКнопка = Неопределено Тогда
			ИскомаяКнопка.Нажать();
		КонецЕсли;
	Исключение
		//
	КонецПопытки;
	
	Попытка
		КонтекстСохраняемый.ТестовоеПриложение.РазорватьСоединение();
	Исключение
		//	
	КонецПопытки;
	
	КонтекстСохраняемый.Вставить("ТестовоеПриложение",Неопределено);
	
	Если КонтекстСохраняемый.Свойство("ПодключенныеTestClient") Тогда
		ПодключенныеTestClient = КонтекстСохраняемый.ПодключенныеTestClient;
		УдалитьЭлементПодключенныеTestClient(ПодключенныеTestClient,КонтекстСохраняемый.ТекущийПрофильTestClient);
	КонецЕсли;	 

	// снимем флаг подключения в таблице TestClient
	Для каждого СтрокаПодключения Из Ванесса.ДанныеКлиентовТестирования Цикл
		СтрокаПодключения.Подключен = Ложь;
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
//И я закрываю TestClient "Кладовщик"
//@ЯЗакрываюTestClient(Парам01)
Процедура ЯЗакрываюTestClient(ИмяTestClient) Экспорт
	Сообщить("ЯЗакрываюTestClient <" + ИмяTestClient + ">");
	
	СвойстваTestClient = ПолучитьСвойстваПодключенногоTestClient(ИмяTestClient);
	Если СвойстваTestClient = Неопределено Тогда
		Сообщить("Не нашел профиля TestClient с именем <" + ИмяTestClient + "> чтобы его закрыть.");
		Возврат;
	КонецЕсли;
	
	ТекущийПрофильTestClient            = Неопределено;
	НадоВернутьТекущийПрофильTestClient = Ложь;
	Если КонтекстСохраняемый.Свойство("ТекущийПрофильTestClient") Тогда
		ТекущийПрофильTestClient = КонтекстСохраняемый.ТекущийПрофильTestClient;
		
		Если (ТекущийПрофильTestClient <> Неопределено) и (ТекущийПрофильTestClient <> ИмяTestClient) Тогда
			СвойстваТекущийПрофильTestClient = ПолучитьСвойстваПодключенногоTestClient(ТекущийПрофильTestClient);
			Если СвойстваТекущийПрофильTestClient = Неопределено Тогда
				ВызватьИсключение "Не нашел профиля TestClient с именем <" + ТекущийПрофильTestClient + "> хотя он должен быть активным в данный момент.";
			КонецЕсли;
			
			НадоВернутьТекущийПрофильTestClient = Истина;
		КонецЕсли;	 
	КонецЕсли;
	
	
	Если ИмяTestClient <> ТекущийПрофильTestClient Тогда
		//активизируем этот TestClient, чтобы закрыть в нём все окна
		ЯАктивизируюTestClient(ИмяTestClient);
	КонецЕсли;
	
	Попытка
		Ванесса.Шаг("И Я закрыл все окна клиентского приложения");
	Исключение
		Сообщить("Ошибка при закрытии всех окон Testclient.");
		Сообщить(ОписаниеОшибки());
	КонецПопытки;
	
	ЯЗакрываюСеансTESTCLIENT();
	//Ванесса.Шаг("И Я закрываю сеанс TESTCLIENT");
	
	// снимем отметку о подключении
	ПараметрыОтбора = Новый Структура;
	ПараметрыОтбора.Вставить("Имя",ИмяTestClient);
	МассивСтрок = Ванесса.ДанныеКлиентовТестирования.НайтиСтроки(ПараметрыОтбора);
	Если МассивСтрок.Количество() = 1 Тогда
		СтрокаЭтотКлиент = МассивСтрок[0];
		СтрокаЭтотКлиент.Подключен = Ложь;
	КонецЕсли;
	
	Если НадоВернутьТекущийПрофильTestClient Тогда
		ЯАктивизируюTestClient(ТекущийПрофильTestClient);
	Иначе	
		КонтекстСохраняемый.Вставить("ТекущийПрофильTestClient",Неопределено);
	КонецЕсли;	 
	
	
	УдалитьЭлементПодключенныеTestClient(КонтекстСохраняемый.ПодключенныеTestClient,ИмяTestClient);
	Если КонтекстСохраняемый.ПодключенныеTestClient.Количество() = 0 Тогда
		КонтекстСохраняемый.Вставить("ТекущийПрофильTestClient",Неопределено);
	КонецЕсли;	 
	
КонецПроцедуры

&НаКлиенте
//И я активизирую TestClient "Кладовщик"
//@ЯАктивизируюTestClient(Парам01)
Процедура ЯАктивизируюTestClient(ИмяTestClient) Экспорт
	//Сообщить("ЯАктивизируюTestClient <" + ИмяTestClient + ">");
	
	СвойстваTestClient = ПолучитьСвойстваПодключенногоTestClient(ИмяTestClient);
	Если СвойстваTestClient = Неопределено Тогда
		ВызватьИсключение "Не нашел профиля TestClient с именем <" + ИмяTestClient + ">";
	КонецЕсли;	 
	
	КонтекстСохраняемый.Вставить("ТестовоеПриложение",СвойстваTestClient.ТестовоеПриложение);
	КонтекстСохраняемый.Вставить("ГлавноеОкноТестируемого",СвойстваTestClient.ГлавноеОкноТестируемого);
	КонтекстСохраняемый.Вставить("ТекущийПрофильTestClient",ИмяTestClient);
	
КонецПроцедуры

&НаКлиенте
//И я подключаю TestClient "Кладовщик" логин "Пользователь1" пароль "1"
//@ЯПодключаюTestClientЛогинПароль(Парам01,Парам02,Парам03)
Процедура ЯПодключаюTestClientЛогинПароль(ИмяTestClient,Логин,Пароль) Экспорт
	Если Не КонтекстСохраняемый.Свойство("ПодключенныеTestClient") Тогда
		КонтекстСохраняемый.Вставить("ПодключенныеTestClient",Новый Массив);
	КонецЕсли;	 
	
	ПодключенныеTestClient = КонтекстСохраняемый.ПодключенныеTestClient;
	
	ПараметрыОтбора = Новый Структура;
	ПараметрыОтбора.Вставить("Имя",ИмяTestClient);
	МассивСтрок = Ванесса.ДанныеКлиентовТестирования.НайтиСтроки(ПараметрыОтбора);
	Если МассивСтрок.Количество() = 0 Тогда //значит нет такого профиля в таблице
		ПараметрыОтбора = Новый Структура;
		ПараметрыОтбора.Вставить("Имя","Этот клиент"); //будем копировать эту строку
		
		МассивСтрок = Ванесса.ДанныеКлиентовТестирования.НайтиСтроки(ПараметрыОтбора);
		Если МассивСтрок.Количество() = 0 Тогда
			ВызватьИсключение "Не найдена строка в таблице ДанныеКлиентовТестирования с <Имя=Этот клиент>";
		КонецЕсли;	 
		
		СтрокаЭтотКлиент = МассивСтрок[0];
		
		СтрокаДанныеКлиентовТестирования = Ванесса.ДанныеКлиентовТестирования.Добавить();
		ЗаполнитьЗначенияСвойств(СтрокаДанныеКлиентовТестирования,СтрокаЭтотКлиент);
		
		ДопПараметры = "";
		Если ЗначениеЗаполнено(Логин) Тогда
			ДопПараметры = ДопПараметры + "/N""" + Логин + """ ";
		КонецЕсли;	 
		Если ЗначениеЗаполнено(Пароль) Тогда
			ДопПараметры = ДопПараметры + "/P""" + Пароль + """ ";
		КонецЕсли;	 
		
		СтрокаДанныеКлиентовТестирования.Имя                    = ИмяTestClient;
		СтрокаДанныеКлиентовТестирования.ПортЗапускаТестКлиента = Ванесса.ПроверитьПортНаЗанятость(48000);
		СтрокаДанныеКлиентовТестирования.ДопПараметры           = ДопПараметры;
	КонецЕсли;	 
	
	
	Если НЕ Ванесса.ПодключитьПрофильTestClientПоИмени(ИмяTestClient) Тогда
		ВызватьИсключение "Не смог подключить профиль TestClient <" + ИмяTestClient + ">";
	КонецЕсли;	 
	
	ТестовоеПриложение      = КонтекстСохраняемый.ТестовоеПриложение;
	ГлавноеОкноТестируемого = КонтекстСохраняемый.ГлавноеОкноТестируемого;
		
	УдалитьЭлементПодключенныеTestClient(ПодключенныеTestClient,ИмяTestClient);
	
	ПодключенныеTestClient.Добавить(Новый Структура("Имя,ТестовоеПриложение,ГлавноеОкноТестируемого",ИмяTestClient,ТестовоеПриложение,ГлавноеОкноТестируемого));
	КонтекстСохраняемый.Вставить("ТекущийПрофильTestClient",ИмяTestClient);
	
КонецПроцедуры

&НаКлиенте
Функция ПолучитьСвойстваПодключенногоTestClient(ИмяTestClient)
	Если Не КонтекстСохраняемый.Свойство("ПодключенныеTestClient") Тогда
		Возврат Неопределено;
	КонецЕсли;	
	
	ПодключенныеTestClient = КонтекстСохраняемый.ПодключенныеTestClient;
	Для Каждого Элем Из ПодключенныеTestClient Цикл
		Если Элем.Имя = ИмяTestClient Тогда
			Возврат Элем;
		КонецЕсли;	 
	КонецЦикла;	
	
	Возврат Неопределено;
КонецФункции	

&НаКлиенте
//Я открыл новый сеанс TestClient или подключил уже существующий
//@ЯОткрылНовыйСеансTestClientИлиПодключилУжеСуществующий()
Процедура ЯОткрылНовыйСеансTestClientИлиПодключилУжеСуществующий() Экспорт
	ЯОткрылСеансTestClientОтИмениСПаролемИлиПодключаюУжеСуществующий();
КонецПроцедуры

&НаКлиенте
//Я открыл новый сеанс TestClient или подключил уже существующий без загрузки настроек
//@ЯОткрылНовыйСеансTestClientИлиПодключилУжеСуществующийБезЗагрузкиНастроек()
Процедура ЯОткрылНовыйСеансTestClientИлиПодключилУжеСуществующийБезЗагрузкиНастроек() Экспорт
	ИмяВременногоФайла = ПолучитьИмяВременногоФайла("txt");
	Если НЕ Ванесса.ОткрытьНовыйСеансTestClientИлиПодключитьУжеСуществующий("/out""" + ИмяВременногоФайла + """ /CNoLoadConfig") Тогда
		ВызватьИсключение "Не смог подключить TestClient!";
	КонецЕсли;
КонецПроцедуры

//Дано Я открыл новый сеанс TestClient от имени "МойПользователь" с паролем "МойПароль"
//@ЯОткрылСеансTestClientОтИмениСПаролемИлиПодключаюУжеСуществующий(Парам01,Парам02)
&НаКлиенте
Процедура ЯОткрылСеансTestClientОтИмениСПаролемИлиПодключаюУжеСуществующий(Знач Логин = "", Знач Пароль = "") Экспорт
	
	СтрокаАутентификации = "";
	Логин = СокрЛП(Логин); 
	Пароль = СокрЛП(Пароль);
	ИмяВременногоФайла = ПолучитьИмяВременногоФайла("txt");
	
	Если Не ПустаяСтрока(Логин) Тогда 
		СтрокаАутентификации = "/N"+Логин;
		Если Найти(Логин, " ") > 0 Тогда 
			СтрокаАутентификации = "/N""" + СокрЛП(Логин)+ """";
		КонецЕсли;
		
		Если Не ПустаяСтрока(Пароль) Тогда 
			СтрокаАутентификации = СтрокаАутентификации + " /P"+Пароль;
		КонецЕсли;
	КонецЕсли;
	
	Если НЕ Ванесса.ОткрытьНовыйСеансTestClientИлиПодключитьУжеСуществующий("/out""" + ИмяВременногоФайла + """" + " "+ СтрокаАутентификации) Тогда
		ВызватьИсключение "Не смог подключить TestClient!";
	КонецЕсли;
	
КонецПроцедуры

//И я подключаю профиль TestClient "Оператор"
//@ЯПодключаюПрофильTestClient(Парам01)
&НаКлиенте
Процедура ЯПодключаюПрофильTestClient(ИмяПрофиля) Экспорт
	ДанныеЗапускаКлиентаТестирования = Ванесса.НайтиДанныеЗапускаКлиентаТестирования(ИмяПрофиля);
	Если ДанныеЗапускаКлиентаТестирования = Неопределено Тогда
		ВызватьИсключение "Не найден профиль подключения TestClient <" + ИмяПрофиля + ">";
	КонецЕсли;	 
	
	ПодключитьTestClientИзТаблицыКлиентовТестирования(ИмяПрофиля);
КонецПроцедуры

//окончание текста модуля