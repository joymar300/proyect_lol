import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:proyect_lol/domain/entities/champ.dart';
import 'package:proyect_lol/domain/entities/champ_Info.dart';
import 'package:proyect_lol/presentation/screens/screens.dart';


class SearchChampLolDelegate extends SearchDelegate<Champions?>{
  final List<Champions> champions;
  late List<Champions> filteredChampions;

  SearchChampLolDelegate({required this.champions}) {
    filteredChampions = champions;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {

    try {
      final champion = filteredChampions.firstWhere(
        (champion) => champion.name.toLowerCase() == query.toLowerCase(),
      
      );
      return ListTile(
        title: Text(champion.name),
        onTap: () {
          close(context, champion);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChampInfoScreen(champId: champion.id),
            ),
          );
        },
      );

    }catch(Err){
       return const Text("no found");  
    }
    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.characters.length >1){
    filteredChampions = query.isEmpty
        ? champions
        : champions
            .where((champion) =>
                champion.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemCount: filteredChampions.length,
      itemBuilder: (BuildContext context, int index) {
        final champion = filteredChampions[index];
        return ListTile(
          title: Text(champion.name),
          onTap: () {
            close(context, champion);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChampInfoScreen(champId: champion.id),
              ),
            );
          },
        );
      },
    );
    }
    return const Text("");
  }
}
