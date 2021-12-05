import 'package:equatable/equatable.dart';
import 'package:rijksmuseum/domain/entities/collection.dart';

class CollectionList extends Equatable {
  List<Collection> items;
  int currentPage = 1;
  int totalPages = 1;
  int collectionCount;
  int numberOnPage;

  CollectionList(
    this.items,
    this.currentPage,
    this.collectionCount,
    this.numberOnPage,
  );

  int get numberOfPages {
    if (numberOnPage == 0) {
      return 1;
    }

    return (collectionCount / numberOnPage).ceil();
  }

  @override
  List<Object?> get props => [
        items,
        currentPage,
        collectionCount,
        numberOnPage,
      ];
}
