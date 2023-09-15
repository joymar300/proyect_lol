import 'package:dio/dio.dart';
import 'package:proyect_lol/config/constants/environment.dart';
import 'package:proyect_lol/domain/datasource/champs_dataosurce.dart';
import 'package:proyect_lol/domain/entities/champ.dart';
import 'package:proyect_lol/domain/entities/champ_info.dart';
import 'package:proyect_lol/domain/infrastructure/mappers/champ_info_mapper.dart';
import 'package:proyect_lol/domain/infrastructure/mappers/champ_mapper.dart';
import 'package:proyect_lol/domain/infrastructure/models/riotdb/championdb_response.dart';
import 'package:proyect_lol/domain/infrastructure/models/riotdb/riotdb_response.dart';

class RiotDatasource extends ChampDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'http://ddragon.leagueoflegends.com/cdn',
      queryParameters: {
        'api_key': Enviroment.lolKey,
      }));
  @override
  Future<List<Champions>> getChampNow() async {
    final response = await dio.get('/13.16.1/data/en_US/champion.json');
    final champsResponse = Champs.fromJson(response.data);
    final List<Champions> champs = champsResponse.data.values
        .map((datum) => ChampMapper.riotDBToEntity(datum))
        .toList();
    return champs;
  }

  @override
  Future<Champion> getChampInfo(String champId) async {
    final response =
        await dio.get('/13.16.1/data/en_US/champion/$champId.json');
    if (response.statusCode != 200)
      throw Exception('Movie with id: $champId no found');
    final champResponse = Champ.fromJson(response.data['data'][champId]);
    final Champion champ = ChampInfoMapper.champInfoToEntity(champResponse);
    return champ;
  }
}
