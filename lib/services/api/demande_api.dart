

import 'dart:convert';

import '../../models/client.dart';
import 'package:http/http.dart' as http;

Future<List<User>> getClientList() async {
  final response = await http.get(Uri.parse("http://10.0.2.2:8080/clients/"));
  final items = json.decode(response.body).cast<Map<String, dynamic>>();
  List<User> clients = items.map<User>((json) {
    return User.fromJson(json);
  }).toList();

  print("clients ;;;;;;;; $clients");

  return clients;
}