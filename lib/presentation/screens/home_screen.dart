import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proyect_lol/config/constants/environment.dart';
import 'package:proyect_lol/domain/entities/champ.dart';
import 'package:proyect_lol/presentation/providers/champs/champs_providers.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-Screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _HomeView());
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({
    super.key,
  });

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
          return ListView.builder(
            itemCount: champions.length,
            itemBuilder: (BuildContext context, int index) {
              final champ = champions[index];
              return _ShowData(champ: champ);
            },
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
    super.key,
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
              "http://ddragon.leagueoflegends.com/cdn/13.16.1/img/champion/${champ.image.full}",
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
