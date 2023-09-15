import 'package:go_router/go_router.dart';
import 'package:proyect_lol/presentation/screens/screens.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'champion/:champId',
          name: ChampInfoScreen.name,
          builder: (context, state) {
            final champId = state.pathParameters['champId'] ?? 'no id';
            return ChampInfoScreen(champId: champId);
          },
        )
      ]),
]);
