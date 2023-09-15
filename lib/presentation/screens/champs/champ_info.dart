import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:proyect_lol/domain/entities/champ_info.dart';
import 'package:proyect_lol/presentation/providers/champs/champ_info_provider.dart';

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
            (context, index) => _ChampDetails(champ: champ),
            childCount: 1,
          ))
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends ConsumerWidget {
  final Champion champ;
  const _CustomSliverAppBar({required this.champ, super.key});

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
  final AlignmentGeometry end;
  final List<double> stops;
  final List<Color> colors;

  const _CustomGaradient({
    required this.begin,
    required this.stops,
    required this.colors,
    this.end = Alignment.centerLeft,
  });

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

class _ChampDetails extends StatelessWidget {
  final Champion champ;
  const _ChampDetails({super.key, required this.champ});

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
        Text(
          'Skins',
          style: textStyle.titleLarge,
        ),
        const SizedBox(height: 20),
        _SkinView(skin: champ.skins, champName: champ.id),
      ],
    );
  }
}

class _SkinView extends StatefulWidget {
  final String champName;
  final List<ChampionSkin> skin;
  const _SkinView({
    super.key,
    required this.skin,
    required this.champName,
  });

  @override
  State<_SkinView> createState() => _SkinViewState();
}

class _SkinViewState extends State<_SkinView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.skin.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${widget.champName}_${widget.skin[index].num}.jpg',
                          fit: BoxFit.cover,
                          width: 300,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress != null) {
                              return const Center(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              ));
                            }
                            return GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) => GallerySkins(
                                            skin: widget.skin,
                                            champName: widget.champName,
                                            indexpage: index))),
                                child: FadeIn(child: child));
                          },
                        ),
                      ),
                    ],
                  ),
                );

                // ListTile(
                //   onTap: () => Navigator.of(context).push(MaterialPageRoute(
                //       builder: (_) => GallerySkins(
                //           skin: widget.skin,
                //           champName: widget.champName,
                //           indexpage: index))),
                //   title: Image.network(
                //     'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${widget.champName}_${widget.skin[index].num}.jpg',
                //     fit: BoxFit.cover,
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GallerySkins extends StatefulWidget {
  final PageController pageController;
  final int indexpage;
  final String champName;
  final List<ChampionSkin> skin;

  GallerySkins(
      {required this.skin, required this.champName, this.indexpage = 0})
      : pageController = PageController(initialPage: indexpage);

  @override
  State<GallerySkins> createState() => _GallerySkinsState();
}

class _GallerySkinsState extends State<GallerySkins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:
          AppBar(backgroundColor: Colors.black, foregroundColor: Colors.white),
      body: PhotoViewGallery.builder(
        loadingBuilder: (context, event) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          );
        },
        scrollPhysics: const BouncingScrollPhysics(),
        pageController: widget.pageController,
        itemCount: widget.skin.length,
        builder: (context, index) {
          final skinsUrl =
              'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${widget.champName}_${widget.skin[index].num}.jpg';
          return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(skinsUrl));
        },
      ),
    );
  }
}
