﻿# language: ru

@lessons

Функционал: Интерактивная справка. Запуск браузера

Сценарий: Запуск браузера

	* Привет! В этом уроке я расскажу тебе про настройки запуска клиента тестирования в web клиенте. Давай откроем второй экземпляр Ванессы в режиме обучения.
		И я открываю Vanessa Automation в режиме обучения
		
	* Эти настройки находятся тут.
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ГруппаНастройки' UI Automation
		И Пауза 1
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'СтраницаКлиентыТестирования' UI Automation
		И Пауза 1
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'НастройкиЗапускаБраузера' UI Automation
		И Пауза 1
		И я делаю подсветку нескольких элементов VA с их заголовком "Настройки запуска браузера для web клиента" UI Automation
			| 'Имя'                           |
			| 'КомандаЗапускаChrome'          |
			| 'КомандаЗапускаChromeСОтладкой' |
			| 'КомандаЗапускаБраузера'        |

	* Эта настройка нужна, чтобы определить как будет запускаться браузер, в котором будет запускаться клиент тестирования.
		И я делаю подсветку нескольких элементов VA с их заголовком "Команда запуска браузера" UI Automation
			| 'Имя'                    |
			| 'КомандаЗапускаБраузера' |
	
	* Если поле пустое, тогда в качестве браузера будет запущен браузер по умолчанию.
	* Если нужно запустить другой браузер, или нужно передать браузеру специальные ключи, то тогда следует указать эту команду в данном поле.
		И я делаю подсветку нескольких элементов VA с их заголовком "Команда запуска браузера" UI Automation
			| 'Имя'                    |
			| 'КомандаЗапускаБраузера' |

	* Также есть возможность автоматически заполнить данное поле.
	* Данная команда генерирует строку запуска браузера Chrome.
		И я делаю подсветку нескольких элементов VA с их заголовком "Команда запуска Chrome" UI Automation
			| 'Имя'                           |
			| 'КомандаЗапускаChrome'          |
		И Пауза 0.1
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'КомандаЗапускаChrome' UI Automation		
		И Пауза 1
		
	* При этом поле заполнится строкой запуска браузера, при условии что браузер Chrome установлен на данном ПК
		И я делаю подсветку нескольких элементов VA с их заголовком "Команда запуска браузера" UI Automation
			| 'Имя'                    |
			| 'КомандаЗапускаБраузера' |

	* Также можно использовать другую команду, которая запускает браузер Chrome с дополнительными ключами.
		И я делаю подсветку нескольких элементов VA с их заголовком "Команда запуска Chrome+debug" UI Automation
			| 'Имя'                           |
			| 'КомандаЗапускаChromeСОтладкой' |
	* Данный вариант нужно использовать при создании автоматизированной документации, когда клиент тестирования запущен как web клиент.	
		И Пауза 0.1
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'КомандаЗапускаChromeСОтладкой' UI Automation		
		И Пауза 1

	* На этом всё, переходи к следующему уроку интерактивной справки.




