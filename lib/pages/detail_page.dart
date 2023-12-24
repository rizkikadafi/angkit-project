import 'package:angkit_project/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.batch});

  final Batch batch;

  @override
  Widget build(BuildContext context) {
    final url = batch.images![0];
    // final url = batch.images!.isEmpty ? 'no-image.png' : batch.images![0];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: Hero(
              tag: url,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    barrierColor: Colors.black,
                    context: context,
                    builder: (ctx) {
                      return InteractiveViewer(
                        maxScale: 10,
                        child: Dialog(
                          child: CachedNetworkImage(
                            imageUrl: 'http://angkit.ktsabit.com/static/$url',
                          ),
                          // child: Image.network(
                          //   'http://angkit.ktsabit.com/static/$url',
                          // ),
                        ),
                      );
                    },
                  );
                },
                child: CachedNetworkImage(
                  imageUrl: 'http://angkit.ktsabit.com/static/$url',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Detail Batch'),
                Text('NAMA', style: AppTheme.label),
                Text(batch.nama!),
                Text('SPESIES', style: AppTheme.label),
                Text(batch.spesies!),

                // Container(
                //   height: 20,
                //   width: double.infinity,
                //   color: Colors.red,
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
