class Batches {
  List<Batch>? batches;

  Batches({this.batches});

  Batches.fromJson(Map<String, dynamic> json) {
    if (json['batches'] != null) {
      batches = <Batch>[];
      json['batches'].forEach((v) {
        batches!.add(Batch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (batches != null) {
      data['batches'] = batches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Batch {
  double? beratRtSample;
  Distributor? distributor;
  String? id;
  List<String>? images;
  // List<Images>? images;
  String? jenisTernak;
  Distributor? peternak;
  String? tglKemas;
  String? tglMulai;
  String? tglPotong;

  Batch(
      {this.beratRtSample,
        this.distributor,
        this.id,
        this.images,
        this.jenisTernak,
        this.peternak,
        this.tglKemas,
        this.tglMulai,
        this.tglPotong});

  Batch.fromJson(Map<String, dynamic> json) {
    beratRtSample = json['berat_rt_sample'];
    distributor = json['distributor'] != null
        ? Distributor.fromJson(json['distributor'])
        : null;
    id = json['id'];
    // if (json['images'] != null) {
    //   images = <Images>[];
    //   json['images'].forEach((v) {
    //     images!.add(Images.fromJson(v));
    //   });
    // }
    if (json['images'] != null) {
      images = <String>[];
      json['images'].forEach((v) {
        images!.add(v['filename']);
      });
    }
    jenisTernak = json['jenis_ternak'];
    peternak = json['peternak'] != null
        ? Distributor.fromJson(json['peternak'])
        : null;
    tglKemas = json['tgl_kemas'];
    tglMulai = json['tgl_mulai'];
    tglPotong = json['tgl_potong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['berat_rt_sample'] = beratRtSample;
    if (distributor != null) {
      data['distributor'] = distributor!.toJson();
    }
    data['id'] = id;
    // if (images != null) {
    //   data['images'] = images!.map((v) => v.toJson()).toList();
    // }
    data['jenis_ternak'] = jenisTernak;
    if (peternak != null) {
      data['peternak'] = peternak!.toJson();
    }
    data['tgl_kemas'] = tglKemas;
    data['tgl_mulai'] = tglMulai;
    data['tgl_potong'] = tglPotong;
    return data;
  }
}

class Distributor {
  String? id;
  String? lokasi;
  String? nama;

  Distributor({this.id, this.lokasi, this.nama});

  Distributor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lokasi = json['lokasi'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lokasi'] = lokasi;
    data['nama'] = nama;
    return data;
  }
}

class Images {
  String? filename;
  int? id;

  Images({this.filename, this.id});

  Images.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['filename'] = filename;
    data['id'] = id;
    return data;
  }
}