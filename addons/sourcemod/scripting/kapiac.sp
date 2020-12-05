#include sourcemod
#include sdktools
#pragma semicolon 1
#pragma newdecls required
char EntityList[][] =  { "func_door" };
int iEnt;
Handle g_timer;
ConVar kacsaniye = null;
public Plugin myinfo = {
	name = "Belirlediğiniz saniyede kapı açılır.",
	author = "phiso", 
	description = "10₺", 
	version = "1.0", 
	url = "phiso#3331"
};
public void OnPluginStart()
{
	HookEvent("round_start", RoundStartEnd);
	HookEvent("round_end", RoundStartEnd);
	kacsaniye = CreateConVar("sm_kapiac_kacsaniye", "31", "Kaç saniye sonra kapı açılsın?");
	AutoExecConfig(true, "Oto_Kapi", "phiso");
}
public Action RoundStartEnd(Event event, const char[] name, bool dontBroadcast)
{
	if (StrEqual(name, "round_start", true))
	{
		g_timer = CreateTimer(kacsaniye.FloatValue, Kapiacaq, _, TIMER_FLAG_NO_MAPCHANGE);
	}
	if (StrEqual(name, "round_end", true))
	{
		delete g_timer;
	}
}
public Action Kapiacaq(Handle Timer, any data)
{
	PrintToChatAll("[SM] \x02Süre Geldiği İçin Kapı Açıldı!");
	PrintCenterTextAll("[SM] Süre Geldiği İçin Kapı Açıldı!");
	Kapi_Ac();
}
void Kapi_Ac(){for (int i = 0; i < sizeof(EntityList); i++)while ((iEnt = FindEntityByClassname(iEnt, EntityList[i])) != -1)AcceptEntityInput(iEnt, "Open");} 