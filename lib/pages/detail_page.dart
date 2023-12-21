import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Column(
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
        ],
      ),
    );
  }
}
