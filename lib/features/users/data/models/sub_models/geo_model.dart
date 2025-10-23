import 'package:clean_arch/features/users/domain/entities/sub_enities/geo_entity.dart';

class GeoModel extends GeoEntity {
  GeoModel({required super.lat, required super.lng});

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(lat: json['lat'], lng: json['lng']);
  }
  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lng': lng};
  }
}
