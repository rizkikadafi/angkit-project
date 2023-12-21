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
}


class Batch {
  double? beratRtSample;
  Distributor? distributor;
  String? id;
  List<String>? images;
  String? jenisTernak;
  Distributor? peternak;
  String? tglKemas;
  String? tglMulai;
  String? tglPotong;
  String? nama;
  String? spesies;

  Batch(
      {this.beratRtSample,
        this.distributor,
        this.id,
        this.images,
        this.jenisTernak,
        this.peternak,
        this.tglKemas,
        this.tglMulai,
        this.tglPotong,
        this.nama,
        this.spesies,
      });

  Batch.fromJson(Map<String, dynamic> json) {
    beratRtSample = json['berat_rt_sample'];
    distributor = json['distributor'] != null
        ? Distributor.fromJson(json['distributor'])
        : null;
    id = json['id'];
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
    nama = json['nama'];
    spesies = json['spesies'];
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
}
