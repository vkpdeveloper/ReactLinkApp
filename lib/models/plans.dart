class Plan {
  Pricing pricing;
  Limits limits;
  Features features;
  String description;
  String status;
  String sId;
  String name;
  String updatedAt;
  String createdAt;
  int iV;
  int subscriptionId;

  Plan(
      {this.pricing,
      this.limits,
      this.features,
      this.description,
      this.status,
      this.sId,
      this.name,
      this.updatedAt,
      this.createdAt,
      this.iV,
      this.subscriptionId});

  Plan.fromJson(Map<String, dynamic> json) {
    pricing =
        json['pricing'] != null ? new Pricing.fromJson(json['pricing']) : null;
    limits =
        json['limits'] != null ? new Limits.fromJson(json['limits']) : null;
    features = json['features'] != null
        ? new Features.fromJson(json['features'])
        : null;
    description = json['description'];
    status = json['status'];
    sId = json['_id'];
    name = json['name'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    subscriptionId = json['subscriptionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pricing != null) {
      data['pricing'] = this.pricing.toJson();
    }
    if (this.limits != null) {
      data['limits'] = this.limits.toJson();
    }
    if (this.features != null) {
      data['features'] = this.features.toJson();
    }
    data['description'] = this.description;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    data['subscriptionId'] = this.subscriptionId;
    return data;
  }
}

class Pricing {
  String currency;
  int monthly;
  int yearly;

  Pricing({this.currency, this.monthly, this.yearly});

  Pricing.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    monthly = json['monthly'];
    yearly = json['yearly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['monthly'] = this.monthly;
    data['yearly'] = this.yearly;
    return data;
  }
}

class Limits {
  int monthlyLinks;
  int monthlyClicks;
  int cta;
  int trackingPixels;
  int customDomains;
  int affiliateTracking;

  Limits(
      {this.monthlyLinks,
      this.monthlyClicks,
      this.cta,
      this.trackingPixels,
      this.customDomains,
      this.affiliateTracking});

  Limits.fromJson(Map<String, dynamic> json) {
    monthlyLinks = json['monthlyLinks'];
    monthlyClicks = json['monthlyClicks'];
    cta = json['cta'];
    trackingPixels = json['trackingPixels'];
    customDomains = json['customDomains'];
    affiliateTracking = json['affiliateTracking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['monthlyLinks'] = this.monthlyLinks;
    data['monthlyClicks'] = this.monthlyClicks;
    data['cta'] = this.cta;
    data['trackingPixels'] = this.trackingPixels;
    data['customDomains'] = this.customDomains;
    data['affiliateTracking'] = this.affiliateTracking;
    return data;
  }
}

class Features {
  bool deviceTargeting;
  bool geoTargeting;
  bool apiAccess;
  bool exportData;

  Features(
      {this.deviceTargeting,
      this.geoTargeting,
      this.apiAccess,
      this.exportData});

  Features.fromJson(Map<String, dynamic> json) {
    deviceTargeting = json['deviceTargeting'];
    geoTargeting = json['geoTargeting'];
    apiAccess = json['apiAccess'];
    exportData = json['exportData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deviceTargeting'] = this.deviceTargeting;
    data['geoTargeting'] = this.geoTargeting;
    data['apiAccess'] = this.apiAccess;
    data['exportData'] = this.exportData;
    return data;
  }
}
