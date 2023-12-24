import 'dart:convert';

import 'package:angkit_project/models/models.dart';
import 'package:angkit_project/pages/detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {

  late SharedPreferences prefs;

  Future<Batches?> getBatches() async {
    prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('id')!;
    Uri uri = Uri.parse('http://angkit.ktsabit.com/get_batches_by_farm');
    Map body = {
      "farm_id": id,
    };
    Map<String, String> headers = {"Content-Type": "application/json"};
    final res = await http.post(uri, body: jsonEncode(body), headers: headers);
    if (res.statusCode == 200) {
      Batches batches = Batches.fromJson(jsonDecode(res.body));
      return batches;
    }
    return null;
  }

  @override
  void initState() {
    getBatches();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Data"),
        // actions: [
        //   IconButton(onPressed: () {}, icon: const Icon(Icons.person_rounded))
        // ],
      ),
      body: FutureBuilder(
          future: getBatches(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                int len = snapshot.data!.batches!.length;
                if (len != 0) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: len,
                    // crossAxisCount: 2,
                    padding: const EdgeInsets.all(15),
                    itemBuilder: (ctx, index) {
                      // print(index);
                      return BatchCard(
                        batch: snapshot.data!.batches![index],
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No Batches"));
                }
              }
              return const Center(child: Text("No Batches"));
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class BatchCard extends StatelessWidget {
  const BatchCard({
    super.key,
    required this.batch,
  });

  // final heroController = AnimationController(
  //   duration: Duration(milliseconds: 300),
  //   vsync: this,
  // );

  final Batch batch;

  @override
  Widget build(BuildContext context) {

    // print(jsonEncode(batch));
    final url = batch.images![0];

    // final url = batch.images!.isEmpty ? 'no-image.png' : batch.images![0];
    return Hero(
      tag: url,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => DetailPage(batch: batch)));
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl: 'http://angkit.ktsabit.com/static/$url',
                  fit: BoxFit.cover,
                ),
                // child: Image.network(
                //   'http://angkit.ktsabit.com/static/$url',
                //   // 'https://placehold.co/500x500?text=No%20image',
                //   fit: BoxFit.cover,
                // ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.width / 1.2,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [Colors.black, Colors.transparent],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          batch.nama!,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(4.0),
                        //   child: GestureDetector(
                        //     onTap: () {},
                        //     child: const Icon(Icons.edit, color: Colors.white),
                        //     // style: IconButton.styleFrom(backgroundColor: Colors.greenAccent),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
