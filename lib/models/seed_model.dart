class SeedModel {
  String? type;
  String? message;
  List<SeedData>? data;

  SeedModel({this.type, this.message, this.data});

  SeedModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SeedData>[];
      json['data'].forEach((v) {
        data!.add(new SeedData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeedData {
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;

  SeedData({this.seedId, this.name, this.description, this.imageUrl});

  SeedData.fromJson(Map<String, dynamic> json) {
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seedId'] = this.seedId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
