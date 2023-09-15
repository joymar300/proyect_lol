// To parse this JSON data, do
//
//     final champInfo = champInfoFromJson(jsonString);

import 'dart:convert';

ChampInfo champInfoFromJson(String str) => ChampInfo.fromJson(json.decode(str));

String champInfoToJson(ChampInfo data) => json.encode(data.toJson());

class ChampInfo {
  final String type;
  final String format;
  final String version;
  final Data data;

  ChampInfo({
    required this.type,
    required this.format,
    required this.version,
    required this.data,
  });

  factory ChampInfo.fromJson(Map<String, dynamic> json) => ChampInfo(
        type: json["type"],
        format: json["format"],
        version: json["version"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "format": format,
        "version": version,
        "data": data.toJson(),
      };
}

class Data {
  final Champ champ;

  Data({
    required this.champ,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        champ: Champ.fromJson(json["champ"]),
      );

  Map<String, dynamic> toJson() => {
        "champ": champ.toJson(),
      };
}

class Champ {
  final String id;
  final String key;
  final String name;
  final String title;
  final Image image;
  final List<Skin> skins;
  final String lore;
  final String blurb;
  final List<String> allytips;
  final List<String> enemytips;
  final List<String> tags;
  final String partype;
  final Info info;
  final Map<String, double> stats;
  final List<Spell> spells;
  final Passive passive;
  final List<dynamic> recommended;

  Champ({
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
    required this.recommended,
  });

  factory Champ.fromJson(Map<String, dynamic> json) => Champ(
        id: json["id"] ?? '',
        key: json["key"] ?? '',
        name: json["name"] ?? '',
        title: json["title"] ?? '',
        image: Image.fromJson(json["image"]) ?? json['masd'],
        skins: List<Skin>.from(json["skins"].map((x) => Skin.fromJson(x))),
        lore: json["lore"],
        blurb: json["blurb"],
        allytips: List<String>.from(json["allytips"].map((x) => x)),
        enemytips: List<String>.from(json["enemytips"].map((x) => x)),
        tags: List<String>.from(json["tags"].map((x) => x)),
        partype: json["partype"],
        info: Info.fromJson(json["info"]),
        stats: Map.from(json["stats"])
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        spells: List<Spell>.from(json["spells"].map((x) => Spell.fromJson(x))),
        passive: Passive.fromJson(json["passive"]),
        recommended: List<dynamic>.from(json["recommended"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "name": name,
        "title": title,
        "image": image.toJson(),
        "skins": List<dynamic>.from(skins.map((x) => x.toJson())),
        "lore": lore,
        "blurb": blurb,
        "allytips": List<dynamic>.from(allytips.map((x) => x)),
        "enemytips": List<dynamic>.from(enemytips.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "partype": partype,
        "info": info.toJson(),
        "stats": Map.from(stats).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "spells": List<dynamic>.from(spells.map((x) => x.toJson())),
        "passive": passive.toJson(),
        "recommended": List<dynamic>.from(recommended.map((x) => x)),
      };
}

class Image {
  final String full;
  final String sprite;
  final String group;
  final int x;
  final int y;
  final int w;
  final int h;

  Image({
    required this.full,
    required this.sprite,
    required this.group,
    required this.x,
    required this.y,
    required this.w,
    required this.h,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        full: json["full"],
        sprite: json["sprite"],
        group: json["group"],
        x: json["x"],
        y: json["y"],
        w: json["w"],
        h: json["h"],
      );

  Map<String, dynamic> toJson() => {
        "full": full,
        "sprite": sprite,
        "group": group,
        "x": x,
        "y": y,
        "w": w,
        "h": h,
      };
}

class Info {
  final int attack;
  final int defense;
  final int magic;
  final int difficulty;

  Info({
    required this.attack,
    required this.defense,
    required this.magic,
    required this.difficulty,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        attack: json["attack"],
        defense: json["defense"],
        magic: json["magic"],
        difficulty: json["difficulty"],
      );

  Map<String, dynamic> toJson() => {
        "attack": attack,
        "defense": defense,
        "magic": magic,
        "difficulty": difficulty,
      };
}

class Passive {
  final String name;
  final String description;
  final Image image;

  Passive({
    required this.name,
    required this.description,
    required this.image,
  });

  factory Passive.fromJson(Map<String, dynamic> json) => Passive(
        name: json["name"],
        description: json["description"],
        image: Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "image": image.toJson(),
      };
}

class Skin {
  final String id;
  final int num;
  final String name;
  final bool chromas;

  Skin({
    required this.id,
    required this.num,
    required this.name,
    required this.chromas,
  });

  factory Skin.fromJson(Map<String, dynamic> json) => Skin(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        chromas: json["chromas"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "num": num,
        "name": name,
        "chromas": chromas,
      };
}

class Spell {
  final String id;
  final String name;
  final String description;
  final String tooltip;
  final Leveltip leveltip;
  final int maxrank;
  final List<dynamic> cooldown;
  final String cooldownBurn;
  final List<int> cost;
  final String costBurn;
  final Datavalues datavalues;
  final List<List<dynamic>> effect;
  final List<String?> effectBurn;
  final List<dynamic> vars;
  final String costType;
  final String maxammo;
  final List<int> range;
  final String rangeBurn;
  final Image image;
  final String resource;

  Spell({
    required this.id,
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
    required this.resource,
  });

  factory Spell.fromJson(Map<String, dynamic> json) => Spell(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        tooltip: json["tooltip"],
        leveltip: Leveltip.fromJson(json["leveltip"]),
        maxrank: json["maxrank"],
        cooldown: List<dynamic>.from(json["cooldown"].map((x) => x)),
        cooldownBurn: json["cooldownBurn"],
        cost: List<int>.from(json["cost"].map((x) => x)),
        costBurn: json["costBurn"],
        datavalues: Datavalues.fromJson(json["datavalues"]),
        effect: List<List<dynamic>>.from(json["effect"]
            .map((x) => x == null ? [] : List<dynamic>.from(x!.map((x) => x)))),
        effectBurn: List<String?>.from(json["effectBurn"].map((x) => x)),
        vars: List<dynamic>.from(json["vars"].map((x) => x)),
        costType: json["costType"],
        maxammo: json["maxammo"],
        range: List<int>.from(json["range"].map((x) => x)),
        rangeBurn: json["rangeBurn"],
        image: Image.fromJson(json["image"]),
        resource: json["resource"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "tooltip": tooltip,
        "leveltip": leveltip.toJson(),
        "maxrank": maxrank,
        "cooldown": List<dynamic>.from(cooldown.map((x) => x)),
        "cooldownBurn": cooldownBurn,
        "cost": List<dynamic>.from(cost.map((x) => x)),
        "costBurn": costBurn,
        "datavalues": datavalues.toJson(),
        "effect": List<dynamic>.from(effect
            .map((x) => x == null ? [] : List<dynamic>.from(x.map((x) => x)))),
        "effectBurn": List<dynamic>.from(effectBurn.map((x) => x)),
        "vars": List<dynamic>.from(vars.map((x) => x)),
        "costType": costType,
        "maxammo": maxammo,
        "range": List<dynamic>.from(range.map((x) => x)),
        "rangeBurn": rangeBurn,
        "image": image.toJson(),
        "resource": resource,
      };
}

class Datavalues {
  Datavalues();

  factory Datavalues.fromJson(Map<String, dynamic> json) => Datavalues();

  Map<String, dynamic> toJson() => {};
}

class Leveltip {
  final List<String> label;
  final List<String> effect;

  Leveltip({
    required this.label,
    required this.effect,
  });

  factory Leveltip.fromJson(Map<String, dynamic> json) => Leveltip(
        label: List<String>.from(json["label"].map((x) => x)),
        effect: List<String>.from(json["effect"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "label": List<dynamic>.from(label.map((x) => x)),
        "effect": List<dynamic>.from(effect.map((x) => x)),
      };
}
