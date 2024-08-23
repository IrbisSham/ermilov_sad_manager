class CurrentUserData {
  Data data;
  Ad ad;

  CurrentUserData({required this.data, required this.ad});

  CurrentUserData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : Data(id: json['id']);
    ad = json['ad'] != null ? Ad.fromJson(json['ad']) : Ad();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data.toJson();
    data['ad'] = ad.toJson();
      return data;
  }
}

class Data {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  Data(
      {required this.id,
      this.email = '',
      this.firstName = '',
      this.lastName = '',
      this.avatar = ''});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }
}

class Ad {
  String company;
  String url;
  String text;

  Ad({this.company = '', this.url = '', this.text = ''});

  Ad.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company'] = company;
    data['url'] = url;
    data['text'] = text;
    return data;
  }
}
