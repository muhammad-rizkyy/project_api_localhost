import 'package:flutter/material.dart';
import 'package:localhost_api/api/api_service.dart';
import 'package:localhost_api/model/biodata.dart';
import 'package:localhost_api/model/biodata_read.dart';
import 'package:localhost_api/screen/biodata_create.dart';

class BiodataList extends StatefulWidget {
  static const routeName = '/biodata_list';

  const BiodataList({Key? key}) : super(key: key);

  @override
  State<BiodataList> createState() => _BiodataListState();
}

class _BiodataListState extends State<BiodataList> {
  late Future<BiodataRead> _future;

  @override
  void initState() {
    super.initState();
    ApiService apiService = ApiService();
    _future = apiService.getBiodata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membaca API local'),
      ),
      body: Center(
        child: FutureBuilder<BiodataRead>(
          future: _future,
          builder: (context, snapshot) {
            var state = snapshot.connectionState;
            if (state != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                final List<Biodata> biodatas = snapshot.data!.biodatas;
                return ListView.builder(
                    itemCount: biodatas.length,
                    itemBuilder: (context, index) {
                      return _buildBiodataCard(context, biodatas[index]);
                    });
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              } else {
                return const Text('');
              }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, BiodataCreate.routeName);
        },
      ),
    );
  }

  Widget _buildBiodataCard(BuildContext context, Biodata biodata) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(
        biodata.nama,
      ),
      subtitle: Text(
        biodata.kelas,
      ),
    );
  }
}
