class Link {
  Redirection redirection;
  Utm utm;
  Stats stats;
  String password;
  Pixel pixel;
  String folder;
  String linkExpiry;
  String fallbackUrl;
  Cta cta;
  String status;
  String sId;
  String user;
  String longUrl;
  String domain;
  String alias;
  String updatedAt;
  String createdAt;
  int iV;

  Link(
      {this.redirection,
      this.utm,
      this.stats,
      this.password,
      this.pixel,
      this.folder,
      this.linkExpiry,
      this.fallbackUrl,
      this.cta,
      this.status,
      this.sId,
      this.user,
      this.longUrl,
      this.domain,
      this.alias,
      this.updatedAt,
      this.createdAt,
      this.iV});

  Link.fromJson(Map<String, dynamic> json) {
    redirection = json['redirection'] != null
        ? new Redirection.fromJson(json['redirection'])
        : null;
    utm = json['utm'] != null ? new Utm.fromJson(json['utm']) : null;
    stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
    password = json['password'];
    pixel = json['pixel'] != null ? new Pixel.fromJson(json['pixel']) : null;
    folder = json['folder'];
    linkExpiry = json['linkExpiry'];
    fallbackUrl = json['fallbackUrl'];
    cta = json['cta'] != null ? new Cta.fromJson(json['cta']) : null;
    status = json['status'];
    sId = json['_id'];
    user = json['user'];
    longUrl = json['longUrl'];
    domain = json['domain'];
    alias = json['alias'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.redirection != null) {
      data['redirection'] = this.redirection.toJson();
    }
    if (this.utm != null) {
      data['utm'] = this.utm.toJson();
    }
    if (this.stats != null) {
      data['stats'] = this.stats.toJson();
    }
    data['password'] = this.password;
    if (this.pixel != null) {
      data['pixel'] = this.pixel.toJson();
    }
    data['folder'] = this.folder;
    data['linkExpiry'] = this.linkExpiry;
    data['fallbackUrl'] = this.fallbackUrl;
    if (this.cta != null) {
      data['cta'] = this.cta.toJson();
    }
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['longUrl'] = this.longUrl;
    data['domain'] = this.domain;
    data['alias'] = this.alias;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Redirection {
  String type;
  List<CountryRedirection> country;
  List<DeviceRedirection> device;

  Redirection({this.type, this.country, this.device});

  Redirection.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['country'] != null) {
      country = new List<CountryRedirection>();
      json['country'].forEach((v) {
        country.add(new CountryRedirection.fromJson(v));
      });
    }
    if (json['device'] != null) {
      device = new List<DeviceRedirection>();
      json['device'].forEach((v) {
        device.add(new DeviceRedirection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.country != null) {
      data['country'] = this.country.map((v) => v.toJson()).toList();
    }
    if (this.device != null) {
      data['device'] = this.device.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountryRedirection {
  String sId;
  String name;
  String longUrl;

  CountryRedirection({this.sId, this.name, this.longUrl});

  CountryRedirection.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    longUrl = json['longUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['longUrl'] = this.longUrl;
    return data;
  }
}

class DeviceRedirection {
  String sId;
  String device;
  String longUrl;

  DeviceRedirection({this.sId, this.device, this.longUrl});

  DeviceRedirection.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    device = json['device'];
    longUrl = json['longUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['device'] = this.device;
    data['longUrl'] = this.longUrl;
    return data;
  }
}

class Utm {
  String source;
  String medium;
  String name;
  String term;
  String content;

  Utm({this.source, this.medium, this.name, this.term, this.content});

  Utm.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    medium = json['medium'];
    name = json['name'];
    term = json['term'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    data['medium'] = this.medium;
    data['name'] = this.name;
    data['term'] = this.term;
    data['content'] = this.content;
    return data;
  }
}

class Stats {
  int totalClicks;
  List<Country> country;
  List<Device> device;

  Stats({this.totalClicks, this.country, this.device});

  Stats.fromJson(Map<String, dynamic> json) {
    totalClicks = json['totalClicks'];
    if (json['country'] != null) {
      country = new List<Country>();
      json['country'].forEach((v) {
        country.add(new Country.fromJson(v));
      });
    }
    if (json['device'] != null) {
      device = new List<Device>();
      json['device'].forEach((v) {
        device.add(new Device.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalClicks'] = this.totalClicks;
    if (this.country != null) {
      data['country'] = this.country.map((v) => v.toJson()).toList();
    }
    if (this.device != null) {
      data['device'] = this.device.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Country {
  String name;
  int clicks;
  String sId;

  Country({this.name, this.clicks, this.sId});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    clicks = json['clicks'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['clicks'] = clicks;
    data['_id'] = this.sId;
    return data;
  }
}

class Device {
  String device;
  int clicks;
  String sId;

  Device({this.device, this.clicks, this.sId});

  Device.fromJson(Map<String, dynamic> json) {
    device = json['device'];
    clicks = json['clicks'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device'] = device;
    data['clicks'] = clicks;
    data['_id'] = this.sId;
    return data;
  }
}

class Pixel {
  String sId;
  String name;
  String provider;
  String tag;

  Pixel({this.sId, this.name, this.provider, this.tag});

  Pixel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    provider = json['provider'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['provider'] = this.provider;
    data['tag'] = this.tag;
    return data;
  }
}

class Cta {
  Button button;
  Design design;
  bool isCustom;
  String script;
  String name;
  String title;
  String message;
  String status;
  String sId;
  String user;
  String updatedAt;
  String createdAt;

  Cta(
      {this.button,
      this.design,
      this.isCustom,
      this.script,
      this.name,
      this.title,
      this.message,
      this.status,
      this.sId,
      this.user,
      this.updatedAt,
      this.createdAt});

  Cta.fromJson(Map<String, dynamic> json) {
    button =
        json['button'] != null ? new Button.fromJson(json['button']) : null;
    design =
        json['design'] != null ? new Design.fromJson(json['design']) : null;
    isCustom = json['isCustom'];
    script = json['script'];
    name = json['name'];
    title = json['title'];
    message = json['message'];
    status = json['status'];
    sId = json['_id'];
    user = json['user'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.button != null) {
      data['button'] = this.button.toJson();
    }
    if (this.design != null) {
      data['design'] = this.design.toJson();
    }
    data['isCustom'] = this.isCustom;
    data['script'] = this.script;
    data['name'] = this.name;
    data['title'] = this.title;
    data['message'] = this.message;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Button {
  String text;
  String link;

  Button({this.text, this.link});

  Button.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['link'] = this.link;
    return data;
  }
}

class Design {
  String boxPosition;
  String boxBackgroundColor;
  String titleColor;
  String messageColor;
  String buttonBackgroundColor;
  String buttonTextColor;

  Design(
      {this.boxPosition,
      this.boxBackgroundColor,
      this.titleColor,
      this.messageColor,
      this.buttonBackgroundColor,
      this.buttonTextColor});

  Design.fromJson(Map<String, dynamic> json) {
    boxPosition = json['boxPosition'];
    boxBackgroundColor = json['boxBackgroundColor'];
    titleColor = json['titleColor'];
    messageColor = json['messageColor'];
    buttonBackgroundColor = json['buttonBackgroundColor'];
    buttonTextColor = json['buttonTextColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boxPosition'] = this.boxPosition;
    data['boxBackgroundColor'] = this.boxBackgroundColor;
    data['titleColor'] = this.titleColor;
    data['messageColor'] = this.messageColor;
    data['buttonBackgroundColor'] = this.buttonBackgroundColor;
    data['buttonTextColor'] = this.buttonTextColor;
    return data;
  }
}
