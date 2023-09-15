import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String lolKey = dotenv.env['THE_LOL_KEY'] ?? 'no hay api';
}
