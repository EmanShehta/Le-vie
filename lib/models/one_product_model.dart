class OneProductModel {
  OneProductModel({
    required this.type,
    required this.message,
    required this.data,
  });
  late final String type;
  late final String message;
  late final OneProductData data;

  OneProductModel.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data = OneProductData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class OneProductData {
  OneProductData({
    required this.productId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.price,
    required this.available,
    this.seed,
    required this.plant,
    this.tool,
  });
  late final String productId;
  late final String name;
  late final String description;
  late final String imageUrl;
  late final String type;
  late final int price;
  late final bool available;
  late final Null seed;
  late final Plant plant;
  late final Null tool;

  OneProductData.fromJson(Map<String, dynamic> json){
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    price = json['price'];
    available = json['available'];
    seed = null;
    plant = Plant.fromJson(json['plant']);
    tool = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['productId'] = productId;
    _data['name'] = name;
    _data['description'] = description;
    _data['imageUrl'] = imageUrl;
    _data['type'] = type;
    _data['price'] = price;
    _data['available'] = available;
    _data['seed'] = seed;
    _data['plant'] = plant.toJson();
    _data['tool'] = tool;
    return _data;
  }
}

class Plant {
  Plant({
    required this.plantId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.waterCapacity,
    required this.sunLight,
    required this.temperature,
  });
  late final String plantId;
  late final String name;
  late final String description;
  late final String imageUrl;
  late final int waterCapacity;
  late final int sunLight;
  late final int temperature;

  Plant.fromJson(Map<String, dynamic> json){
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['plantId'] = plantId;
    _data['name'] = name;
    _data['description'] = description;
    _data['imageUrl'] = imageUrl;
    _data['waterCapacity'] = waterCapacity;
    _data['sunLight'] = sunLight;
    _data['temperature'] = temperature;
    return _data;
  }
}