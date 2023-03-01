import 'dart:convert';

class Admodel {
  Admodel({
    num? status,
    String? description,
    List<Data>? data,
  }) {
    _status = status;
    _description = description;
    _data = data;
  }

  Admodel.fromJson(dynamic json) {
    _status = json['status'];
    _description = json['description'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _status;
  String? _description;
  List<Data>? _data;
  Admodel copyWith({
    num? status,
    String? description,
    List<Data>? data,
  }) =>
      Admodel(
        status: status ?? _status,
        description: description ?? _description,
        data: data ?? _data,
      );
  num? get status => _status;
  String? get description => _description;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['description'] = _description;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    num? aKId,
    num? aId,
    String? keyName,
    String? keyId,
  }) {
    _aKId = aKId;
    _aId = aId;
    _keyName = keyName;
    _keyId = keyId;
  }

  Data.fromJson(dynamic json) {
    _aKId = json['a_k_id'];
    _aId = json['a_id'];
    _keyName = json['key_name'];
    _keyId = json['key_id'];
  }
  num? _aKId;
  num? _aId;
  String? _keyName;
  String? _keyId;
  Data copyWith({
    num? aKId,
    num? aId,
    String? keyName,
    String? keyId,
  }) =>
      Data(
        aKId: aKId ?? _aKId,
        aId: aId ?? _aId,
        keyName: keyName ?? _keyName,
        keyId: keyId ?? _keyId,
      );
  num? get aKId => _aKId;
  num? get aId => _aId;
  String? get keyName => _keyName;
  String? get keyId => _keyId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['a_k_id'] = _aKId;
    map['a_id'] = _aId;
    map['key_name'] = _keyName;
    map['key_id'] = _keyId;
    return map;
  }
}

// To parse this JSON data, do
//
//     final adModel = adModelFromJson(jsonString);

AdModel adModelFromJson(String str) => AdModel.fromJson(json.decode(str));

String adModelToJson(AdModel data) => json.encode(data.toJson());

class AdModel {
  AdModel({
    required this.status,
    required this.description,
    required this.data,
  });

  int status;
  String description;
  List<Datum> data;

  factory AdModel.fromJson(Map<String, dynamic> json) => AdModel(
        status: json["status"],
        description: json["description"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "description": description,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.aKId,
    required this.aId,
    required this.keyName,
    required this.keyId,
  });

  int aKId;
  int aId;
  String keyName;
  String keyId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        aKId: json["a_k_id"],
        aId: json["a_id"],
        keyName: json["key_name"],
        keyId: json["key_id"],
      );

  Map<String, dynamic> toJson() => {
        "a_k_id": aKId,
        "a_id": aId,
        "key_name": keyName,
        "key_id": keyId,
      };
}
