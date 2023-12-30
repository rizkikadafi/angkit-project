import 'package:angkit_project/pages/batch_edit_page.dart';
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
        // actions: [
        //   IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
        // ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
        child: const Icon(Icons.edit),
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

class BatchData extends StatelessWidget {
  const BatchData({super.key, required this.batch});

  final Batch batch;

  @override
  Widget build(BuildContext context) {
    final url = batch.images![0];
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => EditPage(batch: batch)));
          },
          backgroundColor: Theme.of(context).colorScheme.secondary,
          foregroundColor: Colors.white,
          child: const Icon(Icons.edit),
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            ListView(
              children: [
                Hero(
                  tag: url,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const PageScrollPhysics(),
                      itemCount: batch.images!.length,
                      itemBuilder: (ctx, index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CachedNetworkImage(
                            imageUrl:
                                "http://angkit.ktsabit.com/static/${batch.images![index]}",
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     const SizedBox(height: 5.0),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           const Row(
                //             children: [
                //               Text(
                //                 "ID ",
                //                 style: TextStyle(
                //                     fontSize: 30,
                //                     // fontWeight: FontWeight.bold,
                //                     color: Colors.black),
                //               ),
                //               Text(
                //                 "jf8U31",
                //                 style: TextStyle(
                //                     fontSize: 30,
                //                     fontWeight: FontWeight.bold,
                //                     color: Colors.black),
                //               ),
                //             ],
                //           ),
                //           Chip(
                //             // labelPadding: EdgeInsets.fromLTRB(0, -6, 0, -6),
                //             // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //             label: const Text(
                //               "Ayam",
                //               style: TextStyle(
                //                   fontSize: 12,
                //                   fontWeight: FontWeight.bold,
                //                   color: Colors.white),
                //             ),
                //             avatar: Image.asset("assets/img/chicken.png"),
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(50),
                //               side: const BorderSide(
                //                   color: Color.fromARGB(0, 0, 0, 0),
                //                   width: 0),
                //             ),
                //             backgroundColor: const Color(0xff3BABEA),
                //           ),
                //         ],
                //       ),
                //     ),
                //     const SizedBox(height: 10.0),
                //     const Divider(
                //       // height: 2,
                //       thickness: 10,
                //       color: Color(0xffF6F6F6),
                //     ),
                //     const SizedBox(height: 10.0),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                //       child: Row(
                //         children: [
                //           Container(
                //             // margin: const EdgeInsets.all(15.0),
                //             width: 170,
                //             padding: const EdgeInsets.all(3.0),
                //             decoration: BoxDecoration(
                //               border: Border.all(
                //                   color: const Color(0xff66B357),
                //                   style: BorderStyle.solid),
                //               borderRadius: BorderRadius.circular(20.0),
                //             ),
                //             child: const Column(
                //               children: [
                //                 SizedBox(height: 15),
                //                 Icon(
                //                   Icons.check_circle,
                //                   color: Colors.green,
                //                   size: 65.0,
                //                 ),
                //                 SizedBox(height: 5),
                //                 Text(
                //                   "Ayam Sangat Segar",
                //                   style: TextStyle(
                //                       fontSize: 14,
                //                       fontWeight: FontWeight.bold,
                //                       color: Color(0xff66B357)),
                //                 ),
                //                 SizedBox(height: 2),
                //                 Text(
                //                   "360 Hari Setelah dipotong",
                //                   style: TextStyle(
                //                       fontSize: 12,
                //                       // fontWeight: FontWeight.bold,
                //                       color: Color(0xff909090)),
                //                 ),
                //                 SizedBox(height: 15),
                //               ],
                //             ),
                //           ),
                //           const SizedBox(width: 15.0),
                //           Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Container(
                //                 width: 22.0,
                //                 height: 22.0,
                //                 decoration: BoxDecoration(
                //                   shape: BoxShape.circle,
                //                   border: Border.all(
                //                     color: const Color(0xff909090),
                //                     width: 1.0,
                //                   ),
                //                 ),
                //                 child: Image.asset("assets/img/farm.png"),
                //               ),
                //               Container(
                //                 width: 1.0,
                //                 height: 38.0,
                //                 decoration: const BoxDecoration(
                //                   color: Color(0xff909090),
                //                 ),
                //               ),
                //               Container(
                //                 width: 22.0,
                //                 height: 22.0,
                //                 decoration: BoxDecoration(
                //                   shape: BoxShape.circle,
                //                   border: Border.all(
                //                     color: const Color(0xff909090),
                //                     width: 1.5,
                //                   ),
                //                 ),
                //                 child: Image.asset("assets/img/butcher.png"),
                //               ),
                //               Container(
                //                 width: 1.0,
                //                 height: 38.0,
                //                 decoration: const BoxDecoration(
                //                   color: Color(0xff909090),
                //                 ),
                //               ),
                //               Container(
                //                 width: 22.0,
                //                 height: 22.0,
                //                 decoration: BoxDecoration(
                //                   shape: BoxShape.circle,
                //                   border: Border.all(
                //                     color: const Color(0xff909090),
                //                     width: 1.0,
                //                   ),
                //                 ),
                //                 child: Image.asset("assets/img/packing.png"),
                //               ),
                //             ],
                //           ),
                //           const SizedBox(width: 8.0),
                //           const Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 "Mulai Ternak",
                //                 style: TextStyle(
                //                     fontSize: 14,
                //                     fontWeight: FontWeight.bold,
                //                     color: Colors.black),
                //               ),
                //               Text(
                //                 "10 November 2023, 00:00",
                //                 style: TextStyle(
                //                     fontSize: 12,
                //                     // fontWeight: FontWeight.bold,
                //                     color: Color(0xff909090)),
                //               ),
                //               SizedBox(height: 20.0),
                //               Text(
                //                 "Pemotongan Ternak",
                //                 style: TextStyle(
                //                     fontSize: 14,
                //                     fontWeight: FontWeight.bold,
                //                     color: Colors.black),
                //               ),
                //               Text(
                //                 "10 November 2023, 00:00",
                //                 style: TextStyle(
                //                     fontSize: 12,
                //                     // fontWeight: FontWeight.bold,
                //                     color: Color(0xff909090)),
                //               ),
                //               SizedBox(height: 20.0),
                //               Text(
                //                 "Pengemasan Daging",
                //                 style: TextStyle(
                //                     fontSize: 14,
                //                     fontWeight: FontWeight.bold,
                //                     color: Colors.black),
                //               ),
                //               Text(
                //                 "10 November 2023, 00:00",
                //                 style: TextStyle(
                //                     fontSize: 12,
                //                     // fontWeight: FontWeight.bold,
                //                     color: Color(0xff909090)),
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 10.0),
                const Divider(
                  // height: 2,
                  thickness: 10,
                  // indent: 20,
                  endIndent: 0,
                  color: Color(0xffF6F6F6),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Detail Ternak/Batch",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          const SizedBox(
                            width: 200.0,
                            child: Text(
                              "ID",
                              style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Color(0xff909090),
                              ),
                            ),
                          ),
                          Text(
                            batch.id!,
                            style: const TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        // indent: 20,
                        // endIndent: 0,
                        color: Color(0xffF6F6F6),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 200.0,
                            child: Text(
                              "Nama",
                              style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Color(0xff909090),
                              ),
                            ),
                          ),
                          Text(
                            batch.nama!,
                            style: const TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        // indent: 20,
                        // endIndent: 0,
                        color: Color(0xffF6F6F6),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 200.0,
                            child: Text(
                              "Spesies Ternak",
                              style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Color(0xff909090),
                              ),
                            ),
                          ),
                          Text(
                            batch.spesies!,
                            style: const TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        // indent: 20,
                        // endIndent: 0,
                        color: Color(0xffF6F6F6),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 200.0,
                            child: Text(
                              "Berat Rata-rata Batch",
                              style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Color(0xff909090),
                              ),
                            ),
                          ),
                          Text(
                            "${batch.beratRtSample} Kg",
                            style: const TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        // indent: 20,
                        // endIndent: 0,
                        color: Color(0xffF6F6F6),
                      ),

                      const SizedBox(height: 20.0),
                      const Text(
                        "Timeline",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          const SizedBox(
                            width: 200.0,
                            child: Text(
                              "Tanggal Mulai",
                              style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Color(0xff909090),
                              ),
                            ),
                          ),
                          Text(
                            batch.tglMulai!,
                            style: const TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        // indent: 20,
                        // endIndent: 0,
                        color: Color(0xffF6F6F6),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 200.0,
                            child: Text(
                              "Tanggal Kemas",
                              style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Color(0xff909090),
                              ),
                            ),
                          ),
                          Text(
                            batch.tglPotong ?? 'Belum',
                            style: const TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        // indent: 20,
                        // endIndent: 0,
                        color: Color(0xffF6F6F6),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 200.0,
                            child: Text(
                              "Tanggal Kemas",
                              style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Color(0xff909090),
                              ),
                            ),
                          ),
                          Text(
                            batch.tglKemas ?? 'Belum',
                            style: const TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        // indent: 20,
                        // endIndent: 0,
                        color: Color(0xffF6F6F6),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Peternakan",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          const SizedBox(
                            width: 200.0,
                            child: Text(
                              "Nama Peternakan",
                              style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Color(0xff909090),
                              ),
                            ),
                          ),
                          Text(
                            batch.peternak!.nama!,
                            style: const TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        // indent: 20,
                        // endIndent: 0,
                        color: Color(0xffF6F6F6),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 200.0,
                            child: Text(
                              "Lokasi Peternakan",
                              style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Color(0xff909090),
                              ),
                            ),
                          ),
                          Text(
                            batch.peternak!.lokasi!,
                            style: const TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        // indent: 20,
                        // endIndent: 0,
                        color: Color(0xffF6F6F6),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        "Distributor",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          const SizedBox(
                            width: 200.0,
                            child: Text(
                              "Nama Distributor",
                              style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Color(0xff909090),
                              ),
                            ),
                          ),
                          Text(
                            batch.distributor != null
                                ? batch.distributor!.nama!
                                : 'Not distributed',
                            style: const TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        // indent: 20,
                        // endIndent: 0,
                        color: Color(0xffF6F6F6),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 200.0,
                            child: Text(
                              "Lokasi Distributor",
                              style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Color(0xff909090),
                              ),
                            ),
                          ),
                          Text(
                            batch.distributor != null
                                ? batch.distributor!.lokasi!
                                : 'Not distributed',
                            style: const TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        // indent: 20,
                        // endIndent: 0,
                        color: Color(0xffF6F6F6),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                flexibleSpace: Container(
                  height: 70,
                  // color: Colors.red,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(126, 0, 0, 0),
                        Color(0x00000000),
                      ],
                    ),
                  ),
                ),
                elevation: 0.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
