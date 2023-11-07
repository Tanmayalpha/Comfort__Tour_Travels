/// status : "1"
/// msg : "Service providers"
/// setting : [{"id":"2","title":"Why is Comfort Tour & Travels the best website to prepare a Tour application?","description":"<p>The pain itself is important, the sadipscing elitr is established, but the diam nonumy is so envious of the time that with labor and pain there was something great, but the diam volupta. But indeed I will accuse them and just two pains and I will take&"}]

class Faqmodel {
  Faqmodel({
      String? status, 
      String? msg, 
      List<Setting>? setting,}){
    _status = status;
    _msg = msg;
    _setting = setting;
}

  Faqmodel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    if (json['setting'] != null) {
      _setting = [];
      json['setting'].forEach((v) {
        _setting?.add(Setting.fromJson(v));
      });
    }
  }
  String? _status;
  String? _msg;
  List<Setting>? _setting;
Faqmodel copyWith({  String? status,
  String? msg,
  List<Setting>? setting,
}) => Faqmodel(  status: status ?? _status,
  msg: msg ?? _msg,
  setting: setting ?? _setting,
);
  String? get status => _status;
  String? get msg => _msg;
  List<Setting>? get setting => _setting;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    if (_setting != null) {
      map['setting'] = _setting?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "2"
/// title : "Why is Comfort Tour & Travels the best website to prepare a Tour application?"
/// description : "<p>The pain itself is important, the sadipscing elitr is established, but the diam nonumy is so envious of the time that with labor and pain there was something great, but the diam volupta. But indeed I will accuse them and just two pains and I will take&"

class Setting {
  Setting({
      String? id, 
      String? title, 
      String? description,}){
    _id = id;
    _title = title;
    _description = description;
}

  Setting.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
  }
  String? _id;
  String? _title;
  String? _description;
Setting copyWith({  String? id,
  String? title,
  String? description,
}) => Setting(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
);
  String? get id => _id;
  String? get title => _title;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    return map;
  }

}