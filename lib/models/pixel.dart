class Pixel {
  String sId;
  String status;
  String user;
  String name;
  String provider;
  String tag;
  String updatedAt;
  String createdAt;
  int iV;
  bool isDeleteLoading;

  Pixel(
      {this.sId,
      this.status,
      this.user,
      this.name,
      this.provider,
      this.tag,
      this.updatedAt,
      this.createdAt,
      this.iV,
      this.isDeleteLoading = false});

  Pixel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    user = json['user'];
    name = json['name'];
    provider = json['provider'];
    tag = json['tag'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    isDeleteLoading = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['status'] = this.status;
    data['user'] = this.user;
    data['name'] = this.name;
    data['provider'] = this.provider;
    data['tag'] = this.tag;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
