import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BatchInputController {

  static Future<String> distributorAddBatch (String batch) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("id")!;
    Uri uri = Uri.parse('http://angkit.ktsabit.com/updateBatch');
    Map data = {
      "distributor": id,
      "id": batch,
    };

    Map<String,String> headers = {
      'Content-Type': 'application/json'
    };

    final result = await http.put(uri, body: jsonEncode(data), headers: headers);
    // print(result.body);
    final jsonRes = jsonDecode(result.body);

    if (jsonRes['status'] == 'error') {
      return jsonRes['message'];
    }

    return 'Success add batch';

  }

  static Future<void> sendData(
    File file,
    BuildContext ctx,
    String jenisTernak,
    String tanggalMulai,
    String nama,
    String spesies,
  ) async {
    Uri addBatchUri = Uri.parse('http://angkit.ktsabit.com/inputBatch');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("id")!;

    debugPrint(id);

    Map data = {
      "beratRata": null,
      "distributor": null,
      "tanggalPotong": null,
      "tanggalKemas": null,
      "jenisTernak": jenisTernak,
      "peternak": id,
      "tanggalMulai": tanggalMulai,
      "nama": nama,
      "spesies": spesies,
    };

    Map<String, String> headers = {'Content-Type': 'application/json'};

    final res =
        await http.post(addBatchUri, body: jsonEncode(data), headers: headers);

    Map resData;
    try {
      resData = jsonDecode(res.body);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return;
    }

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


    int dotIndex = file.absolute.path.lastIndexOf('.');
    String ext = file.absolute.path.substring(dotIndex);
    String fileName = file.absolute.path.substring(0, dotIndex);

    String outputPath = "${fileName}_out$ext";


    var compressedFile = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outputPath,
      quality: 20,
    );

    request.files.add(http.MultipartFile.fromBytes(
      'file',
      // await file.readAsBytes(),
      await compressedFile!.readAsBytes(),
      filename: 'myImage.png',
    ));
    request.fields['batch_id'] = batchId;
    final result = await request.send();
    debugPrint(await result.stream.bytesToString());

    if (result.statusCode == 201) {
      Fluttertoast.showToast(msg: 'success');
      Navigator.of(ctx).pop();
    }
    // final res = await request.send();
    // request.send().then((response) async {
    //   print(response.statusCode);
    //   if (response.statusCode == 201) {
    //     print(await response.stream.bytesToString());
    //     Fluttertoast.showToast(msg: 'success');
    //   }
    //   // var a = await response.stream.bytesToString();
    //   // print(a);
    // });
  }
}
