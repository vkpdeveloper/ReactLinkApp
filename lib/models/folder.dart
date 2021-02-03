class Folders {
  List<String> _links;
  String _status;
  String _sId;
  String _user;
  String _name;
  String _updatedAt;
  String _createdAt;
  int _iV;
  bool isDeleteLoading;

  Folders({
    List<String> links,
    String status,
    String sId,
    String user,
    String name,
    String updatedAt,
    String createdAt,
    int iV,
  }) {
    this._links = links;
    this._status = status;
    this._sId = sId;
    this._user = user;
    this._name = name;
    this._updatedAt = updatedAt;
    this._createdAt = createdAt;
    this._iV = iV;
    this.isDeleteLoading = false;
  }

  List<String> get links => _links;
  set links(List<String> links) => _links = links;
  String get status => _status;
  set status(String status) => _status = status;
  String get sId => _sId;
  set sId(String sId) => _sId = sId;
  String get user => _user;
  set user(String user) => _user = user;
  String get name => _name;
  set name(String name) => _name = name;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  int get iV => _iV;
  set iV(int iV) => _iV = iV;

  Folders.fromJson(Map<String, dynamic> json) {
    _links = json['links'].cast<String>();
    _status = json['status'];
    _sId = json['_id'];
    _user = json['user'];
    _name = json['name'];
    _updatedAt = json['updatedAt'];
    _createdAt = json['createdAt'];
    _iV = json['__v'];  isDeleteLoading = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['links'] = this._links;
    data['status'] = this._status;
    data['_id'] = this._sId;
    data['user'] = this._user;
    data['name'] = this._name;
    data['updatedAt'] = this._updatedAt;
    data['createdAt'] = this._createdAt;
    data['__v'] = this._iV;
    return data;
  }
}
