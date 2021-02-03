class Domain {
  String _status;
  String _sId;
  String _user;
  String _domain;
  String _defaultUrl;
  String _updatedAt;
  String _createdAt;
  int _iV;
  bool isDeleteLoading;

  Domain(
      {String status,
      String sId,
      String user,
      String domain,
      String defaultUrl,
      String updatedAt,
      String createdAt,
      int iV
      }
      )
       {
    this._status = status;
    this._sId = sId;
    this._user = user;
    this._domain = domain;
    this._defaultUrl = defaultUrl;
    this._updatedAt = updatedAt;
    this._createdAt = createdAt;
    this._iV = iV;
    this.isDeleteLoading = false;
  }

  String get status => _status;
  set status(String status) => _status = status;
  String get sId => _sId;
  set sId(String sId) => _sId = sId;
  String get user => _user;
  set user(String user) => _user = user;
  String get domain => _domain;
  set domain(String domain) => _domain = domain;
  String get defaultUrl => _defaultUrl;
  set defaultUrl(String defaultUrl) => _defaultUrl = defaultUrl;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  int get iV => _iV;
  set iV(int iV) => _iV = iV;

  Domain.fromJson(Map<String, dynamic> json) 
  {
    _status = json['status'];
    _sId = json['_id'];
    _user = json['user'];
    _domain = json['domain'];
    _defaultUrl = json['defaultUrl'];
    _updatedAt = json['updatedAt'];
    _createdAt = json['createdAt'];
    _iV = json['__v'];
     isDeleteLoading = false;
  }

  Map<String, dynamic> toJson()
   {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['_id'] = this._sId;
    data['user'] = this._user;
    data['domain'] = this._domain;
    data['defaultUrl'] = this._defaultUrl;
    data['updatedAt'] = this._updatedAt;
    data['createdAt'] = this._createdAt;
    data['__v'] = this._iV;
    return data;
  }
}
