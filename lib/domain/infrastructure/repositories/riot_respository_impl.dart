import 'package:proyect_lol/domain/datasource/champs_dataosurce.dart';
import 'package:proyect_lol/domain/entities/champ.dart';
import 'package:proyect_lol/domain/entities/champ_info.dart';
import 'package:proyect_lol/domain/repositories/champ_repository.dart';

class RiotRepositoryImpl extends ChampRepository {
  final ChampDataSource dataSource;
  RiotRepositoryImpl(this.dataSource);
  @override
  Future<List<Champions>> getChampNow() {
    return dataSource.getChampNow();
  }

  @override
  Future<Champion> getChampInfo(String champId) {
    return dataSource.getChampInfo(champId);
  }
}
