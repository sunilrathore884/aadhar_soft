class Autogenerated {
  int? status;
  String? message;
  String? logoUrl;

  Autogenerated({this.status, this.message, this.logoUrl});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    logoUrl = json['logo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['logo_url'] = this.logoUrl;
    return data;
  }
}