import 'package:react_link_app/models/plans.dart';

class UserProfile {
  List<Roles> roles;
  bool isUpgraded;
  Null note;
  String status;
  String sId;
  String fname;
  String lname;
  String email;
  Plan plan;
  String updatedAt;
  String createdAt;

  UserProfile(
      {this.roles,
      this.isUpgraded,
      this.note,
      this.status,
      this.sId,
      this.fname,
      this.lname,
      this.email,
      this.plan,
      this.updatedAt,
      this.createdAt});

  UserProfile.fromJson(Map<String, dynamic> json) {
    if (json['roles'] != null) {
      roles = new List<Roles>();
      json['roles'].forEach((v) {
        roles.add(new Roles.fromJson(v));
      });
    }
    isUpgraded = json['isUpgraded'];
    note = json['note'];
    status = json['status'];
    sId = json['_id'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    plan = json['plan'] != null ? new Plan.fromJson(json['plan']) : null;
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.roles != null) {
      data['roles'] = this.roles.map((v) => v.toJson()).toList();
    }
    data['isUpgraded'] = this.isUpgraded;
    data['note'] = this.note;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    if (this.plan != null) {
      data['plan'] = this.plan.toJson();
    }
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Roles {
  String sId;
  String status;
  String name;
  String endPoint;
  String icon;
  int iV;

  Roles({this.sId, this.status, this.name, this.endPoint, this.icon, this.iV});

  Roles.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    name = json['name'];
    endPoint = json['endPoint'];
    icon = json['icon'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['status'] = this.status;
    data['name'] = this.name;
    data['endPoint'] = this.endPoint;
    data['icon'] = this.icon;
    data['__v'] = this.iV;
    return data;
  }
}
