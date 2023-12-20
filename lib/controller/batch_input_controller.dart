import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BatchInputController {
  final jenisTernak = TextEditingController();
  final tannggalMulai = TextEditingController();

  Future<void> sendData(File file) async {
    Uri uri = Uri.parse('http://angkit.ktsabit.com/add_batch_img');
    String batch_id = '8u4Hti';
    // String batch_id = 'ur3U9i';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString("username")!;

    debugPrint("sending...");

    var request = http.MultipartRequest("POST", uri);
    debugPrint(file.path);
    request.files.add(http.MultipartFile.fromBytes(
      'file',
      await file.readAsBytes(),
      // contentType: MediaType.parse(mimeType),
      filename: 'myImage.png',
    ));
    request.fields['batch_id'] = batch_id;
    final res = await request.send();
    debugPrint(await res.stream.bytesToString());
    // request.send().then((response) async {
    //   if (response.statusCode == 200) print("Uploaded!");
    //   var a = await response.stream.bytesToString();
    //   print(a);
    // });
  }
}
