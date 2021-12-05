import 'package:rijksmuseum/data/models/image_model.dart';
import 'package:rijksmuseum/data/models/production_place_model.dart';
import 'package:rijksmuseum/domain/entities/collection.dart';
import 'package:rijksmuseum/domain/entities/image.dart';
import 'package:rijksmuseum/domain/entities/product_place.dart';

class CollectionModel extends Collection {
  const CollectionModel({
    required String id,
    required String objectNumber,
    required String title,
    required String longTitle,
    required String principalOrFirstMaker,
    required List<ProductionPlace> productionPlaces,
    required Image webImage,
    required Image headerImage,
  }) : super(
          id: id,
          objectNumber: objectNumber,
          title: title,
          longTitle: longTitle,
          principalOrFirstMaker: principalOrFirstMaker,
          productionPlaces: productionPlaces,
          webImage: webImage,
          headerImage: headerImage,
        );

  factory CollectionModel.fromJson(Map<String, dynamic> json) {
    List<ProductionPlace> productionPlaces =
        (json['productionPlaces'] as List<dynamic>)
            .map(
              (dynamic name) => ProductionPlaceModel.fromJson({
                'name': name.toString(),
              }),
            )
            .toList();

    return CollectionModel(
      id: json['id'],
      objectNumber: json['objectNumber'],
      title: json['title'],
      longTitle: json['longTitle'],
      principalOrFirstMaker: json['principalOrFirstMaker'],
      productionPlaces: productionPlaces,
      webImage: ImageModel.fromJson(json['webImage']),
      headerImage: ImageModel.fromJson(json['headerImage']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'objectNumber': objectNumber,
      'title': title,
      'longTitle': longTitle,
      'principalOrFirstMaker': principalOrFirstMaker,
      'productionPlaces': productionPlaces
          .map((productionPlace) => productionPlace.name)
          .toList(),
      'webImage': (webImage as ImageModel).toJson(),
      'headerImage': (headerImage as ImageModel).toJson(),
    };
  }
}
