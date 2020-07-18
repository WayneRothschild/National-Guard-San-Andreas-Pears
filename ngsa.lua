script_name("N.G.S.A Helper") -- название
script_description("/ngsa - Information") -- о скрипте
script_version("0.2") -- версия скрипта
script_author("enyag and avdeenko") -- авторы
require "lib.moonloader" -- подключение библиотеки
local memory = require "memory" -- подключение для очистки чата

local textdialog = "{f4a460}________________________________________________________________________________\n\n{f4a460}Очистка чата {FFFFFF}[ /cclear ].\n{f4a460}Постоянный поиск {FFFFFF}[ /pfd ].\n{f4a460}Объявление в чат департамента. {FFFFFF}[ /departament ].\n{f4a460}Объявление в гос. новости. {FFFFFF}[ /gos ].\n{f4a460}Объявление в чат рации. {FFFFFF}[ /racia ].\n{f4a460}Проверка при призыве. {FFFFFF}[ /pr ].\n{f4a460}Правила чата использования департамента: {FFFFFF}[ /dpravila ].\n{f4a460}Снять розыск: {FFFFFF}[ /cl ].\n{f4a460}Взять автомобиль фракции: {FFFFFF}[ /zcar ].\n{f4a460}Взять авиацию фракци: {FFFFFF}[ /zavia ].\n{f4a460}Починить автомобиль фракции: {FFFFFF}[ /th ].\n{f4a460}Починить авиацию фракции: {FFFFFF}[ /ta ].\n{f4a460}Правила подачи государственной волны: {FFFFFF}[ /govpravila ].\n{f4a460}Правила выдачи Условно-Досрочного-Освобождения: {FFFFFF}[ /ydopravila ].\n{f4a460}Правила выдачи ранга: {FFFFFF}[ /pravilarank ]\n{f4a460}Надеть фуражку и форму В.В.С / или снять: {FFFFFF}[ /forma ].\n{f4a460}Лекционный раздел: {FFFFFF}[ /lec ].\n\n{f4a460}Создатель скрипта: {FFFFFF}Wayne_Rothschild.\n{f4a460}Соавтор скрипта: {FFFFFF}Lucifer_Rothschild.\n{f4a460}Соавтор скрипта: {FFFFFF}Bernard_Rothschild.\n{f4a460}Дата создания скрипта: {FFFFFF}13.07.2020.\n{f4a460}Instagram создателя скрипта: {FFFFFF}_avdeenko_m\n{f4a460}Instagram соавтора скрипта:{FFFFFF} Xrubons\n{f4a460}Instagram соавтора скрипта:{FFFFFF} hellperand\n{f4a460}ВКонтакте создателя скрипта:{FFFFFF} vk.com/avdeenkoo10\n{f4a460}ВКонтакте соавтора скрипта:{FFFFFF} vk.com/\n{f4a460}ВКонтакте соавтора скрипта:{FFFFFF} vk.com/pluha28003\n{f4a460}________________________________________________________________________________"
local praviladepartamenta = "{f4a460}________________________________________________________________________________\n\n{FFFFFF}[ 1 ]{f4a460} Запрещено свободное общение в OOC с {FFFFFF}7:00 {f4a460}до {FFFFFF}22:00{f4a460}\n{FFFFFF}[ 2 ]{f4a460} Запрещены объявления о покупке/продаже имущества.\n{FFFFFF}[ 3 ]{f4a460} Запрещены оскорбления в сторону сотрудников департамента.\n{FFFFFF}[ 4 ]{f4a460} Запрещено употребление ненармотивной лексики. {FFFFFF}[ Мат/MG ]{f4a460}\n{FFFFFF}[ 5 ]{f4a460} Запрещены OOC приветствия.\n{FFFFFF}[ 6 ]{f4a460} Запрещёно использовать рацию департамента {FFFFFF}первым{f4a460} должностям в гос.структурах.\n{FFFFFF}| Исключение {f4a460}при вынужденных мерах: {FFFFFF}ЧП{f4a460}, {FFFFFF}Глобальных РП ситуациях {f4a460}\n{FFFFFF}[ 7 ]{f4a460} Запрещёно снимать мут, если он был выдан по правилам, даже если человек извинился или по амнистии.\n{FFFFFF}[ 8 ]{f4a460} Запрещён намеренный откат.\n{FFFFFF}[ 9 ]{f4a460} Запрещено общение не в рабочей стилистике\n                            {FFFFFF}За нарушение правил рации Департамента сотрудник понесёт наказание в виде:\n{FFFFFF}[ 1 ]{f4a460} Нарушение первого и девятого пункта - {FFFFFF}Блокирование Рации на 20 минут.\n{FFFFFF}[ 2 ]{f4a460} Объявления о покупке/продаже имущества - {FFFFFF}Блокирование Рации на 30 минут.\n{FFFFFF}[ 3 ]{f4a460} Оскорбления в сторону сотрудников департамента - {FFFFFF}Блокирование Рации на 30 минут.\n{FFFFFF}[ 4 ]{f4a460} Употребление ненармотивной лексики - {FFFFFF}Блокирование Рации на 20 минут.\n{FFFFFF}[ 5 ]{f4a460} OOC приветствия - {FFFFFF}Блокирование Рации на 20 минут.\n{FFFFFF}[ 6 ]{f4a460} Использовать рации департамента первым должностям в гос.структурах - {FFFFFF}Блокирование Рации на 30 минут.\n{FFFFFF}[ 7 ]{f4a460} Намеренный откат в свою пользу - {FFFFFF}Блокирование Рации на 30 минут.\n{FFFFFF}[ 8 ]{f4a460} Нарушение субординации - {FFFFFF}Блокирование Рации на 20 минут.\n{FFFFFF}[ 9 ]{f4a460} Нарушение УДО - {FFFFFF}Блокирование Рации на 30 минут.\n"
local pravilagosvolny2 = "{f4a460}________________________________________________________________________________\n\n{FFFFFF}[ 1 ]{f4a460} Интервал между подачей гос.волны - {FFFFFF}10 минут\n{FFFFFF}[ 2 ]{f4a460} Интервал подачи гос.волны (повторно с той же фракции) - {FFFFFF}20 минут\n{FFFFFF}[ 3 ]{f4a460} Интервал занятия гос.волны (повторно с той же фракции)- {FFFFFF}5 минут\n{FFFFFF}[ 4 ]{f4a460} Гос.новости о проведении зачисток подаются вне очереди.\n{FFFFFF}[ 5 ]{f4a460} Максимальное количество строчек {FFFFFF}[/gov ] {f4a460}- {FFFFFF}2.\n{FFFFFF}[ 6 ]{f4a460} Вам нужно спросить свободна ли волна на то время,которую вы хотите занять\n{FFFFFF}[ 7 ]{f4a460} Вам следует заранее занимать гос.волну дабы избежать конфликта.\n{FFFFFF}[ 8 ]{f4a460} Обязательно нужно сообщать об окончании набора.\n{FFFFFF}[ 9 ]{f4a460} Как только Вы заняли гос.волну,вам нужно отправить оповещение о том,что проходит набор в вашу организацию.\n{FFFFFF}[ 10 ]{f4a460} После того,как Вы отправили оповещение,введите команду /lmenu и выберет пункт '{1ee01c}Набор [ОТКРЫТ]{f4a460} '\n{FFFFFF}[ 11 ]{f4a460} Во время проведение набора оставляйте пункт в /lmenu '{1ee01c}НАБОР{f4a460}' открытым\n{FFFFFF}[ 12 ]{f4a460}  После окончания набора,введи команду /lmenu и выберете вновь пункт 'НАБОР' и должно быть написано '{ff1100}Набор [ЗАКРЫТ]{f4a460}'\n{FFFFFF}[ 13 ]{f4a460} Сообщите в гос.волну о том,что вы закончили набор в вашу организацию.\n"
local pravilaydo1 = "{f4a460}________________________________________________________________________________\n\n{FFFFFF}[ 1 ]{f4a460} Заключенный должен спокойно вести себя в тюрьме,не проявлять никаких активных противоборствующих действий.\n{FFFFFF}[ 2 ]{f4a460} Заключенный не должен быть осужден за следующие статьи:\n{FFFFFF}| Убийство (2.1, 2.2, 2.3) | Терроризм (7.1) Взлом базы данных, Ограбление Банка, Проникновение и проникновение с целью кражи (17.2 и 17.1), а так-же за статью «Зачистка» (Z. CS, 16.7).\n{FFFFFF}[ 3 ]{f4a460} За нарушения правил УДО или неправильную подачу запроса, адвокату выписывается письменное предупреждение и блокировка рации на 30 минут.\n{FFFFFF}[ 4 ]{f4a460} Если заключенный был осужден за статью 1.4 (нападение на гос. лицо), независимо сколько ему осталось сидеть в тюрьме (1-30м) сумма выхода будет - 50.000$\n{FFFFFF}[ 5 ]{f4a460} Адвокату запрещено выпускать из психиатрической больницы психически больных граждан штата.\n"
local pravilarank1 = "{f4a460}________________________________________________________________________________\n\n{FFFFFF}[ 1 ]{f4a460} Отныне повышение с {FFFFFF}1 {f4a460}на {FFFFFF}2 {f4a460}проходит через одни сутки после инвайта во фракцию ( день стажировки )\n{FFFFFF}[ 2 ]{f4a460}Повышение со {FFFFFF}2 {f4a460}на {FFFFFF}3 {f4a460}разрешается через двое суток после получения второго звания\n{FFFFFF}[ 3 ]{f4a460}Повышение с {FFFFFF}3 {f4a460}на {FFFFFF}5 {f4a460}разрешается через четверо суток после получения последнего звания звания или на собрании [ {FFFFFF}только для данных фракций : NGSA , PD {f4a460}]\n{FFFFFF}[ 4 ]{f4a460} Повышение для {FFFFFF}6 {f4a460}рангов и выше происходит только на собрании\n"

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then return end -- проверка на запуск сампа и сампфункса
    autoupdate("https://github.com/WayneRothschild/National-Guard-San-Andreas-Pears/", '['..string.upper(thisScript().name)..']: ', "https://github.com/WayneRothschild/National-Guard-San-Andreas-Pears/")
    while not isSampAvailable() do wait(100) end
	
	sampAddChatMessage("{FFFFFF}*{f4a460}Доброго времени суток, пользователь {FFFFFF}N.G.S.A Helper. {f4a460}Версия скрипта: {FFFFFF}0.1 ")
    sampAddChatMessage("{FFFFFF}*{f4a460}National Guard San Andreas | {FFFFFF}Pears Project. {f4a460}Подробнее о скрипте: {FFFFFF}/ngsa", 0xC1C1C1)

-- Команды скрипта
    sampRegisterChatCommand("ngsa", ngsa)
	sampRegisterChatCommand("dpravila", dpravila)
    sampRegisterChatCommand("cclear", cclear)
	sampRegisterChatCommand("cl", cl)
	sampRegisterChatCommand("zavia", zavia)
	sampRegisterChatCommand("zcar", zcar)
	sampRegisterChatCommand("th", th)
	sampRegisterChatCommand("ta", ta)
	sampRegisterChatCommand("govpravila", govpravila)
	sampRegisterChatCommand("ydopravila", ydopravila)
	sampRegisterChatCommand("pravilarank", pravilarank)
	sampRegisterChatCommand("forma", formavvs)
	sampRegisterChatCommand("pr", pr)
	sampRegisterChatCommand("departament", departament)
	sampRegisterChatCommand("racia", racia)
	sampRegisterChatCommand("gos", government)
	sampRegisterChatCommand("lec", lektcii)
	sampRegisterChatCommand("pfd", cmd_cfind)
	sampRegisterChatCommand("us", usearm)

    while true do wait(0)
--			end
        -- тут бесконечный цикл, тут обычно флудеры, кликеры и другое
    end
end

function usearm()
    lua_thread.create(function()
    sampSendChat("/usearm", 0xFFFFFF)
    end)
end

function cmd_cfind(param)
	tonumber(param)
	confind2 = param
	if confind == false then
		confind = true
		if sampIsPlayerConnected(param) then
			if confind2 ~= nil then
					lua_thread.create(function()
						while confind == true do 
							if confind == false then break end
							wait(1500)
							sampSendChat("/find "..confind2)
							wait(1500)
						end
					end)
			else sampAddChatMessage("{FFFFFF}[ Мысли ]: Постоянный поиск игрока {f4a460}[ /pfd ID ]{FFFFFF}.", -1)
			end
		else sampAddChatMessage("{FFFFFF}[ Мысли ]: Данный игрок {f4a460}не в игре{FFFFFF}.", -1)
		end
	else
		sampAddChatMessage("{FFFFFF}[ Мысли ]: Постоянный поиск {f4a460}прекращен{FFFFFF}.", -1)
		confind = false
	end
end

function ta()
    lua_thread.create(function()
    sampSendChat("/tehavia", 0xFFFFFF)
    end)
end

function th()
    lua_thread.create(function()
    sampSendChat("/tehveh", 0xFFFFFF)
    end)
end

function zavia()
    lua_thread.create(function()
    sampSendChat("/agetavia", 0xFFFFFF)
    end)
end

function zcar()
    lua_thread.create(function()
    sampSendChat("/agetcar", 0xFFFFFF)
    end)
end

function cl()
    lua_thread.create(function()
    sampSendChat("/clear", 0xFFFFFF)
    end)
end

function cclear()
    memory.fill(sampGetChatInfoPtr() + 306, 0x0, 25200)
    memory.write(sampGetChatInfoPtr() + 306, 25562, 4, 0x0)
    memory.write(sampGetChatInfoPtr() + 0x63DA, 1, 1)
end

function formavvs1()

	while sampIsDialogActive() do
		wait(0)
	local result, button, list, input = sampHasDialogRespond(1717)
	if result and list == 0 then
		sampSendChat("/formavvs")
		sampSendChat("/cvet 23")
		sampSendChat("/me надел фурашку.")
	elseif result and list == 1 then
		sampSendChat("/formavvs")
		sampSendChat("/color")
		sampSendChat("/color")
		end
	end
end

function prizivinvites()

	while sampIsDialogActive() do
		wait(0)
	local result, button, list, input = sampHasDialogRespond(17126)
	if result and list == 0 then
		sampSendChat("Добрый день, сэр.")
			wait(1000)
		sampSendChat("/ame исполнил воинское приветствие.")
			wait(2000)
		sampSendChat("Прибыли с целью рекрутирования?")
	elseif result and list == 1 then
		sampSendChat("Хорошо, сэр. Я должен взглянуть на Ваши документы.")
			wait(2000)
		sampSendChat("Если быть точнее, то: ID-Карта, Навыки.")
	elseif result and list == 2 then
		sampSendChat("Вопрос первый.")
			wait(2000)
		sampSendChat("Что находится у меня над головой?")
	elseif result and list == 3 then
		sampSendChat("Вопрос второй.")
			wait(2000)
		sampSendChat("Ознакомлены с порталом штата?")
	elseif result and list == 4 then
		sampSendChat("Вопрос третий.")
			wait(2000)
		sampSendChat("Сколько лет проживаете в штате?")
	elseif result and list == 5 then
		sampSendChat("Вопрос четвертый.")
			wait(2000)
		sampSendChat("Какие языки знаете?")
	elseif result and list == 6 then
		sampSendChat("Вопрос пятый.")
			wait(2000)
		sampSendChat("Имеется военный билет?")
	elseif result and list == 7 then
		sampSendChat("Вопрос шестой.")
			wait(2000)
		sampSendChat("Почему именно Национальная Гвардия?")
	elseif result and list == 8 then
		sampSendChat("Вопрос седьмой.")
			wait(2000)
		sampSendChat("Как относитесь к отказам?")
	elseif result and list == 9 then
		sampSendChat("Извините, но Вы нам не подходите из-за плохого психического состояния.")
	elseif result and list == 10 then
		sampSendChat("Извините, но Вы нам не подходите из-за отсутствия военного билета.")
	elseif result and list == 11 then
		sampSendChat("Извините, но Вы нам не подходите из-за нахождения в Черном Списке")
		wait(500)
		sampSendChat("/b Черный Список Военкомата или Черный Список Департамента")
	elseif result and list == 12 then
		sampSendChat("Извините, но Вы нам не подходите из-за малого срока проживания в штате.")
		wait(500)
		sampSendChat("/b К нам можно только имея уровень выше 3.")
	elseif result and list == 13 then
		sampSendChat("Извините, но Вы нам не подходите из-за ужасного внешнего вида.")
	elseif result and list == 14 then
		sampSendChat("Извините, но Вы нам не подходите из-за проф.непригодности.")
		wait(500)
		sampSendChat("/b Вы не отыгрываете РП.")
		end
	end
end

function departament1()

	while sampIsDialogActive() do
		wait(0)
	local result, button, list, input = sampHasDialogRespond(17127)
	if result and list == 0 then
	sampSendChat("/d Открыты переводы в National Guard San Andreas.")
		wait(2000)
    sampSendChat("/d Подробная информация на Портале штата, в разделе Е.С.П.")
	elseif result and list == 1 then
    sampSendChat("/d Открыты заявление в National Guard San Andreas..")
		wait(2000)
    sampSendChat("/d ..на контрактную службу. Подробнее на нашем портале.")
		elseif result and list == 2 then
	sampSendChat("/d Срочно требуется подкрепление на базу 51. У нас проникновение!")
		elseif result and list == 3 then
	sampSendChat("/d Срочно требуется подкрепление на базу В.М.С. У нас проникновение!")
		end
	end
end

function racia1()

	while sampIsDialogActive() do
		wait(0)
	local result, button, list, input = sampHasDialogRespond(17128)
	if result and list == 0 then
	sampSendChat("/r Внимание, бойцы! На базу 51 совершено проникновение!")
		wait(2000)
	sampSendChat("/r Требуется помощь, очень срочно!")
	elseif result and list == 1 then
	sampSendChat("/r Внимание, бойцы! На базу В.М.С совершено проникновение!")
		wait(2000)
	sampSendChat("/r Требуется помощь, очень срочно!")
	elseif result and list == 2 then
	    sampSendChat("/r // Напоминаю, у нас есть Дискорд.")
		wait(1000)
	sampSendChat("/r // Ссылка: BJG3jhq.")
		end
	end
end

function government1()

	while sampIsDialogActive() do
		wait(0)
	local result, button, list, input = sampHasDialogRespond(17129)
	if result and list == 0 then
	sampSendChat("/d Вещаю!")
		wait(1000)
	sampSendChat("/gov Уважаемые жители штата, сейчас пройдет рекрутирование в Национальную Гвардию.")
		wait(6000)
	sampSendChat("/gov Для поступления на службу требуется. ID-Карта | Навыки | военный билет. Ждем в военкомате.")
		wait(1000)
	sampSendChat("/d Окончил вещание!")
		wait(1000)
	sampSendChat("/time")
	sampAddChatMessage("{FFFFFF}[ Мысли ]: Нужно открыть набор в {f4a460}[ /lmenu ]{FFFFFF}.")
	elseif result and list == 1 then
    sampSendChat("/d Вещаю!")
		wait(1000)
	sampSendChat("/gov Уважаемые жители штата, рекрутирование в Национальную Гвардию завершено.")
		wait(6000)
	sampSendChat("/gov Опоздавших просьба не по являться.")
		wait(1000)
	sampSendChat("/d Окончил вещание!")
		wait(1000)
	sampSendChat("/time")
	sampAddChatMessage("{FFFFFF}[ Мысли ]: Нужно закрыть набор в {f4a460}[ /lmenu ]{FFFFFF}.")
	elseif result and list == 2 then
    sampSendChat("/d Вещаю!")
		wait(1000)
	sampSendChat("/gov Уважаемые жители штата, открыты заявление на Контрактную Службу.")
		wait(6000)
	sampSendChat("/gov Подробная информация на Портале Штата.")
		wait(1000)
	sampSendChat("/d Окончил вещание!")
		wait(1000)
	sampSendChat("/time")
		end
	end
end

function lektcii1()

	while sampIsDialogActive() do
		wait(0)
	local result, button, list, input = sampHasDialogRespond(17130)
	if result and list == 0 then
	sampSendChat("/z Бойцы, приветствую!")
	wait(5000)
	sampSendChat("/me открыв книжку, начал говорить речь.")
	wait(5000)
	sampSendChat("/z Сегодня проведем лекцию о постах.")
	wait(5000)
	sampSendChat("/z Во время занятия поста, обязательно должен быть доклад")
	wait(5000)
	sampSendChat("/z Докладывает Штаб-сержант Плюха. Занимаю пост - вышка возле ВПП. Следующий доклад через 5 минут. Конец связи.")
	wait(5000)
	sampSendChat("/z Докладывает Штаб-сержант Плюха. Пост - вышка. Состояние - (стабильное, критическое). Конец связи.")
	wait(5000)
	sampSendChat("/z Если дали приказ о занятии поста, нет смысла спорить с старшим руководством, и занять пост по приказанию. (имея доклады).")
	wait(5000)
	sampSendChat("/z Докладывать строго каждые 10 минут.")
	wait(5000)
	sampSendChat("/z Эту лекцию я провел для вашего же блага.")
	wait(5000)
	sampSendChat("/z Будьте внимательны, и не перечьте другим бойцам. Все свободны!")
	elseif result and list == 1 then
	sampSendChat("/z Бойцы, приветствую!")
	wait(5000)
	sampSendChat("/me открыв книжку, начал говорить речь.")
	wait(5000)
	sampSendChat("/z Сегодня проведем лекцию по субординации.")
	wait(5000)
	sampSendChat("/z В армии США, вы не должны употреблять жаргон другой армии. У нас нет слов: можно , да , нет , привет.")
	wait(5000)
	sampSendChat("/z Давайте приведу пример. Допустим я Рядовой-курсант, и мне нужно обратиться к старшему составу, чтобы они занялись мной.")
	wait(5000)
	sampSendChat("/z Генерал, Уэйн, разрешите обратиться?")
	wait(5000)
	sampSendChat("/z Таким образом вы не употребляете слова-паразиты, которые не уместны в нашей армии.")
	wait(5000)
	sampSendChat("/z Ко всем обращаться строго по званию, фамилии.")
	wait(5000)
	sampSendChat("/z К примеру: Генерал Ротшильд, дайте последующие указания.")
	wait(5000)
	sampSendChat("/z Обращаться ко всем сослуживцам Строго на Вы, больше никак.")
	wait(5000)
	sampSendChat("/z Запрещено вести спор со старшими по званию.")
	wait(5000)
	sampSendChat("/z За не соблюдение субординации, вы получаете выговор в личное дело, так как это перечит Уставу Министерства Обороны.")
	wait(5000)
	sampSendChat("/z За многократное не соблюдение субординации, боец будет лишен шевронов, и уволен с Нац. Гвардии.")
	wait(5000)
	sampSendChat("/z Эту лекцию я провел для вашего же блага.")
	wait(5000)
	sampSendChat("/z Будьте внимательны, и не перечьте другим бойцам. Все свободны!")
	elseif result and list == 2 then
	sampSendChat("/z Бойцы, приветствую!")
	wait(5000)
	sampSendChat("/me открыв книжку, начал говорить речь.")
	wait(5000)
	sampSendChat("/z Сегодня проведем лекцию по военному транспорту.")
	wait(5000)
	sampSendChat("/z Бойцам армии не имеющим звание Штаб-Сержант, запрещено брать какой либо транспорт NGSA без разрешения старшего состава.")
	wait(5000)
	sampSendChat("/z Наземный транспорт, предназначен для: тренировок, зачисток, парада, мероприятия, охраны.")
	wait(5000)
	sampSendChat("/z Воздушный транспорт брать только после разрешения Генерала. Если на то не было спроса, будет выдан выговор в личное дело.")
	wait(5000)
	sampSendChat("/z Самолеты: Hydra , Rustler брать только для учебного полета, патруля, или по приказу Генерала.")
	wait(5000)
	sampSendChat("/z Эту лекцию я провел для вашего же блага.")
	wait(5000)
	sampSendChat("/z Будьте внимательны, и не перечьте другим бойцам. Все свободны!")
	elseif result and list == 3 then
	sampSendChat("/z Бойцы, приветствую!")
	wait(5000)
	sampSendChat("/me открыв книжку, начал говорить речь.")
	wait(5000)
	sampSendChat("/z Сегодня проведем лекцию по поведению в строю.")
	wait(5000)
	sampSendChat("/z При приказу всеобщего построения, сразу явиться без всякого спора.")
	wait(5000)
	sampSendChat("/z На построение вам даётся: 10 минут для СВ и ВВС, 15 минут для ВМС.")
	wait(5000)
	sampSendChat("/z Если вы не успели попасть в строй во время, вам нужно обратиться к Генералу, Тренеру, попросить прощения за опоздание, и после стать в строй.")
	wait(5000)
	sampSendChat("/z В строю запрещено держать оружие, смотреть на часы, вести диалог, смотреть по сторонам.")
	wait(5000)
	sampSendChat("/z Покидать строй без разрешения нельзя.")
	wait(5000)
	sampSendChat("/z Если вы во время строя увидели нарушение, без спроса не открывать огонь, дождитесь приказания Генерала.")
	wait(5000)
	sampSendChat("/z За не соблюдение этих правил после лекции, он будет наказан.")
	wait(5000)
	sampSendChat("/z Эту лекцию я провел для вашего же блага.")
	wait(5000)
	sampSendChat("/z Будьте внимательны, и не перечьте другим бойцам. Все свободны!")
	elseif result and list == 4 then
	sampSendChat("/z Бойцы, приветствую!")
	wait(5000)
	sampSendChat("/me открыв книжку, начал говорить речь.")
	wait(5000)
	sampSendChat("/z Сегодня проведем лекцию по тренировкам.")
	wait(5000)
	sampSendChat("/z Что такое тренировка? Давайте расскажу.")
	wait(5000)
	sampSendChat("/z Тренировка - физическая, логическая деятельность, направленная на развития вашего разума и силы.")
	wait(5000)
	sampSendChat("/z Правила поведения, запомните их на всю жизнь, как таблицу умножения в школе.")
	wait(5000)
	sampSendChat("/z Первое - слушаться Тренера, и Старших по званию.")
	wait(5000)
	sampSendChat("/z Второе - использовать оружие только по приказу.")
	wait(5000)
	sampSendChat("/z Третье - не покидать строй, только по приказу.")
	wait(5000)
	sampSendChat("/z Четвертое - не перечить Тренеру!")
	wait(5000)
	sampSendChat("/z Пятое - если у вас повреждена мышца, или возникла какая-то травма, вы в праве отпроситься у Тренера на уход с Тренировки.")
	wait(5000)
	sampSendChat("/z Шестое - с разрешения Майора, вы в праве не ехать на тренировку с составом.")
	wait(5000)
	sampSendChat("/z Бойцы, я надеюсь вы все запомнили, если будут вопросы подходите после лекции ко мне. Проведем беседу.")
	wait(5000)
	sampSendChat("/z Эту лекцию я провел для вашего же блага.")
	wait(5000)
	sampSendChat("/z Будьте внимательны, и не перечьте другим бойцам. Все свободны!")
	elseif result and list == 5 then
	sampSendChat("/z Бойцы, приветствую!")
	wait(5000)
	sampSendChat("/me открыв книжку, начал говорить речь.")
	wait(5000)
	sampSendChat("/z Сегодня проведем лекцию для новобранцев.")
	wait(5000)
	sampSendChat("/z Ваша первостепенная задача - защита и охрана базы.")
	wait(5000)
	sampSendChat("/z Покидать базу без предупреждения и в форме - строго выговор, без обсуждений.")
	wait(5000)
	sampSendChat("/z Обеденный перерыв с 12:00 до 14:00, за это время вы успеете заняться своими делами.")
	wait(5000)
	sampSendChat("/z Рабочий день начинается с 8:00 утра до 20:00 вечера.")
	wait(5000)
	sampSendChat("/z Увидев гражданского на базе, стоит узнать его намерения, не обязательно сразу открывать огонь.")
	wait(5000)
	sampSendChat("/z Запрещены споры со старшими по званию.")
	wait(5000)
	sampSendChat("/z Необходимую информацию для прохождения Военной Академии...")
	wait(5000)
	sampSendChat("/z ... вы найдете на официальном портале Штата.")
	wait(5000)
	sampSendChat("/z Эту лекцию я провел для вашего же блага.")
	wait(5000)
	sampSendChat("/z Будьте внимательны, и не перечьте другим бойцам. Все свободны!")
	elseif result and list == 6 then
	sampSendChat("/z Бойцы, приветствую!")
	wait(5000)
	sampSendChat("/me открыв книжку, начал говорить речь.")
	wait(5000)
	sampSendChat("/z Сегодня проведем лекцию о самоволе.")
	wait(5000)
	sampSendChat("/z Каждый боец Нац. Гвардии обязан находить на военной базе в течении рабочего дня.")
	wait(5000)
	sampSendChat("/z Рабочий день начинается с 8:00 до 20:00.")
	wait(5000)
	sampSendChat("/z Для личных дел, дается время с 12:00 до 14:00.")
	wait(5000)
	sampSendChat("/z Если кто-то покидает расположение базы без ведома...")
	wait(5000)
	sampSendChat("/z ...то в его дело заносится выговор.")
	wait(5000)
	sampSendChat("/z Эту лекцию я провел для вашего же блага.")
	wait(5000)
	sampSendChat("/z Будьте внимательны, и не перечьте другим бойцам. Все свободны!")
	elseif result and list == 7 then
	sampSendChat("/z Бойцы, приветствую!")
	wait(5000)
	sampSendChat("/me открыв книжку, начал говорить речь.")
	wait(5000)
	sampSendChat("/z Сегодня проведем лекцию о получении выговоров.")
	wait(5000)
	sampSendChat("/z Слушаем внимательно, и вникаем.")
	wait(5000)
	sampSendChat("/z Выговор можно получить за:")
	wait(5000)
	sampSendChat("/z ...самовольные действия во время несения службы..")
	wait(5000)
	sampSendChat("/z ...сон на посту;...")
	wait(5000)
	sampSendChat("/z ...не цензурная брань в рабочее время, не соблюдение субординации;...")
	wait(5000)
	sampSendChat("/z ...невыполнение приказов старших по званию, неподчинение им;...")
	wait(5000)
	sampSendChat("/z ...нападение на мирных, сослуживцев или сотрудников ПО.")
	wait(5000)
	sampSendChat("/z На этом лекция окончена, советую как можно чаще перечитывать Устав, чтобы...")
	wait(5000)
	sampSendChat("/z ...быть осведомлённым обо всех изменениях и не забывать его пунктов.")
	wait(5000)
	sampSendChat("/z Эту лекцию я провел для вашего же блага.")
	wait(5000)
	sampSendChat("/z Будьте внимательны, и не перечьте другим бойцам. Все свободны!")
	elseif result and list == 8 then
	sampSendChat("/z Бойцы, приветствую!")
	wait(5000)
	sampSendChat("/me открыв книжку, начал говорить речь.")
	wait(5000)
	sampSendChat("/z Сегодня проведем лекцию о запретах.")
	wait(5000)
	sampSendChat("/z Военнослужащему запрещено стрелять без причины по гражданским лицам.")
	wait(5000)
	sampSendChat("/z Бойцу Армии, ниже звания Мл. Лейтенанта запрещено самовольно покидать территорию.")
	wait(5000)
	sampSendChat("/z Военнослужащему запрещено использовать служебный транспорт в личных целях.")
	wait(5000)
	sampSendChat("/z Бойцу Армии запрещено выражаться нецензурной бранью.")
	wait(5000)
	sampSendChat("/z Служащему запрещено нарушать Законы, Уставы, Военный жаргон, Указы Министерства, и ПДД.")
	wait(5000)
	sampSendChat("/z Эту лекцию я провел для вашего же блага.")
	wait(5000)
	sampSendChat("/z Будьте внимательны, и не перечьте другим бойцам. Все свободны!")
	elseif result and list == 9 then
	sampSendChat("/z Бойцы, приветствую!")
	wait(5000)
	sampSendChat("/me открыв книжку, начал говорить речь.")
	wait(5000)
	sampSendChat("/z Сегодня проведем лекцию для бойцов Сухопутных Войск.")
	wait(5000)
	sampSendChat("/z Ваша обязанность следить за территорией базы.")
	wait(5000)
	sampSendChat("/z Слушаться Старших по званию.")
	wait(5000)
	sampSendChat("/z За нарушение Устава СВ, строго выговор в личное дело.")
	wait(5000)
	sampSendChat("/z Обращаться ко своим сослуживцам строго на Вы.")
	wait(5000)
	sampSendChat("/z Запрещено открывать огонь без причины на то.")
	wait(5000)
	sampSendChat("/z Во время занятия поста, нужно обязательно иметь доклады.")
	wait(5000)
	sampSendChat("/z Если вам нужно покинуть базу, и пойти в Штаб, доложите Старшему по званию.")
	wait(5000)
	sampSendChat("/z На этом лекция окончена. Берегите ноги.")
	elseif result and list == 10 then
	sampSendChat("/z Бойцы, приветствую!")
	wait(5000)
	sampSendChat("/me открыв книжку, начал говорить речь.")
	wait(5000)
	sampSendChat("/z Сегодня проведем лекцию для Военно-морских сил..")
	wait(5000)
	sampSendChat("/z За нарушение Устава ВМС, строго выговор в личное дело.")
	wait(5000)
	sampSendChat("/z Ваша обязанность следить за базой, охранять её, и не давать ограбить БП.")
	wait(5000)
	sampSendChat("/z Строго подчиняться Старшему составу.")
	wait(5000)
	sampSendChat("/z Запрещено покидать базу по личным целям в рабочее время.")
	wait(5000)
	sampSendChat("/z Проводить тех. осмотр у лодок, делать улучшения для базы.")
	wait(5000)
	sampSendChat("/z Во время занятия поста, нужно доложить в рацию, в последующими докладами.")
	wait(5000)
	sampSendChat("/z На этом все, всех благ, за работу!")
	elseif result and list == 11 then
	sampSendChat("/z Добрый вечер, Орлы!")
	wait(5000)
	sampSendChat("/z Проведу лекцию для вас.")
	wait(5000)
	sampSendChat("/z Запрещено брать летный транспорт Hydra , Rustler , Nevada в личных цели.")
	wait(5000)
	sampSendChat("/z Не иметь бесполезные споры с Старшим составом и руководством ВВС.")
	wait(5000)
	sampSendChat("/z Следить за ВПП.")
	wait(5000)
	sampSendChat("/z Не нарушать Устав ВВС, за нарушение, выговор в личное дело.")
	wait(5000)
	sampSendChat("/z Помогать Бойцам СВ, ВМС, если на то есть надобность.")
	wait(5000)
	sampSendChat("/z Не оставлять самолеты на гос. аэропортах Штата.")
	wait(5000)
	sampSendChat("/z Перед полетом, надевать форму, строго!")
	wait(5000)
	sampSendChat("/z Перед полетом, осмотреть самолет на тех. неполадки.")
	wait(5000)
	sampSendChat("/z Осматривать колонки с солярой для воздушного транспорта.")
	wait(5000)
	sampSendChat("/z На этом у меня все, если есть вопросы, подходите после лекции, все свободны.")
		end
	end
end

function lektcii(arg)
	sampShowDialog(17130, "{FFFFFF}N.G.S.A Helper | Лекционный раздел", string.format("[ 1 ] Лекция о постах\n[ 2 ] Лекция по субординации\n[ 3 ] Лекция по военному транспорту\n[ 4 ] Лекция по поведению в строю\n[ 5 ] Лекция по поведению во время тренировки \n[ 6 ] Лекция для новобранцев\n[ 7 ] Лекция о самоволе\n[ 8 ] Лекция о получении выговоров\n[ 9 ] Лекция о запретах\n[ 10 ] Лекция для Бойцов СВ\n[ 11 ] Лекция для Пехотинцев ВМС\n[ 12 ] Лекция для Птичек ВВС"), "Выбрать", "Закрыть", 2)
	lua_thread.create(lektcii1)
end

function government(arg)
	sampShowDialog(17129, "{FFFFFF}N.G.S.A Helper | Подача государственной волны", string.format("[ 1 ] О начале призыва\n[ 2 ] О конце призыва\n[ 3 ] О контрактной службе"), "Выбрать", "Закрыть", 2)
	lua_thread.create(government1)
end

function racia(arg)
	sampShowDialog(17128, "{FFFFFF}N.G.S.A Helper | Проникновение", string.format("[ 1 ] Проникновение Зона 51\n[ 2 ] Проникновение В.М.С\n[ 3 ] Дискорд канал"), "Выбрать", "Закрыть", 2)
	lua_thread.create(racia1)
end

function departament(arg)
	sampShowDialog(17127, "{FFFFFF}N.G.S.A Helper | Объявление в чат департамента", string.format("[ 1 ] Перевод\n[ 2 ] Контрактная служба\n[ 3 ] Проникновение Зона 51\n[ 4 ] Проникновение В.М.С"), "Выбрать", "Закрыть", 2)
	lua_thread.create(departament1)
end

function pr(arg)
	sampShowDialog(17126, "{FFFFFF}N.G.S.A Helper | Призыв", string.format("[ 1 ] Приветстствие\n[ 2 ] Проверка документов\n[ 3 ] Вопрос 1\n[ 4 ] Вопрос 2\n[ 5 ] Вопрос 3\n[ 6 ] Вопрос 4\n[ 7 ] Вопрос 5\n[ 8 ] Вопрос 6\n[ 9 ] Вопрос 7\n[ 10 ] Отказ: псих. сост\n[ 11 ] Отказ: Военный билет\n[ 12 ] Отказ: ЧСД/ЧСВ\n[ 13 ] Отказ: Маленький лвл\n[ 14 ] Отказ: Внешний вид\n[ 15 ] Отказ: Проф.непригодность"), "Выбрать", "Закрыть", 2)
	lua_thread.create(prizivinvites)
end

function formavvs(arg)
	sampShowDialog(1717, "{FFFFFF}N.G.S.A Helper | Форма Военно-Воздушных сил", string.format("[ 1 ] Надеть форму\n[ 2 ] Снять форму"), "Выбрать", "", 2)
	lua_thread.create(formavvs1)
end

function ngsa(arg)
    sampShowDialog(1970, "{FFFFFF}N.G.S.A Helper | Информация", textdialog, "*", "", 0)
end

function dpravila(arg)
    sampShowDialog(1971, "{FFFFFF}N.G.S.A Helper | Правила использования чата департамента", praviladepartamenta, "*", "", 0)
end
	
function govpravila(arg)
    sampShowDialog(1976712, "{FFFFFF}N.G.S.A Helper | Правила использования государственной волны", pravilagosvolny2, "*", "", 0)
end

function ydopravila(arg)
    sampShowDialog(1976713, "{FFFFFF}N.G.S.A Helper | Правила Условно-Досрочного-Освобождения", pravilaydo1, "*", "", 0)
end
	
function pravilarank(arg)
    sampShowDialog(1976714, "{FFFFFF}N.G.S.A Helper | Правила повышения ранга во фракции", pravilarank1, "*", "", 0)
end

function autoupdate(json_url, prefix, url)
  local dlstatus = require('moonloader').download_status
  local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
  if doesFileExist(json) then os.remove(json) end
  downloadUrlToFile(json_url, json,
    function(id, status, p1, p2)
      if status == dlstatus.STATUSEX_ENDDOWNLOAD then
        if doesFileExist(json) then
          local f = io.open(json, 'r')
          if f then
            local info = decodeJson(f:read('*a'))
            updatelink = info.updateurl
            updateversion = info.latest
            f:close()
            os.remove(json)
            if updateversion ~= thisScript().version then
              lua_thread.create(function(prefix)
                local dlstatus = require('moonloader').download_status
                local color = -1
                sampAddChatMessage((prefix..'Обнаружено обновление. Пытаюсь обновиться c '..thisScript().version..' на '..updateversion), color)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('Загружено %d из %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      print('Загрузка обновления завершена.')
                      sampAddChatMessage((prefix..'Обновление завершено!'), color)
                      goupdatestatus = true
                      lua_thread.create(function() wait(500) thisScript():reload() end)
                    end
                    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                      if goupdatestatus == nil then
                        sampAddChatMessage((prefix..'Обновление прошло неудачно. Запускаю устаревшую версию..'), color)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
              print('v'..thisScript().version..': Обновление не требуется.')
            end
          end
        else
          print('v'..thisScript().version..': Не могу проверить обновление. Смиритесь или проверьте самостоятельно на '..url)
          update = false
        end
      end
    end
  )
  while update ~= false do wait(100) end
end