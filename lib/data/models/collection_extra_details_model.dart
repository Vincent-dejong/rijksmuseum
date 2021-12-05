import 'package:rijksmuseum/domain/entities/collection_extra_details.dart';

class CollectionExtraDetailsModel extends CollectionExtraDetails {
  const CollectionExtraDetailsModel({
    required String timeFrame,
    required String plaqueDescription,
  }) : super(
          timeFrame: timeFrame,
          plaqueDescription: plaqueDescription,
        );

  factory CollectionExtraDetailsModel.fromJson(Map<String, dynamic> json) {
    final yearEarly = json['dating']['yearEarly'].toString();
    final yearLate = json['dating']['yearLate'].toString();

    String timeFrame = '$yearEarly - $yearLate';
    if (yearEarly == yearLate) {
      timeFrame = yearEarly;
    }

    return CollectionExtraDetailsModel(
        timeFrame: timeFrame,
        plaqueDescription: json['plaqueDescriptionDutch'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'timeFrame': timeFrame,
      'plaqueDescription': plaqueDescription,
    };
  }
}
