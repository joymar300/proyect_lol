import 'package:proyect_lol/domain/infrastructure/models/riotdb/championdb_response.dart';

class Champion {
  String id;
  String key;
  String name;
  String title;
  ChampionImage image;
  List<ChampionSkin> skins;
  String lore;
  String blurb;
  List<String> allytips;
  List<String> enemytips;
  List<String> tags;
  String partype;
  ChampionInfo info;
  ChampionStats stats;
  List<ChampionSpell> spells;
  ChampionPassive passive;
  List<dynamic> recommended;

  Champion(
      {
      required this.id,
      required this.key,
      required this.name,
      required this.title,
      required this.image,
      required this.skins,
      required this.lore,
      required this.blurb,
      required this.allytips,
      required this.enemytips,
      required this.tags,
      required this.partype,
      required this.info,
      required this.stats,
      required this.spells,
      required this.passive,
      required this.recommended
      });
}

class ChampionImage {
  String full;
  String sprite;
  String group;
  int x;
  int y;
  int w;
  int h;

  ChampionImage(
      {required this.full,
      required this.sprite,
      required this.group,
      required this.x,
      required this.y,
      required this.w,
      required this.h});
}

class ChampionSkin {
  String id;
  int num;
  String name;
  bool chromas;

  ChampionSkin(
      {required this.id,
      required this.num,
      required this.name,
      required this.chromas});
}

class ChampionInfo {
  int attack;
  int defense;
  int magic;
  int difficulty;

  ChampionInfo(
      {required this.attack,
      required this.defense,
      required this.magic,
      required this.difficulty});
}

class ChampionStats {
  int hp;
  int hpperlevel;
  int mp;
  int mpperlevel;
  int movespeed;
  double armor;
  double armorperlevel;
  double spellblock;
  double spellblockperlevel;
  int attackrange;
  int hpregen;
  int hpregenperlevel;
  int mpregen;
  int mpregenperlevel;
  int crit;
  int critperlevel;
  int attackdamage;
  int attackdamageperlevel;
  double attackspeedperlevel;
  double attackspeed;

  ChampionStats(
      {required this.hp,
      required this.hpperlevel,
      required this.mp,
      required this.mpperlevel,
      required this.movespeed,
      required this.armor,
      required this.armorperlevel,
      required this.spellblock,
      required this.spellblockperlevel,
      required this.attackrange,
      required this.hpregen,
      required this.hpregenperlevel,
      required this.mpregen,
      required this.mpregenperlevel,
      required this.crit,
      required this.critperlevel,
      required this.attackdamage,
      required this.attackdamageperlevel,
      required this.attackspeedperlevel,
      required this.attackspeed});
}

class ChampionSpell {
  String id;
  String name;
  String description;
  String tooltip;
  Leveltip leveltip;
  int maxrank;
  List<dynamic> cooldown;
  String cooldownBurn;
  List<int> cost;
  String costBurn;
  dynamic datavalues;
  List<List<dynamic>> effect;
  List<String?> effectBurn;
  List<dynamic> vars;
  String costType;
  String maxammo;
  List<int> range;
  String rangeBurn;
  ChampionImage image;
  String resource;

  ChampionSpell(
      {required this.id,
      required this.name,
      required this.description,
      required this.tooltip,
      required this.leveltip,
      required this.maxrank,
      required this.cooldown,
      required this.cooldownBurn,
      required this.cost,
      required this.costBurn,
      required this.datavalues,
      required this.effect,
      required this.effectBurn,
      required this.vars,
      required this.costType,
      required this.maxammo,
      required this.range,
      required this.rangeBurn,
      required this.image,
      required this.resource});
}

class ChampionPassive {
  String name;
  String description;
  ChampionImage image;

  ChampionPassive(
      {required this.name, required this.description, required this.image});
}
