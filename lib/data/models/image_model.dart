import 'package:rijksmuseum/domain/entities/collection.dart';
import 'package:rijksmuseum/domain/entities/image.dart';
import 'package:rijksmuseum/domain/entities/product_place.dart';

class ImageModel extends Image {
  const ImageModel({
    required String guid,
    required int offsetPercentageX,
    required int offsetPercentageY,
    required int width,
    required int height,
    required String url,
  }) : super(
          guid: guid,
          offsetPercentageX: offsetPercentageX,
          offsetPercentageY: offsetPercentageY,
          width: width,
          height: height,
          url: url,
        );

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      guid: json['guid'],
      offsetPercentageX: json['offsetPercentageX'],
      offsetPercentageY: json['offsetPercentageY'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'guid': guid,
      'offsetPercentageX': offsetPercentageX,
      'offsetPercentageY': offsetPercentageY,
      'width': width,
      'height': height,
      'url': url,
    };
  }
}
