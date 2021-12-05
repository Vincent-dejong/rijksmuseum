import 'package:equatable/equatable.dart';

class CollectionExtraDetails extends Equatable {
  final String timeFrame;
  final String plaqueDescription;

  const CollectionExtraDetails({
    required this.timeFrame,
    required this.plaqueDescription,
  });

  @override
  List<Object?> get props => [
        timeFrame,
        plaqueDescription,
      ];
}
