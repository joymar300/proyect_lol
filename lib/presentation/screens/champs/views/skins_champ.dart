

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:proyect_lol/domain/entities/champ_info.dart';
import 'package:proyect_lol/presentation/screens/champs/champ_info.dart';

class SkinView extends StatefulWidget {
  final String champName;
  final List<ChampionSkin> skin;
  const SkinView({
    required this.skin,
    required this.champName,
  });

  @override
  State<SkinView> createState() => SkinViewState();
}

class SkinViewState extends State<SkinView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          Expanded(
            child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemCount: widget.skin.length, 
            itemBuilder: (BuildContext context, int index){
              return 
                  ClipRRect(
                         borderRadius: BorderRadius.circular(20),
                         child: Image.network(
                           'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${widget.champName}_${widget.skin[index].num}.jpg',
                           fit: BoxFit.cover,
                           width: 200,
                           height: 300,
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
                       );
            }
            ),
            // child: 
            // ListView.builder(
            //   physics: const BouncingScrollPhysics(),
            //   scrollDirection: Axis.horizontal,
            //   itemCount: widget.skin.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return Container(
            //       margin: const EdgeInsets.symmetric(horizontal: 10),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           ClipRRect(
            //             borderRadius: BorderRadius.circular(20),
            //             child: Image.network(
            //               'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${widget.champName}_${widget.skin[index].num}.jpg',
            //               fit: BoxFit.cover,
            //               width: 200,
            //               height: 300,
            //               loadingBuilder: (context, child, loadingProgress) {
            //                 if (loadingProgress != null) {
            //                   return const Center(
            //                       child: Padding(
            //                     padding: EdgeInsets.all(8.0),
            //                     child:
            //                         CircularProgressIndicator(strokeWidth: 2),
            //                   ));
            //                 }
            //                 return GestureDetector(
            //                     onTap: () => Navigator.of(context).push(
            //                         MaterialPageRoute(
            //                             builder: (_) => GallerySkins(
            //                                 skin: widget.skin,
            //                                 champName: widget.champName,
            //                                 indexpage: index))),
            //                     child: FadeIn(child: child));
            //               },
            //             ),
            //           ),
            //         ],
            //       ),
            //     );

            //     // ListTile(
            //     //   onTap: () => Navigator.of(context).push(MaterialPageRoute(
            //     //       builder: (_) => GallerySkins(
            //     //           skin: widget.skin,
            //     //           champName: widget.champName,
            //     //           indexpage: index))),
            //     //   title: Image.network(
            //     //     'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${widget.champName}_${widget.skin[index].num}.jpg',
            //     //     fit: BoxFit.cover,
            //     //   ),
            //     // );
            //   },
            // ),
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
