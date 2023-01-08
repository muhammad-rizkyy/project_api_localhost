import 'package:flutter/material.dart';
import 'package:localhost_api/api/api_service.dart';

class BiodataCreate extends StatefulWidget {
  static const routeName = '/biodata_create';
  const BiodataCreate({Key? key}) : super(key: key);

  @override
  State<BiodataCreate> createState() => _BiodataCreateState();
}

class _BiodataCreateState extends State<BiodataCreate> {
  String _nama = '';
  String _kelas = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Membaca API Online'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Tuliskan nama baru',
                  labelText: 'Input nama',
                ),
                onChanged: (String value) {
                  setState(() {
                    _nama = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Tuliskan kelas baru',
                  labelText: 'Input kelas',
                ),
                onChanged: (String value) {
                  setState(() {
                    _kelas = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  ApiService apiService = ApiService();
                  apiService.createBiodata(_nama, _kelas);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}
