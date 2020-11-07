# Utilities to program the pawn language
## Some utilities to facilitate your daily programming

# How to use
 Note: if any utility does not work correctly contact me

## GetDate()
```pawn
  new string[200];
  format(string, 200, "Date: %s", GetDate());
```

## GetHour()
```pawn
  new string[200];
  format(string, 200, "Hour: %s", GetHour());
```

## VehicleHealth(playerid)
```pawn
  new string[200];
  format(string, 200, "Vehicle Health: %s", VehicleHealth(playerid));
```

## PlayerArmour(playerid)
```pawn
  new string[200];
  format(string, 200, "Armour Health: %.1f", VehicleHealth(playerid));
```

## ShowPlayerDialogEx(playerid, dialogid, style, caption[], info[], string[], button1[], button2[])
```pawn
  new string[200];
  ShowPlayerDialogEx(playerid, 1, DIALOG_STYLE_MSGBOX, "Example", "Eu sou %s", Nome(playerid), ":D", "");
```

## SendClientMessageEx(playerid, color, const str[], {Float,_}:...)
```pawn
SendClientMessageEx(playerid, -1, "O meu nome é %s.", Nome(playerid));
```

## Nome(playerid)
# note: is being used in the ShowPlayerDialogEx and SendClientMessageEx example

## TextConverter(string[])
# note: in the script is being used to include zcmd
```pawn
CMD:cnn(playerid, params[])
{
    if(!IsPlayerHelper(playerid))
        return SendClientMessage(playerid, Erro, "Comando Inválido");

    new tmp[128];

    if(sscanf(params, "s[128]", tmp))
        return SendClientMessage(playerid, Erro, "Digite: /Cnn [mensagem]");

    TextConverter(tmp); //Convertendo

    format(String, sizeof(String), "~r~# ~p~%s~w~: %s ~r~#", PlayerInfo[playerid][Nome], tmp);
    GameTextForPlayer(playerid, String, 3000, 2);
    return 1;
} 
```

# Contributors
## leonsx *(by include)*
## Calenzo *(TextConverter)*
## Y_Less *(randomEx)*
## Vision Team and Portal Samp *(most utilities taken from there)*
