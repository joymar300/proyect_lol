import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyect_lol/domain/entities/champ_info.dart';
import 'package:proyect_lol/presentation/providers/champs/champs_repository_provider.dart';

final champInfoProvider =
    StateNotifierProvider<ChampMapNotifier, Map<String, Champion>>((ref) {
  final champRepo = ref.watch(champRepositoryProvider);
  return ChampMapNotifier(getchamp: champRepo.getChampInfo);
});

typedef GetChampCalback = Future<Champion> Function(String champId);

class ChampMapNotifier extends StateNotifier<Map<String, Champion>> {
  final GetChampCalback getchamp;

  ChampMapNotifier({required this.getchamp}) : super({});
  Future<void> loadChamp(String champId) async {
    if (state[champId] != null) return;
    final champinfo = await getchamp(champId);
    state = {...state, champId: champinfo};
  }
}
