import 'package:equatable/equatable.dart';
import 'package:rijksmuseum/domain/entities/image.dart';
import 'package:rijksmuseum/domain/entities/product_place.dart';

class Collection extends Equatable {
  final String id;
  final String objectNumber;
  final String title;
  final String longTitle;
  final String principalOrFirstMaker;
  final List<ProductionPlace> productionPlaces;
  final Image webImage;
  final Image headerImage;

  const Collection({
    required this.id,
    required this.objectNumber,
    required this.title,
    required this.longTitle,
    required this.principalOrFirstMaker,
    required this.productionPlaces,
    required this.webImage,
    required this.headerImage,
  });

  @override
  List<Object?> get props => [
        id,
        objectNumber,
        title,
        longTitle,
        principalOrFirstMaker,
        productionPlaces,
        webImage,
        headerImage,
      ];
}
