import 'package:proyect_lol/domain/entities/champ.dart';
import 'package:proyect_lol/domain/infrastructure/models/riotdb/riotdb_response.dart';

class ChampMapper {
  static Champions riotDBToEntity(Datum champ) => Champions(
        version: champ.version,
        id: champ.id,
        key: champ.key,
        name: champ.name,
        title: champ.title,
        blurb: champ.blurb,
        info: ChampionsInfo(
          // Asumiendo que ChampionsInfo es la clase correcta
          attack: champ.info.attack,
          defense: champ.info.defense,
          magic: champ.info.magic,
          difficulty: champ.info.difficulty,
        ),
        image: ChampionsImage(
          // Asumiendo que ChampionsImage es la clase correcta
          full: champ.image.full,
          sprite: champ.image.sprite,
          group: champ.image.group,
          x: champ.image.x,
          y: champ.image.y,
          w: champ.image.w,
          h: champ.image.h,
        ),
        tags: champ.tags.map((tag) => tag.toString().split('.').last).toList(),
        partype: champ.partype,
        stats: ChampionsStats(
          hp: champ.stats["hp"]!.toInt(),
          hpperlevel: champ.stats["hpperlevel"]!.toInt(),
          mp: champ.stats["mp"]!.toInt(),
          mpperlevel: champ.stats["mpperlevel"]!.toInt(),
          movespeed: champ.stats["movespeed"]!.toInt(),
          armor: champ.stats["armor"]!,
          armorperlevel: champ.stats["armorperlevel"]!,
          spellblock: champ.stats["spellblock"]!,
          spellblockperlevel: champ.stats["spellblockperlevel"]!,
          attackrange: champ.stats["attackrange"]!.toInt(),
          hpregen: champ.stats["hpregen"]!,
          hpregenperlevel: champ.stats["hpregenperlevel"]!,
          mpregen: champ.stats["mpregen"]!,
          mpregenperlevel: champ.stats["mpregenperlevel"]!,
          crit: champ.stats["crit"]!,
          critperlevel: champ.stats["critperlevel"]!,
          attackdamage: champ.stats["attackdamage"]!.toInt(),
          attackdamageperlevel: champ.stats["attackdamageperlevel"]!.toInt(),
          attackspeedperlevel: champ.stats["attackspeedperlevel"]!,
          attackspeed: champ.stats["attackspeed"]!,
        ),
      );
}
