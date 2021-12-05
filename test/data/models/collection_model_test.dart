import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rijksmuseum/data/models/collection_list_model.dart';
import 'package:rijksmuseum/data/models/collection_model.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  int tPageNumber = 1;
  int tNumberOnPage = 10;

  group('parse models from json', () {
    test('should parse JSON and return an instance of CollectionList', () {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('collection_list.json'));

      //act
      final result =
          CollectionListModel.fromJson(jsonMap, tPageNumber, tNumberOnPage);

      //assert
      expect(result, isA<CollectionListModel>());
    });

    test('should parse JSON and return an instance of Collection', () {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('collection.json'));

      //act
      final model = CollectionModel.fromJson(jsonMap);

      //assert
      expect(model, isA<CollectionModel>());
    });
  });
}
