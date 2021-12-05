import 'package:rijksmuseum/domain/entities/product_place.dart';

class ProductionPlaceModel extends ProductionPlace {
  const ProductionPlaceModel({
    required String name,
  }) : super(name: name);

  factory ProductionPlaceModel.fromJson(Map<String, dynamic> json) {
    return ProductionPlaceModel(name: json['name']);
  }
}
