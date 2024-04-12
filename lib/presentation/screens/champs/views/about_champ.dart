import 'package:flutter/material.dart';
import 'package:proyect_lol/domain/entities/champ_info.dart';
import 'package:proyect_lol/presentation/screens/champs/views/skins_champ.dart';

class ChampDetails extends StatelessWidget {
  final Champion champ;
  const ChampDetails({required this.champ});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            champ.lore,
            style: textStyle.bodyMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            champ.blurb,
            style: textStyle.bodyMedium,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // Text(
        //   'Skins',
        //   style: textStyle.titleLarge,
        // ),
        // const SizedBox(height: 20),
        // SkinView(skin: champ.skins, champName: champ.id),
      ],
    );
  }
}