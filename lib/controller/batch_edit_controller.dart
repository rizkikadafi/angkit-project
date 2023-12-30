import 'dart:convert';

import 'package:http/http.dart' as http;

class BatchEditController {



  static Future<String> batchUpdateFarm(
    String id,
    double berat,
    String tglMulai,
    String namaBatch,
  ) async {
    Map data = {
      "id": id,
      "beratRata": berat,
      "tanggalMulai": tglMulai,
      "nama": namaBatch,
    };
    print(data);
    Uri uri = Uri.parse('http://angkit.ktsabit.com/updateBatch');
    final res = await http.put(
      uri,
      body: jsonEncode(data),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    final jsonRes = jsonDecode(res.body);
    print(jsonRes);
    if (jsonRes['status'] == 'ok') return "ok";
    return jsonRes["message"];
  }

  static Future<String> batchUpdateDist(String id, String packingDate) async {
    Map data = {
      "id": id,
      "tanggalKemas": packingDate,
    };
    print(data);
    Uri uri = Uri.parse('http://angkit.ktsabit.com/updateBatch');
    final res = await http.put(
      uri,
      body: jsonEncode(data),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    final jsonRes = jsonDecode(res.body);
    print(jsonRes);
    if (jsonRes['status'] == 'ok') return "ok";
    return jsonRes["message"];
  }
}
