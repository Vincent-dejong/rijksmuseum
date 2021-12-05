import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final String guid;
  final int offsetPercentageX;
  final int offsetPercentageY;
  final int width;
  final int height;
  final String url;

  const Image({
    required this.guid,
    required this.offsetPercentageX,
    required this.offsetPercentageY,
    required this.width,
    required this.height,
    required this.url,
  });

  @override
  List<Object?> get props => [
        guid,
        offsetPercentageX,
        offsetPercentageY,
        width,
        height,
        url,
      ];
}
