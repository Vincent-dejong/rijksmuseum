import 'package:dartz/dartz.dart';
import 'package:rijksmuseum/data/models/collection_extra_details_model.dart';
import 'package:rijksmuseum/data/models/collection_list_model.dart';
import 'package:rijksmuseum/data/repositories/api_repository.dart';
import 'package:rijksmuseum/domain/entities/collection_extra_details.dart';
import 'package:rijksmuseum/domain/entities/collection_list.dart';

class CollectionsRepository {
  static Future<Either<Exception, CollectionList>> index({
    int pageNumber = 1,
    int numberOnPage = 250,
  }) async {
    Either<Exception, Map<String, dynamic>> result =
        await Api.get('collection', queryParams: {
      'p': pageNumber.toString(),
      'ps': numberOnPage.toString(),
      'imgonly': true.toString(),
    });

    return result.fold((exception) => left(exception), (json) {
      return right(
        CollectionListModel.fromJson(
          json,
          pageNumber,
          numberOnPage,
        ),
      );
    });
  }

  static Future<Either<Exception, CollectionExtraDetails>> get({
    required String objectNumber,
  }) async {
    Either<Exception, Map<String, dynamic>> result =
        await Api.get('collection/$objectNumber');

    final artObject = result.fold((exception) {
      return left(exception);
    }, (right) => right['artObject']);

    final CollectionExtraDetails collectionExtraDetails =
        CollectionExtraDetailsModel.fromJson(artObject);

    return right(collectionExtraDetails);
  }
}
