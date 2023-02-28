/// status : 1
/// description : "Application Keys List"
/// data : [{"a_k_id":33,"a_id":6,"key_name":"App Open","key_id":"ca-app-pub-3940256099942544/3419835294"},{"a_k_id":34,"a_id":6,"key_name":"Banner","key_id":"ca-app-pub-3940256099942544/6300978111"},{"a_k_id":35,"a_id":6,"key_name":"Interstitial","key_id":"ca-app-pub-3940256099942544/1033173712"},{"a_k_id":36,"a_id":6,"key_name":"Interstitial Video","key_id":"ca-app-pub-3940256099942544/8691691433"},{"a_k_id":37,"a_id":6,"key_name":"Rewarded","key_id":"ca-app-pub-3940256099942544/5224354917"},{"a_k_id":38,"a_id":6,"key_name":"Native Advanced","key_id":"ca-app-pub-3940256099942544/2247696110"}]

class ApiModel {
  ApiModel({
    num? status,
    String? description,
    List<Data>? data,
  }) {
    _status = status;
    _description = description;
    _data = data;
  }

  ApiModel.fromJson(dynamic json) {
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
  ApiModel copyWith({
    num? status,
    String? description,
    List<Data>? data,
  }) =>
      ApiModel(
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

/// a_k_id : 33
/// a_id : 6
/// key_name : "App Open"
/// key_id : "ca-app-pub-3940256099942544/3419835294"

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
