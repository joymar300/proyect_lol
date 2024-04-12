import 'dart:convert';

List<String> versionlolFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String versionlolToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
