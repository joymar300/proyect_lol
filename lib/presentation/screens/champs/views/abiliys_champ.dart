import 'package:flutter/material.dart';
import 'package:proyect_lol/domain/entities/champ_info.dart';

class ChampAbilities extends StatelessWidget {
  final List<ChampionSpell> spells;
  final ChampionPassive champasive;
  const ChampAbilities({super.key, required this.spells, required this.champasive});

  @override
  Widget build(BuildContext context) {
    return 
      Container(padding: EdgeInsets.only(left: 20,right: 20),
        child: ListView(
          children: [
            Card(
               child: ListTile(
                      leading: Image(image: NetworkImage("https://ddragon.leagueoflegends.com/cdn/14.7.1/img/passive/${champasive.image.full}")),
                  title: Text(
                    champasive.name
                  ),
                  subtitle: Text(champasive.description),
                )
             ),
        
             ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: spells.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                        leading: Image(image: NetworkImage("https://ddragon.leagueoflegends.com/cdn/14.7.1/img/spell/${spells[index].image.full}")),
                    title: Text(
                      spells[index].name,
                    ),
                    subtitle: Text(spells[index].description),
                  ));
                },
              ),
            SizedBox(height: 200,)
          ],
        ),
      );
   
  }
}

// showChampIcon(ChampionImage image) async {
//   return Image(
//     image: NetworkImage(
//         "https://ddragon.leagueoflegends.com/cdn/14.7.1/img/spell/${image.full}"),
//   );
// }
