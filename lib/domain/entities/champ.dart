class Champions {
  final String version;
  final String id;
  final String key;
  final String name;
  final String title;
  final String blurb;
  final ChampionsInfo info;
  final ChampionsImage image;
  final List<String> tags;
  final String partype;
  final ChampionsStats stats;

  Champions({
    required this.version,
    required this.id,
    required this.key,
    required this.name,
    required this.title,
    required this.blurb,
    required this.info,
    required this.image,
    required this.tags,
    required this.partype,
    required this.stats,
  });
}

class ChampionsInfo {
  final int attack;
  final int defense;
  final int magic;
  final int difficulty;

  ChampionsInfo({
    required this.attack,
    required this.defense,
    required this.magic,
    required this.difficulty,
  });
}

class ChampionsImage {
  final String full;
  final String sprite;
  final String group;
  final int x;
  final int y;
  final int w;
  final int h;

  ChampionsImage({
    required this.full,
    required this.sprite,
    required this.group,
    required this.x,
    required this.y,
    required this.w,
    required this.h,
  });
}

class ChampionsStats {
  final int hp;
  final int hpperlevel;
  final int mp;
  final int mpperlevel;
  final int movespeed;
  final double armor;
  final double armorperlevel;
  final double spellblock;
  final double spellblockperlevel;
  final int attackrange;
  final double hpregen;
  final double hpregenperlevel;
  final double mpregen;
  final double mpregenperlevel;
  final double crit;
  final double critperlevel;
  final int attackdamage;
  final int attackdamageperlevel;
  final double attackspeedperlevel;
  final double attackspeed;

  ChampionsStats({
    required this.hp,
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
    required this.attackspeed,
  });

  toJson() {}
}
