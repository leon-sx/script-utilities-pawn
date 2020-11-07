/*
 * Contributors:
 *  leonsx (by include)
 *  Calenzo (TextConverter)
 *  Y_Less (randomEx)
 *  Vision Team and Portal Samp (most utilities taken from there)
 */

GetDate()
{
    new date[36];
    getdate(date[0], date[1], date[2]);
    format(date, 36, "%d/%d/%d", date[2], date[1], date[0]);
    return date;
}

GetHour()
{
    new hour[36];
    gettime(hour[0], hour[1], hour[2]);
    format(date, 36, "%d:%d:%d", hour[0], hour[1], hour[2]);
    return date;
}

VehicleHealth(playerid)
{
    new Float:amount, vehicleid = GetPlayerVehicleID(playerid);
    if (!IsValidVehicle(vehicleid))return 0;
    GetVehicleHealth(vehicleid, amount);
    return floatround(amount, floatround_round);
}

PlayerArmour(playerid)
{
    new Float:amount;
    GetPlayerArmour(playerid, amount);
    return floatround(amount, floatround_round);
}

ShowPlayerDialogEx(playerid, dialogid, style, caption[], info[], string[], button1[], button2[]){
    new str[200];
    format(str, 200, info, string);
    return ShowPlayerDialog(playerid, dialogid, style, caption, str, button1, button2);
}

SendClientMessageEx(playerid, color, const str[], {Float,_}:...)
{
    static
        args,
        start,
        end,
        string[144]
    ;
    #emit LOAD.S.pri 8
    #emit STOR.pri args

    if (args > 12)
    {
        #emit ADDR.pri str
        #emit STOR.pri start

        for (end = start + (args - 12); end > start; end -= 4)
        {
            #emit LREF.pri end
            #emit PUSH.pri
        }
        #emit PUSH.S str
        #emit PUSH.C 144
        #emit PUSH.C string
        #emit PUSH.C args
        #emit SYSREQ.C format

        SendClientMessage(playerid, color, string);

        #emit LCTRL 5
        #emit SCTRL 4
        #emit RETN
    }
    return SendClientMessage(playerid, color, str);
}

Nome(playerid){
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof name);
    return name;
}

TextConverter(string[])
{
    for(new arraysize = 0; arraysize < strlen(string); arraysize++)
    {
        if(strfind(string, "â", true) != -1){new pos = strfind(string, "â", true); strdel(string, pos, pos+strlen("â")); strins(string, "™", pos, sizeof(pos));}
        if(strfind(string, "ã", true) != -1){new pos = strfind(string, "ã", true); strdel(string, pos, pos+strlen("ã")); strins(string, "š", pos, sizeof(pos));}
        if(strfind(string, "á", true) != -1){new pos = strfind(string, "á", true); strdel(string, pos, pos+strlen("á")); strins(string, "˜", pos, sizeof(pos));}
        if(strfind(string, "é", true) != -1){new pos = strfind(string, "é", true); strdel(string, pos, pos+strlen("é")); strins(string, "ž", pos, sizeof(pos));}
        if(strfind(string, "ú", true) != -1){new pos = strfind(string, "ú", true); strdel(string, pos, pos+strlen("ú")); strins(string, "“", pos, sizeof(pos));}
        if(strfind(string, "ó", true) != -1){new pos = strfind(string, "ó", true); strdel(string, pos, pos+strlen("ó")); strins(string, "¦", pos, sizeof(pos));}
        if(strfind(string, "ê", true) != -1){new pos = strfind(string, "ê", true); strdel(string, pos, pos+strlen("ê")); strins(string, "Ÿ", pos, sizeof(pos));}
        if(strfind(string, "í", true) != -1){new pos = strfind(string, "í", true); strdel(string, pos, pos+strlen("í")); strins(string, "¢", pos, sizeof(pos));}
        if(strfind(string, "ç", true) != -1){new pos = strfind(string, "ç", true); strdel(string, pos, pos+strlen("ç")); strins(string, "œ", pos, sizeof(pos));}
        if(strfind(string, "ô", true) != -1){new pos = strfind(string, "ô", true); strdel(string, pos, pos+strlen("ô")); strins(string, "§", pos, sizeof(pos));}
    }
    return 1;
}

stock randomEx(minnum = cellmin, maxnum = cellmax)
    return random(maxnum - minnum + 1) + minnum;// by 