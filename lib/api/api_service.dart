import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:localhost_api/model/biodata_read.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1/latihan_api/api/';

  Future<BiodataRead> getBiodata() async {
    final response = await http.get(Uri.parse("${baseUrl}biodata/read.php"));
    if (response.statusCode == 200) {
      return BiodataRead.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<http.Response> createBiodata(String nama, String kelas) async {
    final response = await http.post(
      Uri.parse("${baseUrl}biodata/create.php"),
      body: jsonEncode(<String, String>{
        'nama': nama,
        'kelas': kelas,
      }),
    );
    return response;
  }
}
