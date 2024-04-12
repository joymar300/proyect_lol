import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:proyect_lol/domain/entities/champ_info.dart';
import 'package:proyect_lol/presentation/providers/champs/champ_info_provider.dart';
import 'package:proyect_lol/presentation/screens/champs/views/abiliys_champ.dart';
import 'package:proyect_lol/presentation/screens/champs/views/about_champ.dart';
import 'package:proyect_lol/presentation/screens/champs/views/skins_champ.dart';

class ChampInfoScreen extends ConsumerStatefulWidget {
  static String name = 'Champ-info-screen';
  final String champId;
  const ChampInfoScreen({super.key, required this.champId});

  @override
  ChampInfoScreenState createState() => ChampInfoScreenState();
}

class ChampInfoScreenState extends ConsumerState<ChampInfoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(champInfoProvider.notifier).loadChamp(widget.champId);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final Champion? champ = ref.watch(champInfoProvider)[widget.champId];
    if (champ == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: <Widget>[
          _CustomSliverAppBar(champ: champ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => SizedBox(height: size.height , 
            child: NavinfoChamp(champ: champ)),
            childCount: 1,
          ))
        ],
      ),
    );
  }
}

class NavinfoChamp extends StatelessWidget {
  const NavinfoChamp({
    super.key,
    required this.champ,
  });

  final Champion champ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold( 
        appBar:  const TabBar(tabs: [
          Tab(text: "About",),
          Tab(text: "abilities",),
          Tab(text: "Skins",),

        ]),
        body: TabBarView(children: [
          
          ChampDetails(champ: champ),
          ChampAbilities(spells: champ.spells,champasive: champ.passive,),
          SkinView(skin: champ.skins, champName: champ.id),
        ]),

    ));
  }
}

class _CustomSliverAppBar extends ConsumerWidget {
  final Champion champ;
  const _CustomSliverAppBar({required this.champ});

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
        backgroundColor: Colors.black,
        expandedHeight: size.height * 0.7,
        foregroundColor: Colors.white,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          title: Text("${champ.name} - ${champ.title}"),
          background: Stack(
            children: [
              SizedBox.expand(
                child: Image.network(
                  'http://ddragon.leagueoflegends.com/cdn/img/champion/loading/${champ.id}_${champ.skins[0].num}.jpg',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) return const SizedBox();
                    return FadeIn(child: child);
                  },
                ),
              ),
              const _CustomGaradient(begin: Alignment.topLeft, stops: [
                0.5,
                1.0
              ], colors: [
                Colors.transparent,
                Color.fromARGB(221, 22, 22, 22)
              ]),
            ],
          ),
        ));
  }
}

class _CustomGaradient extends StatelessWidget {
  final AlignmentGeometry begin;
  final AlignmentGeometry end = Alignment.centerRight;
  final List<double> stops;
  final List<Color> colors;

  const _CustomGaradient({
    required this.begin,
    required this.stops,
    required this.colors,  
   
    
  } 
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: begin, end: end, stops: stops, colors: colors))),
    );
  }
}





