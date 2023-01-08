import 'package:localhost_api/model/biodata.dart';

class BiodataRead {
  BiodataRead({required this.success, required this.biodatas});

  bool success;
  List<Biodata> biodatas;

  factory BiodataRead.fromJson(Map<String, dynamic> json) => BiodataRead(
      success: json['success'],
      biodatas:
          List<Biodata>.from(json['data'].map((x) => Biodata.fromJson(x))));
}
