﻿#Использовать v8runner
#Использовать logos

Перем Лог;
Перем УправлениеКонфигуратором;

Функция ОбеспечитьКаталог(Знач Каталог)
	
	Файл = Новый Файл(Каталог);
	Если Не Файл.Существует() Тогда
		Попытка 
			СоздатьКаталог(Каталог);
		Исключение
			Лог.Ошибка(СтрШаблон(НСтр("ru='Не удалось создать каталог %1.
|%2';en='Failed to create directory %1.
|%2'"), Каталог, ИнформацияОбОшибке()));
			Возврат Ложь;
		КонецПопытки;
	ИначеЕсли Не Файл.ЭтоКаталог() Тогда 
		Лог.Ошибка(СтрШаблон(НСтр("ru='Каталог %1 не является каталогом.';en='Directory %1 is not a directory.'"), Каталог));
		Возврат Ложь;
	КонецЕсли;
	
	Возврат Истина;
	
КонецФункции

Функция ЗаписатьОбъектJSON(ДанныеJSON) Экспорт

	ЗаписьJSON = Новый ЗаписьJSON;
	ЗаписьJSON.УстановитьСтроку();
	ЗаписатьJSON(ЗаписьJSON, ДанныеJSON);
	Возврат ЗаписьJSON.Закрыть();
	
КонецФункции

Функция ПараметрыСборки(ИмяФайлаПараметров)
	ЧтениеJSON = Новый ЧтениеJSON();
	ЧтениеJSON.ОткрытьФайл(ИмяФайлаПараметров);
	Параметры = ПрочитатьJSON(ЧтениеJSON);
	ЧтениеJSON.Закрыть();
	
	Возврат Параметры;
	
КонецФункции                                               

Процедура ОчиститьКаталог(Путь)
	Файлы = НайтиФайлы(Путь, "*", Истина);
	Для Каждого Файл Из Файлы Цикл
		Попытка
			УдалитьФайлы(Файл.ПолноеИмя);
		Исключение
			Сообщить(ОписаниеОшибки());
		КонецПопытки;
	КонецЦикла;	
	
КонецПроцедуры

Функция ПолучитьСтрокуЗапускаСборки(ПараметрыСборки, ИмяФайлаПараметрыVA)
	Стр = """" + ПараметрыСборки.Path1c + """";
	Стр = Стр + " " + ПараметрыСборки.ConnectionString;
	
	ПутьКVanessaAutomation = ОбъединитьПути(ПараметрыСборки.VAPath, "vanessa-automation.epf");
	
	Стр = Стр + " /Execute """ + ПутьКVanessaAutomation + """ /C""StartFeaturePlayer;UseEditor;ShowMainForm;workspaceRoot=%workspaceRoot%;DisableLoadConfig;DisableUserSettingsLoader;VAParams=" + ИмяФайлаПараметрыVA + """";
	
	Стр = СтрЗаменить(Стр,"%workspaceRoot%",ПараметрыСборки.VAPath);

	Возврат Стр;
КонецФункции

Процедура ЗапуститьСборку(СтрокаЗапускаСборки, Параметры)
	
	Процесс = СоздатьПроцесс(СтрокаЗапускаСборки,,Истина);
	Процесс.Запустить();
	Sleep(5000);
	Пока Истина Цикл
		Если НайтиПроцессПоИдентификатору(Процесс.Идентификатор) = Неопределено Тогда
			//Если НадоЧитатьЛог Тогда
			//	ВывестиНовыеСообщения(ИмяФайлаЛога,КолСтрокЛогаПрочитано);
			//КонецЕсли;	 
			
			Прервать;
		КонецЕсли;	 
		
		Sleep(2000);
		//Если ЗначениеЗаполнено(ИмяФайлаЛога) И НадоЧитатьЛог Тогда
		//	Sleep(10000);
		//Иначе	
		//	Sleep(2000);
		//КонецЕсли;	 
		
		//Если НадоЧитатьЛог Тогда
		//	Если ЗначениеЗаполнено(ИмяФайлаЛога) Тогда
		//		ВывестиНовыеСообщения(ИмяФайлаЛога,КолСтрокЛогаПрочитано);
		//	КонецЕсли;	 
		//	
		//	Попытка
		//		Если НЕ Процесс.Завершен ИЛИ Процесс.ПотокВывода.ЕстьДанные ИЛИ Процесс.ПотокОшибок.ЕстьДанные Тогда
		//			Если Процесс.ПотокВывода.ЕстьДанные Тогда
		//				ОчереднаяСтрокаВывода = Процесс.ПотокВывода.Прочитать();
		//				Если Не ПустаяСтрока(ОчереднаяСтрокаВывода) Тогда
		//					Сообщить(ОчереднаяСтрокаВывода, СтатусСообщения.Информация);
		//				КонецЕсли;
		//			КонецЕсли;
		//			
		//			Если Процесс.ПотокОшибок.ЕстьДанные Тогда
		//				ОчереднаяСтрокаОшибок = Процесс.ПотокОшибок.Прочитать();
		//				Если Не ПустаяСтрока(ОчереднаяСтрокаОшибок) Тогда
		//					Сообщить(ОчереднаяСтрокаОшибок, СтатусСообщения.Важное);
		//				КонецЕсли;
		//			КонецЕсли;	 
		//		КонецЕсли;	 
		//	Исключение
		//		Сообщить(ОписаниеОшибки());
		//	КонецПопытки;
		//	
		//КонецЕсли;	 
	КонецЦикла;	
	
КонецПроцедуры

Функция ЗначениеСтатуса(ИмяФайла)
	
	Текст = Новый ЧтениеТекста;
	Текст.Открыть(ИмяФайла, "UTF-8");
	ТекстФайла = СокрЛП(Текст.Прочитать());
	Текст.Закрыть();
	
	Возврат ТекстФайла;
	
КонецФункции	

Процедура СоздатьФайлыУроковПоФиче(ИмяФайлаФичи, ИмяКаталога, Параметры)
	
	Файл = Новый Файл(Параметры.ResultPath);
	Если НЕ Файл.Существует() Тогда
		ВызватьИсключение "Неверно передан параметр ResultPath: " + Параметры.ResultPath;
	КонецЕсли;	
	
	ВременныйКаталогАртефактов = ОбъединитьПути(Параметры.ResultPath, "temp");
	ОбеспечитьКаталог(ВременныйКаталогАртефактов);
	ОчиститьКаталог(ВременныйКаталогАртефактов);
	
	ПараметрыVA = Новый Структура;
	ПараметрыVA.Вставить("КаталогФич", ИмяФайлаФичи);
	ПараметрыVA.Вставить("ИспользоватьКомпонентуVanessaExt", Истина);
	ПараметрыVA.Вставить("ВыполнитьСценарии", Истина);
	ПараметрыVA.Вставить("ВыгружатьСтатусВыполненияСценариевВФайл", Истина);
	ИмяФайлаСтатуса = ОбъединитьПути(ВременныйКаталогАртефактов, "status.txt");
	УдалитьФайлы(ИмяФайлаСтатуса);
	ПараметрыVA.Вставить("ПутьКФайлуДляВыгрузкиСтатусаВыполненияСценариев", ИмяФайлаСтатуса);
	
	Для Каждого КлючЗначение Из Параметры Цикл
		ПараметрыVA.Вставить(КлючЗначение.Ключ, КлючЗначение.Значение);
	КонецЦикла;	
	
	ИмяФайлаПараметрыVA = ОбъединитьПути(ВременныйКаталогАртефактов, "VAParams.json");
	
	ЗаписьJson = Новый ЗаписьJson();
	ЗаписьJson.ОткрытьФайл(ИмяФайлаПараметрыVA);
	ЗаписатьJSON(ЗаписьJson, ПараметрыVA); 
	ЗаписьJson.Закрыть(); 
	
	СтрокаЗапускаСборки = ПолучитьСтрокуЗапускаСборки(Параметры, ИмяФайлаПараметрыVA);
	//Сообщить(СтрокаЗапускаСборки);
	ЗапуститьСборку(СтрокаЗапускаСборки, Параметры);
	
	ФайлСтатуса = Новый Файл(ИмяФайлаСтатуса);
	Если НЕ ФайлСтатуса.Существует() Тогда
		ВызватьИсключение "Не найден файл статуса: " + ИмяФайлаСтатуса;
	КонецЕсли;	
	
	ЗначениеСтатуса = ЗначениеСтатуса(ИмяФайлаСтатуса);
	Если ЗначениеСтатуса <> "0" Тогда
		ВызватьИсключение "Получен статус выполнения сценария: " + ЗначениеСтатуса;
	КонецЕсли;
	
	ИмяФайлаВидео = ОбъединитьПути(Параметры.КаталогВыгрузкиИнструкцийВидео, "Video", "result.mp4");
	ФайлВидео = Новый Файл(ИмяФайлаВидео);
	Если НЕ ФайлВидео.Существует() Тогда
		ВызватьИсключение "Не найден файл видео: " + ИмяФайлаВидео;
	КонецЕсли;	
	
	КаталогРезультата = ОбъединитьПути(Параметры.ResultPath, "FinalVideo");
	ОбеспечитьКаталог(КаталогРезультата);
	
	КаталогГлавы = ОбъединитьПути(КаталогРезультата, ИмяКаталога);
	ОбеспечитьКаталог(КаталогГлавы);
	
	ФайлИмяФайлаФичи = Новый Файл(ИмяФайлаФичи);
	НовоеИмяФайлаВидео = ОбъединитьПути(КаталогГлавы, ФайлИмяФайлаФичи.ИмяБезРасширения + ".mp4");
	
	УдалитьФайлы(НовоеИмяФайлаВидео);
	КопироватьФайл(ИмяФайлаВидео, НовоеИмяФайлаВидео);
	
КонецПроцедуры

Процедура СоздатьУрокиПоКаталогуФич(КаталогФич, Параметры, ДопПараметры)
	Файл = Новый Файл(КаталогФич);
	ИмяКаталога = Файл.Имя;
	
	Файлы = НайтиФайлы(КаталогФич, "*.feature", Истина);
	Для Каждого Файл Из Файлы Цикл
		Сообщить("Работа по фиче: " + Файл.ПолноеИмя);
		
		ДопПараметры.КоличествоОбработанныхФайлов = ДопПараметры.КоличествоОбработанныхФайлов + 1;
		СоздатьФайлыУроковПоФиче(Файл.ПолноеИмя, ИмяКаталога, Параметры);
		
	КонецЦикла;	
	
КонецПроцедуры

Процедура СгенерироватьФайлыСправки(Параметры, КаталогУроков, ДопПараметры)
	ТаблицаГлав = Новый ТаблицаЗначений;
	ТаблицаГлав.Колонки.Добавить("ПолноеИмя");
	ТаблицаГлав.Колонки.Добавить("Имя");
	
	Файлы = НайтиФайлы(КаталогУроков, "*", Ложь);
	Для Каждого Файл Из Файлы Цикл
		Если Найти(НРег(Файл.Имя), "глава") = 0 Тогда
			Продолжить;
		КонецЕсли;	
		
		Если Параметры.Свойство("ОтборКаталогов") И Параметры.ОтборКаталогов.Количество() > 0 Тогда
			НадоПродолжить = Истина;
			Для Каждого Элем Из Параметры.ОтборКаталогов Цикл
				Если Найти(НРег(Файл.Имя), НРег(Элем)) > 0 Тогда
					НадоПродолжить = Ложь;
				КонецЕсли;	
			КонецЦикла;	
			
			Если НадоПродолжить Тогда
				Продолжить;
			КонецЕсли;	
			
		КонецЕсли;	
		
		СтрокаТаблицаГлав = ТаблицаГлав.Добавить();
		СтрокаТаблицаГлав.ПолноеИмя = Файл.ПолноеИмя;
		СтрокаТаблицаГлав.Имя = Файл.Имя;
	КонецЦикла;	
	
	ТаблицаГлав.Сортировать("Имя");
	
	Для Каждого СтрокаТаблицаГлав Из ТаблицаГлав Цикл
		
		Сообщить("Создание уроков по главе: " + СтрокаТаблицаГлав.Имя);
		СоздатьУрокиПоКаталогуФич(СтрокаТаблицаГлав.ПолноеИмя, Параметры, ДопПараметры);
		
	КонецЦикла;	
	
КонецПроцедуры

Процедура СборкаСправки(ИмяФайлаПараметров)
	НачалоРаботы = ТекущаяДата();
	
	Параметры = ПараметрыСборки(ИмяФайлаПараметров);
	КаталогУроков = ОбъединитьПути(Параметры.VAPath, "training","features");
	
	ДопПараметры = Новый Структура;
	ДопПараметры.Вставить("КоличествоОбработанныхФайлов", 0);
	СгенерироватьФайлыСправки(Параметры, КаталогУроков, ДопПараметры);
	
	ОкончаниеРаботы = ТекущаяДата();
	Сообщить("Обработка закончена за " + Окр((ОкончаниеРаботы - НачалоРаботы)/60) + " минут.");
	Сообщить("Обработано " + ДопПараметры.КоличествоОбработанныхФайлов + " файлов.");
	
КонецПроцедуры

Лог = Логирование.ПолучитьЛог("vb.compile.log");
Лог.УстановитьУровень(УровниЛога.Отладка);


Если АргументыКоманднойСтроки.Количество() = 0 Тогда
	Лог.Ошибка("Не переданы параметры!");
ИначеЕсли АргументыКоманднойСтроки.Количество() <> 1 Тогда
	Лог.Ошибка("Скрипт принимает только один параметр!");
Иначе
	СборкаСправки(АргументыКоманднойСтроки[0]);
КонецЕсли;

