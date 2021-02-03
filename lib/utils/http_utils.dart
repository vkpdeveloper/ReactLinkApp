import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:react_link_app/models/domain.dart';
import 'package:react_link_app/models/folder.dart';
import 'package:react_link_app/models/pixel.dart';
import 'package:react_link_app/models/plans.dart';
import 'package:react_link_app/utils/localstorage_utils.dart';
import 'package:react_link_app/utils/models/userprofile.dart';

class HttpUtils {
  static String hostURL = "http://3.9.169.3:5000";

  static LocalStorageUtils _localStorageUtils = LocalStorageUtils();

  static final _commonHeaders = {
    "Content-Type": "application/json",
  };
  static final _headerWithAuth = {
    ..._commonHeaders,
    "authorization": _localStorageUtils.getAuthToken()
  };

  static Future<List<Plan>> getPlans() async {
    List<Plan> plans = [];
    http.Response res = await http.get("$hostURL/plans");
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      var rowPlans = data['plans'];
      for (var item in rowPlans) {
        Plan plan = Plan.fromJson(item);
        plans.add(plan);
      }
      return plans;
    } else {
      return [];
    }
  }

  static Future<bool> login(
      {@required String email, @required String password}) async {
    String endPoint = "/user/login";

    try {
      final res = await http.post("$hostURL$endPoint",
          headers: _commonHeaders,
          body: jsonEncode({"password": password, "email": email}));
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        _localStorageUtils.addUserAuthToken("Basic ${data['token']}");
        print(_localStorageUtils.getAuthToken());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("$hostURL$endPoint");
      print(e.toString());
      return false;
    }
  }

  static Future<bool> deletePixel({String id}) async {
    try {
      final _headerWithAuth = {
        ..._commonHeaders,
        "authorization": _localStorageUtils.getAuthToken()
      };
      String endPoint = "/pixels/delete/$id";
      http.Response res =
          await http.get("$hostURL$endPoint", headers: _headerWithAuth);
      print(res.body);
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<List<Pixel>> getPixels() async {
    try {
      final _headerWithAuth = {
        ..._commonHeaders,
        "authorization": _localStorageUtils.getAuthToken()
      };
      List<Pixel> pixels = [];
      String endPoint = "/pixels";

      final res = await http.get(
        "$hostURL$endPoint",
        headers: _headerWithAuth,
      );
      print(res.body);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        var rowPixels = data['pixels'];
        for (var item in rowPixels) {
          Pixel pixel = Pixel.fromJson(item);
          pixels.add(pixel);
        }
        return pixels;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //post api for Allpixels

  static Future<bool> addPixel({
    @required String name,
    @required String tag,
    @required String provider,
  }) async {
    final _headerWithAuth = {
      ..._commonHeaders,
      "authorization": _localStorageUtils.getAuthToken()
    };
    String endPoint = "/pixels";
    final res = await http.post("$hostURL$endPoint",
        headers: _headerWithAuth,
        body: jsonEncode({"name": name, "tag": tag, "provider": provider}));

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print(data);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> editPixel(
      {@required String name,
      @required String tag,
      @required String provider,
      @required String id}) async {
    final _headerWithAuth = {
      ..._commonHeaders,
      "authorization": _localStorageUtils.getAuthToken()
    };
    String endPoint = "/pixels/edit";
    final res = await http.post("$hostURL$endPoint",
        headers: _headerWithAuth,
        body: jsonEncode(
            {"name": name, "tag": tag, "provider": provider, "id": id}));

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print(data);
      return true;
    } else {
      return false;
    }
  }

  static Future<List<Folders>> getFolders() async {
    try {
      final _headerWithAuth = {
        ..._commonHeaders,
        "authorization": _localStorageUtils.getAuthToken()
      };
      List<Folders> folders = [];
      String endPoint = "/folders";

      final res = await http.get(
        "$hostURL$endPoint",
        headers: _headerWithAuth,
      );
      print(res.body);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        var rowFolders = data['folders'];
        for (var item in rowFolders) {
          Folders folder = Folders.fromJson(item);
          folders.add(folder);
        }
        return folders;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

// post api for create Folders

  static Future<bool> createFolder({
    @required String name,
    @required String status,
  }) async {
    final _headerWithAuth = {
      ..._commonHeaders,
      "authorization": _localStorageUtils.getAuthToken()
    };
    String endPoint = "/folders";
    final res = await http.post("$hostURL$endPoint",
        headers: _headerWithAuth,
        body: jsonEncode({"name": name, "status": status}));

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print(data);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteFolders({String id}) async {
    try {
      final _headerWithAuth = {
        ..._commonHeaders,
        "authorization": _localStorageUtils.getAuthToken()
      };
      String endPoint = "/folders/delete/$id";
      http.Response res =
          await http.get("$hostURL$endPoint", headers: _headerWithAuth);
      print(res.body);
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // Link delete post
  static Future<bool> addLinkToFolder({
    String addLinkToFOlder,
  }) async {
    try {
      final _headerWithAuth = {
        ..._commonHeaders,
        "authorization": _localStorageUtils.getAuthToken()
      };
      String endPoint = "/folders/add/";
      http.Response res = await http.post(
        "$hostURL$endPoint",
        headers: _headerWithAuth,
        body: jsonEncode({
          "addLinkFolder": addLinkToFOlder,
        }),
      );
      print(res.body);
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  //post api for edit Folder info

  static Future<bool> editFolder(
      {@required String name,
      @required String status,
      @required String id}) async {
    final _headerWithAuth = {
      ..._commonHeaders,
      "authorization": _localStorageUtils.getAuthToken()
    };
    String endPoint = "/folders/edit";
    final res = await http.post("$hostURL$endPoint",
        headers: _headerWithAuth,
        body: jsonEncode({"name": name, "status": status, "id": id}));

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print(data);
      return true;
    } else {
      return false;
    }
  }

  static Future<List<Domain>> getDomains() async {
    try {
      final _headerWithAuth = {
        ..._commonHeaders,
        "authorization": _localStorageUtils.getAuthToken()
      };
      List<Domain> domains = [];
      String endPoint = "/domains";

      final res = await http.get(
        "$hostURL$endPoint",
        headers: _headerWithAuth,
      );
      print(res.body);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        var rowDomains = data['domains'];
        for (var item in rowDomains) {
          Domain domain = Domain.fromJson(item);
          domains.add(domain);
        }
        return domains;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //post api for add new Domain

  static Future<bool> addDomain({
    @required String domain,
    @required String domainUrl,
  }) async {
    final _headerWithAuth = {
      ..._commonHeaders,
      "authorization": _localStorageUtils.getAuthToken()
    };
    String endPoint = "/domains";
    final res = await http.post("$hostURL$endPoint",
        headers: _headerWithAuth,
        body: jsonEncode({"domain": domain, "defaultUrl": domainUrl}));
    print(res.body);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print(data);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> editDomain({
    @required String domain,
    @required String domainUrl,
  }) async {
    final _headerWithAuth = {
      ..._commonHeaders,
      "authorization": _localStorageUtils.getAuthToken()
    };
    String endPoint = "/domains/update";
    final res = await http.post("$hostURL$endPoint",
        headers: _headerWithAuth,
        body: jsonEncode({"domain": domain, "defaultUrl": domainUrl}));
    print(res.body);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print(data);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteDomain({
    String domain,
  }) async {
    try {
      final _headerWithAuth = {
        ..._commonHeaders,
        "authorization": _localStorageUtils.getAuthToken()
      };
      String endPoint = "/domains/delete/";
      http.Response res = await http.post("$hostURL$endPoint",
          headers: _headerWithAuth,
          body: jsonEncode({
            "domain": domain,
          }));
      print(res.body);
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  //post api update domain

  static Future<bool> updateDomain({
    String updateDomain,
  }) async {
    try {
      final _headerWithAuth = {
        ..._commonHeaders,
        "authorization": _localStorageUtils.getAuthToken()
      };
      String endPoint = "/domains/update/";
      http.Response res = await http.post("$hostURL$endPoint",
          headers: _headerWithAuth,
          body: jsonEncode({
            "domain": updateDomain,
          }));
      print(res.body);
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

// Link delete post
  static Future<bool> deleteLinks({
    String link,
  }) async {
    try {
      final _headerWithAuth = {
        ..._commonHeaders,
        "authorization": _localStorageUtils.getAuthToken()
      };
      String endPoint = "/link/delete/";
      http.Response res = await http.post(
        "$hostURL$endPoint",
        headers: _headerWithAuth,
        body: jsonEncode({
          "link": link,
        }),
      );
      print(res.body);
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  //get api for user profile

  static Future<UserProfile> getUserProfile() async {
    try {
      String endPoint = "/user/profile";
      final _headerWithAuth = {
        ..._commonHeaders,
        "authorization": _localStorageUtils.getAuthToken()
      };
      final res = await http.get(
        "$hostURL$endPoint",
        headers: _headerWithAuth,
      );
      print(res.body);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        UserProfile profile = UserProfile.fromJson(data['profile']);
        return profile;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
