import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyect_lol/domain/entities/champ.dart';
import 'package:proyect_lol/presentation/providers/champs/champs_repository_provider.dart';

final championProvider = FutureProvider<List<Champions>>((ref) async {
  final getchampionRepo = ref.watch(champRepositoryProvider);
  final champions = await getchampionRepo
      .getChampNow(); // Aquí se obtiene la lista de campeones desde el repositorio
  return champions; // Se devuelve la lista de campeones obtenida
});
