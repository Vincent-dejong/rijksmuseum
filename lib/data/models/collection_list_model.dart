import 'package:rijksmuseum/data/models/image_model.dart';
import 'package:rijksmuseum/data/models/production_place_model.dart';
import 'package:rijksmuseum/domain/entities/collection.dart';
import 'package:rijksmuseum/domain/entities/collection_list.dart';

import 'collection_model.dart';

class CollectionListModel extends CollectionList {
  CollectionListModel({
    required List<Collection> collections,
    required int currentPage,
    required int collectionCount,
    required int numberOnPage,
  }) : super(
          collections,
          currentPage,
          collectionCount,
          numberOnPage,
        );

  factory CollectionListModel.fromJson(
    Map<String, dynamic> json,
    int currentPage,
    int numberOnPage,
  ) {
    final artObjects = json['artObjects'];
    final collectionCount = json['count'];

    List<Collection> collections = (artObjects as List)
        .map((json) => CollectionModel.fromJson(json))
        .toList();

    return CollectionListModel(
      collections: collections,
      currentPage: currentPage,
      collectionCount: collectionCount,
      numberOnPage: numberOnPage,
    );
  }
}
