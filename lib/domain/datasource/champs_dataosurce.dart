import 'package:proyect_lol/domain/entities/champ.dart';
import 'package:proyect_lol/domain/entities/champ_info.dart';

abstract class ChampDataSource {
  Future<List<Champions>> getChampNow();
  Future<Champion> getChampInfo(String champId);
}
