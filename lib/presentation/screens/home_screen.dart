import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import 'package:proyect_lol/domain/entities/champ.dart';
import 'package:proyect_lol/presentation/delegate/searchbarChamp.dart';

import 'package:proyect_lol/presentation/providers/champs/champs_providers.dart';

class HomeScreen extends  ConsumerWidget {
  static const name = 'home-Screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(appBar: AppBar(title: const Text("L proyect"), actions: [IconButton(onPressed: (){
      showSearch(context: context, delegate: SearchChampLolDelegate(champions: ref.watch(championProvider).value!));
    }, icon: const Icon(Icons.search))],), body: const _HomeView());
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(championProvider).value;
  }

  @override
  Widget build(BuildContext context) {
    final champPro = ref.watch(championProvider);
    return champPro.when(
        data: (champions) {
          return GridView.custom(
            gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
             crossAxisSpacing: 8,
             pattern: const [
              WovenGridTile(1),
              WovenGridTile(
                5 / 7,
                crossAxisRatio: 0.9,
                alignment: AlignmentDirectional.centerEnd,
              ),
             ]
            ),
            //itemCount: champions.length,
            
            childrenDelegate:SliverChildBuilderDelegate( (BuildContext context, int index) {
              final champ = champions[index];
              return _ShowData(champ: champ);
            },),
          );
        },
        error: (error, stackTrace) => Text('Error: $error'),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}

class _ShowData extends StatelessWidget {
  const _ShowData({
    required this.champ,
  });

  final Champions champ;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return SizedBox(
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Image.network(
              "http://ddragon.leagueoflegends.com/cdn/${champ.version}/img/champion/${champ.image.full}",
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return GestureDetector(
                  onTap: () => context.push('/champion/${champ.id}'),
                  child: child,
                );
              },
            ),
            Text(
              champ.name,
              style: textStyle.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}
