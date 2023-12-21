import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BatchInputController {
  static final jenisTernak = TextEditingController();
  static final tannggalMulai = TextEditingController();
  static final nama = TextEditingController();
  static final spesies = TextEditingController();

  static Future<void> sendData(File file) async {
    Uri addBatchUri = Uri.parse('http://angkit.ktsabit.com/inputBatch');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString("username")!;
    String id = prefs.getString("id")!;

    debugPrint(id);

    Map data = {
      "beratRata": null,
      "distributor": null,
      "tanggalPotong": null,
      "tanggalKemas": null,
      "jenisTernak": jenisTernak.text,
      "peternak": id,
      "tanggalMulai": tannggalMulai.text,
      "nama":nama.text,
      "spesies":spesies.text,
    };

    Map<String, String> headers = {
      'Content-Type': 'application/json'
    };

    final res = await http.post(addBatchUri, body: jsonEncode(data), headers: headers);

    Map resData = jsonDecode(res.body);
    if (res.statusCode != 201) {
      Fluttertoast.showToast(msg: resData['message']);
      return;
    }

    if (file.path == '') {
      Fluttertoast.showToast(msg: 'No file provided');
      return;
    }

    Uri uri = Uri.parse('http://angkit.ktsabit.com/add_batch_img');
    String batchId = resData['data']['id'];

    var request = http.MultipartRequest("POST", uri);
    debugPrint(file.path);
    request.files.add(http.MultipartFile.fromBytes(
      'file',
      await file.readAsBytes(),
      filename: 'myImage.png',
    ));
    request.fields['batch_id'] = batchId;
    final result = await request.send();
    debugPrint(await result.stream.bytesToString());
    request.send().then((response) async {
      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        Fluttertoast.showToast(msg: 'success');
      }
      // var a = await response.stream.bytesToString();
      // print(a);
    });
  }
}
