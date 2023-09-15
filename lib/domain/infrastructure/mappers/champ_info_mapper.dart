import 'package:proyect_lol/domain/entities/champ_info.dart';
import 'package:proyect_lol/domain/infrastructure/models/riotdb/championdb_response.dart';

class ChampInfoMapper {
  static Champion champInfoToEntity(Champ champ) => Champion(
      id: champ.id,
      key: champ.key,
      name: champ.name,
      title: champ.title,
      image: ChampionImage(
        // Asumiendo que ChampionsImage es la clase correcta
        full: champ.image.full,
        sprite: champ.image.sprite,
        group: champ.image.group,
        x: champ.image.x,
        y: champ.image.y,
        w: champ.image.w,
        h: champ.image.h,
      ),
      skins: champ.skins
          .map((skin) => ChampionSkin(
                id: skin.id,
                num: skin.num,
                name: skin.name,
                chromas: skin.chromas,
              ))
          .toList(),
      lore: champ.lore,
      blurb: champ.blurb,
      allytips: champ.allytips,
      enemytips: champ.enemytips,
      tags: champ.tags,
      partype: champ.partype,
      info: ChampionInfo(
        // Asumiendo que ChampionsInfo es la clase correcta
        attack: champ.info.attack,
        defense: champ.info.defense,
        magic: champ.info.magic,
        difficulty: champ.info.difficulty,
      ),
      stats: ChampionStats(
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
        hpregen: champ.stats["hpregen"]!.toInt(),
        hpregenperlevel: champ.stats["hpregenperlevel"]!.toInt(),
        mpregen: champ.stats["mpregen"]!.toInt(),
        mpregenperlevel: champ.stats["mpregenperlevel"]!.toInt(),
        crit: champ.stats["crit"]!.toInt(),
        critperlevel: champ.stats["critperlevel"]!.toInt(),
        attackdamage: champ.stats["attackdamage"]!.toInt(),
        attackdamageperlevel: champ.stats["attackdamageperlevel"]!.toInt(),
        attackspeedperlevel: champ.stats["attackspeedperlevel"]!,
        attackspeed: champ.stats["attackspeed"]!,
      ),
      spells: champ.spells
          .map((spell) => ChampionSpell(
              id: spell.id,
              name: spell.name,
              description: spell.description,
              tooltip: spell.tooltip,
              leveltip: Leveltip(
                label: spell.leveltip.label,
                effect: spell.leveltip.effect,
              ),
              maxrank: spell.maxrank,
              cooldown: spell.cooldown,
              cooldownBurn: spell.cooldownBurn,
              cost: spell.cost,
              costBurn: spell.costBurn,
              datavalues: spell.datavalues,
              effect: spell.effect,
              effectBurn: spell.effectBurn,
              vars: spell.vars,
              costType: spell.costType,
              maxammo: spell.maxammo,
              range: spell.range,
              rangeBurn: spell.rangeBurn,
              image: ChampionImage(
                // Asumiendo que ChampionsImage es la clase correcta
                full: spell.image.full,
                sprite: spell.image.sprite,
                group: spell.image.group,
                x: spell.image.x,
                y: spell.image.y,
                w: spell.image.w,
                h: spell.image.h,
              ),
              resource: spell.resource))
          .toList(),
      passive: ChampionPassive(
          name: champ.passive.name,
          description: champ.passive.description,
          image: ChampionImage(
              full: champ.passive.image.full,
              sprite: champ.passive.image.sprite,
              group: champ.passive.image.group,
              x: champ.passive.image.x,
              y: champ.passive.image.y,
              w: champ.passive.image.w,
              h: champ.passive.image.h)),
      recommended: champ.recommended);
}
