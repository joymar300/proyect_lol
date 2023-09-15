import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyect_lol/domain/infrastructure/datasource/riot_datasource.dart';
import 'package:proyect_lol/domain/infrastructure/repositories/riot_respository_impl.dart';

final champRepositoryProvider = Provider((ref) {
  return RiotRepositoryImpl(RiotDatasource());
});
