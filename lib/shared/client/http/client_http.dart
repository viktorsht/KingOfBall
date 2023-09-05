import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rei_da_bola/shared/client/client.dart';

class HttpService implements Client{
  //final String baseUrl = Api.urlApi;

  @override
  Future<dynamic> get(String url, Map<String, String> headers) async {
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<dynamic> post(String url, Map<String, dynamic> data, Map<String, String> headers) async {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(data),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create resource');
    }
  }

  Future<void> put(String url, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update resource');
    }
  }

  Future<void> delete(String url) async {
    final response = await http.delete(Uri.parse(url));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete resource');
    }
  }
}
