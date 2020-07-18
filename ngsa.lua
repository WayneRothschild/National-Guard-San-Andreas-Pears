script_name("N.G.S.A Helper") -- ��������
script_description("/ngsa - Information") -- � �������
script_version("0.2") -- ������ �������
script_author("enyag and avdeenko") -- ������
require "lib.moonloader" -- ����������� ����������
local memory = require "memory" -- ����������� ��� ������� ����

local textdialog = "{f4a460}________________________________________________________________________________\n\n{f4a460}������� ���� {FFFFFF}[ /cclear ].\n{f4a460}���������� ����� {FFFFFF}[ /pfd ].\n{f4a460}���������� � ��� ������������. {FFFFFF}[ /departament ].\n{f4a460}���������� � ���. �������. {FFFFFF}[ /gos ].\n{f4a460}���������� � ��� �����. {FFFFFF}[ /racia ].\n{f4a460}�������� ��� �������. {FFFFFF}[ /pr ].\n{f4a460}������� ���� ������������� ������������: {FFFFFF}[ /dpravila ].\n{f4a460}����� ������: {FFFFFF}[ /cl ].\n{f4a460}����� ���������� �������: {FFFFFF}[ /zcar ].\n{f4a460}����� ������� ������: {FFFFFF}[ /zavia ].\n{f4a460}�������� ���������� �������: {FFFFFF}[ /th ].\n{f4a460}�������� ������� �������: {FFFFFF}[ /ta ].\n{f4a460}������� ������ ��������������� �����: {FFFFFF}[ /govpravila ].\n{f4a460}������� ������ �������-����������-������������: {FFFFFF}[ /ydopravila ].\n{f4a460}������� ������ �����: {FFFFFF}[ /pravilarank ]\n{f4a460}������ ������� � ����� �.�.� / ��� �����: {FFFFFF}[ /forma ].\n{f4a460}���������� ������: {FFFFFF}[ /lec ].\n\n{f4a460}��������� �������: {FFFFFF}Wayne_Rothschild.\n{f4a460}������� �������: {FFFFFF}Lucifer_Rothschild.\n{f4a460}������� �������: {FFFFFF}Bernard_Rothschild.\n{f4a460}���� �������� �������: {FFFFFF}13.07.2020.\n{f4a460}Instagram ��������� �������: {FFFFFF}_avdeenko_m\n{f4a460}Instagram �������� �������:{FFFFFF} Xrubons\n{f4a460}Instagram �������� �������:{FFFFFF} hellperand\n{f4a460}��������� ��������� �������:{FFFFFF} vk.com/avdeenkoo10\n{f4a460}��������� �������� �������:{FFFFFF} vk.com/\n{f4a460}��������� �������� �������:{FFFFFF} vk.com/pluha28003\n{f4a460}________________________________________________________________________________"
local praviladepartamenta = "{f4a460}________________________________________________________________________________\n\n{FFFFFF}[ 1 ]{f4a460} ��������� ��������� ������� � OOC � {FFFFFF}7:00 {f4a460}�� {FFFFFF}22:00{f4a460}\n{FFFFFF}[ 2 ]{f4a460} ��������� ���������� � �������/������� ���������.\n{FFFFFF}[ 3 ]{f4a460} ��������� ����������� � ������� ����������� ������������.\n{FFFFFF}[ 4 ]{f4a460} ��������� ������������ ������������� �������. {FFFFFF}[ ���/MG ]{f4a460}\n{FFFFFF}[ 5 ]{f4a460} ��������� OOC �����������.\n{FFFFFF}[ 6 ]{f4a460} ��������� ������������ ����� ������������ {FFFFFF}������{f4a460} ���������� � ���.����������.\n{FFFFFF}| ���������� {f4a460}��� ����������� �����: {FFFFFF}��{f4a460}, {FFFFFF}���������� �� ��������� {f4a460}\n{FFFFFF}[ 7 ]{f4a460} ��������� ������� ���, ���� �� ��� ����� �� ��������, ���� ���� ������� ��������� ��� �� ��������.\n{FFFFFF}[ 8 ]{f4a460} �������� ���������� �����.\n{FFFFFF}[ 9 ]{f4a460} ��������� ������� �� � ������� ����������\n                            {FFFFFF}�� ��������� ������ ����� ������������ ��������� ������ ��������� � ����:\n{FFFFFF}[ 1 ]{f4a460} ��������� ������� � �������� ������ - {FFFFFF}������������ ����� �� 20 �����.\n{FFFFFF}[ 2 ]{f4a460} ���������� � �������/������� ��������� - {FFFFFF}������������ ����� �� 30 �����.\n{FFFFFF}[ 3 ]{f4a460} ����������� � ������� ����������� ������������ - {FFFFFF}������������ ����� �� 30 �����.\n{FFFFFF}[ 4 ]{f4a460} ������������ ������������� ������� - {FFFFFF}������������ ����� �� 20 �����.\n{FFFFFF}[ 5 ]{f4a460} OOC ����������� - {FFFFFF}������������ ����� �� 20 �����.\n{FFFFFF}[ 6 ]{f4a460} ������������ ����� ������������ ������ ���������� � ���.���������� - {FFFFFF}������������ ����� �� 30 �����.\n{FFFFFF}[ 7 ]{f4a460} ���������� ����� � ���� ������ - {FFFFFF}������������ ����� �� 30 �����.\n{FFFFFF}[ 8 ]{f4a460} ��������� ������������ - {FFFFFF}������������ ����� �� 20 �����.\n{FFFFFF}[ 9 ]{f4a460} ��������� ��� - {FFFFFF}������������ ����� �� 30 �����.\n"
local pravilagosvolny2 = "{f4a460}________________________________________________________________________________\n\n{FFFFFF}[ 1 ]{f4a460} �������� ����� ������� ���.����� - {FFFFFF}10 �����\n{FFFFFF}[ 2 ]{f4a460} �������� ������ ���.����� (�������� � ��� �� �������) - {FFFFFF}20 �����\n{FFFFFF}[ 3 ]{f4a460} �������� ������� ���.����� (�������� � ��� �� �������)- {FFFFFF}5 �����\n{FFFFFF}[ 4 ]{f4a460} ���.������� � ���������� �������� �������� ��� �������.\n{FFFFFF}[ 5 ]{f4a460} ������������ ���������� ������� {FFFFFF}[/gov ] {f4a460}- {FFFFFF}2.\n{FFFFFF}[ 6 ]{f4a460} ��� ����� �������� �������� �� ����� �� �� �����,������� �� ������ ������\n{FFFFFF}[ 7 ]{f4a460} ��� ������� ������� �������� ���.����� ���� �������� ���������.\n{FFFFFF}[ 8 ]{f4a460} ����������� ����� �������� �� ��������� ������.\n{FFFFFF}[ 9 ]{f4a460} ��� ������ �� ������ ���.�����,��� ����� ��������� ���������� � ���,��� �������� ����� � ���� �����������.\n{FFFFFF}[ 10 ]{f4a460} ����� ����,��� �� ��������� ����������,������� ������� /lmenu � ������� ����� '{1ee01c}����� [������]{f4a460} '\n{FFFFFF}[ 11 ]{f4a460} �� ����� ���������� ������ ���������� ����� � /lmenu '{1ee01c}�����{f4a460}' ��������\n{FFFFFF}[ 12 ]{f4a460}  ����� ��������� ������,����� ������� /lmenu � �������� ����� ����� '�����' � ������ ���� �������� '{ff1100}����� [������]{f4a460}'\n{FFFFFF}[ 13 ]{f4a460} �������� � ���.����� � ���,��� �� ��������� ����� � ���� �����������.\n"
local pravilaydo1 = "{f4a460}________________________________________________________________________________\n\n{FFFFFF}[ 1 ]{f4a460} ����������� ������ �������� ����� ���� � ������,�� ��������� ������� �������� ������������������ ��������.\n{FFFFFF}[ 2 ]{f4a460} ����������� �� ������ ���� ������� �� ��������� ������:\n{FFFFFF}| �������� (2.1, 2.2, 2.3) | ��������� (7.1) ����� ���� ������, ���������� �����, ������������� � ������������� � ����� ����� (17.2 � 17.1), � ���-�� �� ������ ��������� (Z. CS, 16.7).\n{FFFFFF}[ 3 ]{f4a460} �� ��������� ������ ��� ��� ������������ ������ �������, �������� ������������ ���������� �������������� � ���������� ����� �� 30 �����.\n{FFFFFF}[ 4 ]{f4a460} ���� ����������� ��� ������� �� ������ 1.4 (��������� �� ���. ����), ���������� ������� ��� �������� ������ � ������ (1-30�) ����� ������ ����� - 50.000$\n{FFFFFF}[ 5 ]{f4a460} �������� ��������� ��������� �� ��������������� �������� ���������� ������� ������� �����.\n"
local pravilarank1 = "{f4a460}________________________________________________________________________________\n\n{FFFFFF}[ 1 ]{f4a460} ������ ��������� � {FFFFFF}1 {f4a460}�� {FFFFFF}2 {f4a460}�������� ����� ���� ����� ����� ������� �� ������� ( ���� ���������� )\n{FFFFFF}[ 2 ]{f4a460}��������� �� {FFFFFF}2 {f4a460}�� {FFFFFF}3 {f4a460}����������� ����� ���� ����� ����� ��������� ������� ������\n{FFFFFF}[ 3 ]{f4a460}��������� � {FFFFFF}3 {f4a460}�� {FFFFFF}5 {f4a460}����������� ����� ������� ����� ����� ��������� ���������� ������ ������ ��� �� �������� [ {FFFFFF}������ ��� ������ ������� : NGSA , PD {f4a460}]\n{FFFFFF}[ 4 ]{f4a460} ��������� ��� {FFFFFF}6 {f4a460}������ � ���� ���������� ������ �� ��������\n"

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then return end -- �������� �� ������ ����� � ����������
    autoupdate("https://github.com/WayneRothschild/National-Guard-San-Andreas-Pears/", '['..string.upper(thisScript().name)..']: ', "https://github.com/WayneRothschild/National-Guard-San-Andreas-Pears/")
    while not isSampAvailable() do wait(100) end
	
	sampAddChatMessage("{FFFFFF}*{f4a460}������� ������� �����, ������������ {FFFFFF}N.G.S.A Helper. {f4a460}������ �������: {FFFFFF}0.1 ")
    sampAddChatMessage("{FFFFFF}*{f4a460}National Guard San Andreas | {FFFFFF}Pears Project. {f4a460}��������� � �������: {FFFFFF}/ngsa", 0xC1C1C1)

-- ������� �������
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
        -- ��� ����������� ����, ��� ������ �������, ������� � ������
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
			else sampAddChatMessage("{FFFFFF}[ ����� ]: ���������� ����� ������ {f4a460}[ /pfd ID ]{FFFFFF}.", -1)
			end
		else sampAddChatMessage("{FFFFFF}[ ����� ]: ������ ����� {f4a460}�� � ����{FFFFFF}.", -1)
		end
	else
		sampAddChatMessage("{FFFFFF}[ ����� ]: ���������� ����� {f4a460}���������{FFFFFF}.", -1)
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
		sampSendChat("/me ����� �������.")
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
		sampSendChat("������ ����, ���.")
			wait(1000)
		sampSendChat("/ame �������� �������� �����������.")
			wait(2000)
		sampSendChat("������� � ����� ��������������?")
	elseif result and list == 1 then
		sampSendChat("������, ���. � ������ ��������� �� ���� ���������.")
			wait(2000)
		sampSendChat("���� ���� ������, ��: ID-�����, ������.")
	elseif result and list == 2 then
		sampSendChat("������ ������.")
			wait(2000)
		sampSendChat("��� ��������� � ���� ��� �������?")
	elseif result and list == 3 then
		sampSendChat("������ ������.")
			wait(2000)
		sampSendChat("����������� � �������� �����?")
	elseif result and list == 4 then
		sampSendChat("������ ������.")
			wait(2000)
		sampSendChat("������� ��� ���������� � �����?")
	elseif result and list == 5 then
		sampSendChat("������ ���������.")
			wait(2000)
		sampSendChat("����� ����� ������?")
	elseif result and list == 6 then
		sampSendChat("������ �����.")
			wait(2000)
		sampSendChat("������� ������� �����?")
	elseif result and list == 7 then
		sampSendChat("������ ������.")
			wait(2000)
		sampSendChat("������ ������ ������������ �������?")
	elseif result and list == 8 then
		sampSendChat("������ �������.")
			wait(2000)
		sampSendChat("��� ���������� � �������?")
	elseif result and list == 9 then
		sampSendChat("��������, �� �� ��� �� ��������� ��-�� ������� ������������ ���������.")
	elseif result and list == 10 then
		sampSendChat("��������, �� �� ��� �� ��������� ��-�� ���������� �������� ������.")
	elseif result and list == 11 then
		sampSendChat("��������, �� �� ��� �� ��������� ��-�� ���������� � ������ ������")
		wait(500)
		sampSendChat("/b ������ ������ ���������� ��� ������ ������ ������������")
	elseif result and list == 12 then
		sampSendChat("��������, �� �� ��� �� ��������� ��-�� ������ ����� ���������� � �����.")
		wait(500)
		sampSendChat("/b � ��� ����� ������ ���� ������� ���� 3.")
	elseif result and list == 13 then
		sampSendChat("��������, �� �� ��� �� ��������� ��-�� �������� �������� ����.")
	elseif result and list == 14 then
		sampSendChat("��������, �� �� ��� �� ��������� ��-�� ����.�������������.")
		wait(500)
		sampSendChat("/b �� �� ����������� ��.")
		end
	end
end

function departament1()

	while sampIsDialogActive() do
		wait(0)
	local result, button, list, input = sampHasDialogRespond(17127)
	if result and list == 0 then
	sampSendChat("/d ������� �������� � National Guard San Andreas.")
		wait(2000)
    sampSendChat("/d ��������� ���������� �� ������� �����, � ������� �.�.�.")
	elseif result and list == 1 then
    sampSendChat("/d ������� ��������� � National Guard San Andreas..")
		wait(2000)
    sampSendChat("/d ..�� ����������� ������. ��������� �� ����� �������.")
		elseif result and list == 2 then
	sampSendChat("/d ������ ��������� ������������ �� ���� 51. � ��� �������������!")
		elseif result and list == 3 then
	sampSendChat("/d ������ ��������� ������������ �� ���� �.�.�. � ��� �������������!")
		end
	end
end

function racia1()

	while sampIsDialogActive() do
		wait(0)
	local result, button, list, input = sampHasDialogRespond(17128)
	if result and list == 0 then
	sampSendChat("/r ��������, �����! �� ���� 51 ��������� �������������!")
		wait(2000)
	sampSendChat("/r ��������� ������, ����� ������!")
	elseif result and list == 1 then
	sampSendChat("/r ��������, �����! �� ���� �.�.� ��������� �������������!")
		wait(2000)
	sampSendChat("/r ��������� ������, ����� ������!")
	elseif result and list == 2 then
	    sampSendChat("/r // ���������, � ��� ���� �������.")
		wait(1000)
	sampSendChat("/r // ������: BJG3jhq.")
		end
	end
end

function government1()

	while sampIsDialogActive() do
		wait(0)
	local result, button, list, input = sampHasDialogRespond(17129)
	if result and list == 0 then
	sampSendChat("/d �����!")
		wait(1000)
	sampSendChat("/gov ��������� ������ �����, ������ ������� �������������� � ������������ �������.")
		wait(6000)
	sampSendChat("/gov ��� ����������� �� ������ ���������. ID-����� | ������ | ������� �����. ���� � ����������.")
		wait(1000)
	sampSendChat("/d ������� �������!")
		wait(1000)
	sampSendChat("/time")
	sampAddChatMessage("{FFFFFF}[ ����� ]: ����� ������� ����� � {f4a460}[ /lmenu ]{FFFFFF}.")
	elseif result and list == 1 then
    sampSendChat("/d �����!")
		wait(1000)
	sampSendChat("/gov ��������� ������ �����, �������������� � ������������ ������� ���������.")
		wait(6000)
	sampSendChat("/gov ���������� ������� �� �� ��������.")
		wait(1000)
	sampSendChat("/d ������� �������!")
		wait(1000)
	sampSendChat("/time")
	sampAddChatMessage("{FFFFFF}[ ����� ]: ����� ������� ����� � {f4a460}[ /lmenu ]{FFFFFF}.")
	elseif result and list == 2 then
    sampSendChat("/d �����!")
		wait(1000)
	sampSendChat("/gov ��������� ������ �����, ������� ��������� �� ����������� ������.")
		wait(6000)
	sampSendChat("/gov ��������� ���������� �� ������� �����.")
		wait(1000)
	sampSendChat("/d ������� �������!")
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
	sampSendChat("/z �����, �����������!")
	wait(5000)
	sampSendChat("/me ������ ������, ����� �������� ����.")
	wait(5000)
	sampSendChat("/z ������� �������� ������ � ������.")
	wait(5000)
	sampSendChat("/z �� ����� ������� �����, ����������� ������ ���� ������")
	wait(5000)
	sampSendChat("/z ����������� ����-������� �����. ������� ���� - ����� ����� ���. ��������� ������ ����� 5 �����. ����� �����.")
	wait(5000)
	sampSendChat("/z ����������� ����-������� �����. ���� - �����. ��������� - (����������, �����������). ����� �����.")
	wait(5000)
	sampSendChat("/z ���� ���� ������ � ������� �����, ��� ������ ������� � ������� ������������, � ������ ���� �� ����������. (���� �������).")
	wait(5000)
	sampSendChat("/z ����������� ������ ������ 10 �����.")
	wait(5000)
	sampSendChat("/z ��� ������ � ������ ��� ������ �� �����.")
	wait(5000)
	sampSendChat("/z ������ �����������, � �� �������� ������ ������. ��� ��������!")
	elseif result and list == 1 then
	sampSendChat("/z �����, �����������!")
	wait(5000)
	sampSendChat("/me ������ ������, ����� �������� ����.")
	wait(5000)
	sampSendChat("/z ������� �������� ������ �� ������������.")
	wait(5000)
	sampSendChat("/z � ����� ���, �� �� ������ ����������� ������ ������ �����. � ��� ��� ����: ����� , �� , ��� , ������.")
	wait(5000)
	sampSendChat("/z ������� ������� ������. �������� � �������-�������, � ��� ����� ���������� � �������� �������, ����� ��� �������� ����.")
	wait(5000)
	sampSendChat("/z �������, ����, ��������� ����������?")
	wait(5000)
	sampSendChat("/z ����� ������� �� �� ������������ �����-��������, ������� �� ������� � ����� �����.")
	wait(5000)
	sampSendChat("/z �� ���� ���������� ������ �� ������, �������.")
	wait(5000)
	sampSendChat("/z � �������: ������� ��������, ����� ����������� ��������.")
	wait(5000)
	sampSendChat("/z ���������� �� ���� ����������� ������ �� ��, ������ �����.")
	wait(5000)
	sampSendChat("/z ��������� ����� ���� �� �������� �� ������.")
	wait(5000)
	sampSendChat("/z �� �� ���������� ������������, �� ��������� ������� � ������ ����, ��� ��� ��� ������� ������ ������������ �������.")
	wait(5000)
	sampSendChat("/z �� ������������ �� ���������� ������������, ���� ����� ����� ��������, � ������ � ���. �������.")
	wait(5000)
	sampSendChat("/z ��� ������ � ������ ��� ������ �� �����.")
	wait(5000)
	sampSendChat("/z ������ �����������, � �� �������� ������ ������. ��� ��������!")
	elseif result and list == 2 then
	sampSendChat("/z �����, �����������!")
	wait(5000)
	sampSendChat("/me ������ ������, ����� �������� ����.")
	wait(5000)
	sampSendChat("/z ������� �������� ������ �� �������� ����������.")
	wait(5000)
	sampSendChat("/z ������ ����� �� ������� ������ ����-�������, ��������� ����� ����� ���� ��������� NGSA ��� ���������� �������� �������.")
	wait(5000)
	sampSendChat("/z �������� ���������, ������������ ���: ����������, ��������, ������, �����������, ������.")
	wait(5000)
	sampSendChat("/z ��������� ��������� ����� ������ ����� ���������� ��������. ���� �� �� �� ���� ������, ����� ����� ������� � ������ ����.")
	wait(5000)
	sampSendChat("/z ��������: Hydra , Rustler ����� ������ ��� �������� ������, �������, ��� �� ������� ��������.")
	wait(5000)
	sampSendChat("/z ��� ������ � ������ ��� ������ �� �����.")
	wait(5000)
	sampSendChat("/z ������ �����������, � �� �������� ������ ������. ��� ��������!")
	elseif result and list == 3 then
	sampSendChat("/z �����, �����������!")
	wait(5000)
	sampSendChat("/me ������ ������, ����� �������� ����.")
	wait(5000)
	sampSendChat("/z ������� �������� ������ �� ��������� � �����.")
	wait(5000)
	sampSendChat("/z ��� ������� ��������� ����������, ����� ������� ��� ������� �����.")
	wait(5000)
	sampSendChat("/z �� ���������� ��� �����: 10 ����� ��� �� � ���, 15 ����� ��� ���.")
	wait(5000)
	sampSendChat("/z ���� �� �� ������ ������� � ����� �� �����, ��� ����� ���������� � ��������, �������, ��������� �������� �� ���������, � ����� ����� � �����.")
	wait(5000)
	sampSendChat("/z � ����� ��������� ������� ������, �������� �� ����, ����� ������, �������� �� ��������.")
	wait(5000)
	sampSendChat("/z �������� ����� ��� ���������� ������.")
	wait(5000)
	sampSendChat("/z ���� �� �� ����� ����� ������� ���������, ��� ������ �� ��������� �����, ��������� ���������� ��������.")
	wait(5000)
	sampSendChat("/z �� �� ���������� ���� ������ ����� ������, �� ����� �������.")
	wait(5000)
	sampSendChat("/z ��� ������ � ������ ��� ������ �� �����.")
	wait(5000)
	sampSendChat("/z ������ �����������, � �� �������� ������ ������. ��� ��������!")
	elseif result and list == 4 then
	sampSendChat("/z �����, �����������!")
	wait(5000)
	sampSendChat("/me ������ ������, ����� �������� ����.")
	wait(5000)
	sampSendChat("/z ������� �������� ������ �� �����������.")
	wait(5000)
	sampSendChat("/z ��� ����� ����������? ������� ��������.")
	wait(5000)
	sampSendChat("/z ���������� - ����������, ���������� ������������, ������������ �� �������� ������ ������ � ����.")
	wait(5000)
	sampSendChat("/z ������� ���������, ��������� �� �� ��� �����, ��� ������� ��������� � �����.")
	wait(5000)
	sampSendChat("/z ������ - ��������� �������, � ������� �� ������.")
	wait(5000)
	sampSendChat("/z ������ - ������������ ������ ������ �� �������.")
	wait(5000)
	sampSendChat("/z ������ - �� �������� �����, ������ �� �������.")
	wait(5000)
	sampSendChat("/z ��������� - �� �������� �������!")
	wait(5000)
	sampSendChat("/z ����� - ���� � ��� ���������� �����, ��� �������� �����-�� ������, �� � ����� ����������� � ������� �� ���� � ����������.")
	wait(5000)
	sampSendChat("/z ������ - � ���������� ������, �� � ����� �� ����� �� ���������� � ��������.")
	wait(5000)
	sampSendChat("/z �����, � ������� �� ��� ���������, ���� ����� ������� ��������� ����� ������ �� ���. �������� ������.")
	wait(5000)
	sampSendChat("/z ��� ������ � ������ ��� ������ �� �����.")
	wait(5000)
	sampSendChat("/z ������ �����������, � �� �������� ������ ������. ��� ��������!")
	elseif result and list == 5 then
	sampSendChat("/z �����, �����������!")
	wait(5000)
	sampSendChat("/me ������ ������, ����� �������� ����.")
	wait(5000)
	sampSendChat("/z ������� �������� ������ ��� �����������.")
	wait(5000)
	sampSendChat("/z ���� �������������� ������ - ������ � ������ ����.")
	wait(5000)
	sampSendChat("/z �������� ���� ��� �������������� � � ����� - ������ �������, ��� ����������.")
	wait(5000)
	sampSendChat("/z ��������� ������� � 12:00 �� 14:00, �� ��� ����� �� ������� �������� ������ ������.")
	wait(5000)
	sampSendChat("/z ������� ���� ���������� � 8:00 ���� �� 20:00 ������.")
	wait(5000)
	sampSendChat("/z ������ ������������ �� ����, ����� ������ ��� ���������, �� ����������� ����� ��������� �����.")
	wait(5000)
	sampSendChat("/z ��������� ����� �� �������� �� ������.")
	wait(5000)
	sampSendChat("/z ����������� ���������� ��� ����������� ������� ��������...")
	wait(5000)
	sampSendChat("/z ... �� ������� �� ����������� ������� �����.")
	wait(5000)
	sampSendChat("/z ��� ������ � ������ ��� ������ �� �����.")
	wait(5000)
	sampSendChat("/z ������ �����������, � �� �������� ������ ������. ��� ��������!")
	elseif result and list == 6 then
	sampSendChat("/z �����, �����������!")
	wait(5000)
	sampSendChat("/me ������ ������, ����� �������� ����.")
	wait(5000)
	sampSendChat("/z ������� �������� ������ � ��������.")
	wait(5000)
	sampSendChat("/z ������ ���� ���. ������� ������ �������� �� ������� ���� � ������� �������� ���.")
	wait(5000)
	sampSendChat("/z ������� ���� ���������� � 8:00 �� 20:00.")
	wait(5000)
	sampSendChat("/z ��� ������ ���, ������ ����� � 12:00 �� 14:00.")
	wait(5000)
	sampSendChat("/z ���� ���-�� �������� ������������ ���� ��� ������...")
	wait(5000)
	sampSendChat("/z ...�� � ��� ���� ��������� �������.")
	wait(5000)
	sampSendChat("/z ��� ������ � ������ ��� ������ �� �����.")
	wait(5000)
	sampSendChat("/z ������ �����������, � �� �������� ������ ������. ��� ��������!")
	elseif result and list == 7 then
	sampSendChat("/z �����, �����������!")
	wait(5000)
	sampSendChat("/me ������ ������, ����� �������� ����.")
	wait(5000)
	sampSendChat("/z ������� �������� ������ � ��������� ���������.")
	wait(5000)
	sampSendChat("/z ������� �����������, � �������.")
	wait(5000)
	sampSendChat("/z ������� ����� �������� ��:")
	wait(5000)
	sampSendChat("/z ...����������� �������� �� ����� ������� ������..")
	wait(5000)
	sampSendChat("/z ...��� �� �����;...")
	wait(5000)
	sampSendChat("/z ...�� ��������� ����� � ������� �����, �� ���������� ������������;...")
	wait(5000)
	sampSendChat("/z ...������������ �������� ������� �� ������, ������������ ��;...")
	wait(5000)
	sampSendChat("/z ...��������� �� ������, ����������� ��� ����������� ��.")
	wait(5000)
	sampSendChat("/z �� ���� ������ ��������, ������� ��� ����� ���� ������������ �����, �����...")
	wait(5000)
	sampSendChat("/z ...���� ������������ ��� ���� ���������� � �� �������� ��� �������.")
	wait(5000)
	sampSendChat("/z ��� ������ � ������ ��� ������ �� �����.")
	wait(5000)
	sampSendChat("/z ������ �����������, � �� �������� ������ ������. ��� ��������!")
	elseif result and list == 8 then
	sampSendChat("/z �����, �����������!")
	wait(5000)
	sampSendChat("/me ������ ������, ����� �������� ����.")
	wait(5000)
	sampSendChat("/z ������� �������� ������ � ��������.")
	wait(5000)
	sampSendChat("/z ��������������� ��������� �������� ��� ������� �� ����������� �����.")
	wait(5000)
	sampSendChat("/z ����� �����, ���� ������ ��. ���������� ��������� ���������� �������� ����������.")
	wait(5000)
	sampSendChat("/z ��������������� ��������� ������������ ��������� ��������� � ������ �����.")
	wait(5000)
	sampSendChat("/z ����� ����� ��������� ���������� ����������� ������.")
	wait(5000)
	sampSendChat("/z ��������� ��������� �������� ������, ������, ������� ������, ����� ������������, � ���.")
	wait(5000)
	sampSendChat("/z ��� ������ � ������ ��� ������ �� �����.")
	wait(5000)
	sampSendChat("/z ������ �����������, � �� �������� ������ ������. ��� ��������!")
	elseif result and list == 9 then
	sampSendChat("/z �����, �����������!")
	wait(5000)
	sampSendChat("/me ������ ������, ����� �������� ����.")
	wait(5000)
	sampSendChat("/z ������� �������� ������ ��� ������ ���������� �����.")
	wait(5000)
	sampSendChat("/z ���� ����������� ������� �� ����������� ����.")
	wait(5000)
	sampSendChat("/z ��������� ������� �� ������.")
	wait(5000)
	sampSendChat("/z �� ��������� ������ ��, ������ ������� � ������ ����.")
	wait(5000)
	sampSendChat("/z ���������� �� ����� ����������� ������ �� ��.")
	wait(5000)
	sampSendChat("/z ��������� ��������� ����� ��� ������� �� ��.")
	wait(5000)
	sampSendChat("/z �� ����� ������� �����, ����� ����������� ����� �������.")
	wait(5000)
	sampSendChat("/z ���� ��� ����� �������� ����, � ����� � ����, �������� �������� �� ������.")
	wait(5000)
	sampSendChat("/z �� ���� ������ ��������. �������� ����.")
	elseif result and list == 10 then
	sampSendChat("/z �����, �����������!")
	wait(5000)
	sampSendChat("/me ������ ������, ����� �������� ����.")
	wait(5000)
	sampSendChat("/z ������� �������� ������ ��� ������-������� ���..")
	wait(5000)
	sampSendChat("/z �� ��������� ������ ���, ������ ������� � ������ ����.")
	wait(5000)
	sampSendChat("/z ���� ����������� ������� �� �����, �������� �, � �� ������ �������� ��.")
	wait(5000)
	sampSendChat("/z ������ ����������� �������� �������.")
	wait(5000)
	sampSendChat("/z ��������� �������� ���� �� ������ ����� � ������� �����.")
	wait(5000)
	sampSendChat("/z ��������� ���. ������ � �����, ������ ��������� ��� ����.")
	wait(5000)
	sampSendChat("/z �� ����� ������� �����, ����� �������� � �����, � ������������ ���������.")
	wait(5000)
	sampSendChat("/z �� ���� ���, ���� ����, �� ������!")
	elseif result and list == 11 then
	sampSendChat("/z ������ �����, ����!")
	wait(5000)
	sampSendChat("/z ������� ������ ��� ���.")
	wait(5000)
	sampSendChat("/z ��������� ����� ������ ��������� Hydra , Rustler , Nevada � ������ ����.")
	wait(5000)
	sampSendChat("/z �� ����� ����������� ����� � ������� �������� � ������������ ���.")
	wait(5000)
	sampSendChat("/z ������� �� ���.")
	wait(5000)
	sampSendChat("/z �� �������� ����� ���, �� ���������, ������� � ������ ����.")
	wait(5000)
	sampSendChat("/z �������� ������ ��, ���, ���� �� �� ���� ����������.")
	wait(5000)
	sampSendChat("/z �� ��������� �������� �� ���. ���������� �����.")
	wait(5000)
	sampSendChat("/z ����� �������, �������� �����, ������!")
	wait(5000)
	sampSendChat("/z ����� �������, ��������� ������� �� ���. ���������.")
	wait(5000)
	sampSendChat("/z ����������� ������� � ������� ��� ���������� ����������.")
	wait(5000)
	sampSendChat("/z �� ���� � ���� ���, ���� ���� �������, ��������� ����� ������, ��� ��������.")
		end
	end
end

function lektcii(arg)
	sampShowDialog(17130, "{FFFFFF}N.G.S.A Helper | ���������� ������", string.format("[ 1 ] ������ � ������\n[ 2 ] ������ �� ������������\n[ 3 ] ������ �� �������� ����������\n[ 4 ] ������ �� ��������� � �����\n[ 5 ] ������ �� ��������� �� ����� ���������� \n[ 6 ] ������ ��� �����������\n[ 7 ] ������ � ��������\n[ 8 ] ������ � ��������� ���������\n[ 9 ] ������ � ��������\n[ 10 ] ������ ��� ������ ��\n[ 11 ] ������ ��� ���������� ���\n[ 12 ] ������ ��� ������ ���"), "�������", "�������", 2)
	lua_thread.create(lektcii1)
end

function government(arg)
	sampShowDialog(17129, "{FFFFFF}N.G.S.A Helper | ������ ��������������� �����", string.format("[ 1 ] � ������ �������\n[ 2 ] � ����� �������\n[ 3 ] � ����������� ������"), "�������", "�������", 2)
	lua_thread.create(government1)
end

function racia(arg)
	sampShowDialog(17128, "{FFFFFF}N.G.S.A Helper | �������������", string.format("[ 1 ] ������������� ���� 51\n[ 2 ] ������������� �.�.�\n[ 3 ] ������� �����"), "�������", "�������", 2)
	lua_thread.create(racia1)
end

function departament(arg)
	sampShowDialog(17127, "{FFFFFF}N.G.S.A Helper | ���������� � ��� ������������", string.format("[ 1 ] �������\n[ 2 ] ����������� ������\n[ 3 ] ������������� ���� 51\n[ 4 ] ������������� �.�.�"), "�������", "�������", 2)
	lua_thread.create(departament1)
end

function pr(arg)
	sampShowDialog(17126, "{FFFFFF}N.G.S.A Helper | ������", string.format("[ 1 ] �������������\n[ 2 ] �������� ����������\n[ 3 ] ������ 1\n[ 4 ] ������ 2\n[ 5 ] ������ 3\n[ 6 ] ������ 4\n[ 7 ] ������ 5\n[ 8 ] ������ 6\n[ 9 ] ������ 7\n[ 10 ] �����: ����. ����\n[ 11 ] �����: ������� �����\n[ 12 ] �����: ���/���\n[ 13 ] �����: ��������� ���\n[ 14 ] �����: ������� ���\n[ 15 ] �����: ����.�������������"), "�������", "�������", 2)
	lua_thread.create(prizivinvites)
end

function formavvs(arg)
	sampShowDialog(1717, "{FFFFFF}N.G.S.A Helper | ����� ������-��������� ���", string.format("[ 1 ] ������ �����\n[ 2 ] ����� �����"), "�������", "", 2)
	lua_thread.create(formavvs1)
end

function ngsa(arg)
    sampShowDialog(1970, "{FFFFFF}N.G.S.A Helper | ����������", textdialog, "*", "", 0)
end

function dpravila(arg)
    sampShowDialog(1971, "{FFFFFF}N.G.S.A Helper | ������� ������������� ���� ������������", praviladepartamenta, "*", "", 0)
end
	
function govpravila(arg)
    sampShowDialog(1976712, "{FFFFFF}N.G.S.A Helper | ������� ������������� ��������������� �����", pravilagosvolny2, "*", "", 0)
end

function ydopravila(arg)
    sampShowDialog(1976713, "{FFFFFF}N.G.S.A Helper | ������� �������-����������-������������", pravilaydo1, "*", "", 0)
end
	
function pravilarank(arg)
    sampShowDialog(1976714, "{FFFFFF}N.G.S.A Helper | ������� ��������� ����� �� �������", pravilarank1, "*", "", 0)
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
                sampAddChatMessage((prefix..'���������� ����������. ������� ���������� c '..thisScript().version..' �� '..updateversion), color)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('��������� %d �� %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      print('�������� ���������� ���������.')
                      sampAddChatMessage((prefix..'���������� ���������!'), color)
                      goupdatestatus = true
                      lua_thread.create(function() wait(500) thisScript():reload() end)
                    end
                    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                      if goupdatestatus == nil then
                        sampAddChatMessage((prefix..'���������� ������ ��������. �������� ���������� ������..'), color)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
              print('v'..thisScript().version..': ���������� �� ���������.')
            end
          end
        else
          print('v'..thisScript().version..': �� ���� ��������� ����������. ��������� ��� ��������� �������������� �� '..url)
          update = false
        end
      end
    end
  )
  while update ~= false do wait(100) end
end