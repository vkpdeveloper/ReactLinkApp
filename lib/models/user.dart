class User {
  String _sId;
  String _status;
  String _name;
  String _endPoint;
  String _icon;
  int _iV;

  User(
      {String sId,
      String status,
      String name,
      String endPoint,
      String icon,
      int iV}) {
    this._sId = sId;
    this._status = status;
    this._name = name;
    this._endPoint = endPoint;
    this._icon = icon;
    this._iV = iV;
  }

  String get sId => _sId;
  set sId(String sId) => _sId = sId;
  String get status => _status;
  set status(String status) => _status = status;
  String get name => _name;
  set name(String name) => _name = name;
  String get endPoint => _endPoint;
  set endPoint(String endPoint) => _endPoint = endPoint;
  String get icon => _icon;
  set icon(String icon) => _icon = icon;
  int get iV => _iV;
  set iV(int iV) => _iV = iV;

  User.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _status = json['status'];
    _name = json['name'];
    _endPoint = json['endPoint'];
    _icon = json['icon'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['status'] = this._status;
    data['name'] = this._name;
    data['endPoint'] = this._endPoint;
    data['icon'] = this._icon;
    data['__v'] = this._iV;
    return data;
  }
}
