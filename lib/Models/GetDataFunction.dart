import 'dart:convert';
import 'package:http/http.dart' as  http;
import 'JModels.dart';

Future<JModels> getAllData() async {
  final response = await http.get(
      Uri.parse("https://mocki.io/v1/8763f1da-fc82-4c07-a956-48e522f4200e"));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return JModels.fromJson(data);
  } else {
    throw Exception('Failed to load events');
  }
}