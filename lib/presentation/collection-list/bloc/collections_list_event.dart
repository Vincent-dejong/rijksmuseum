part of 'collections_list_bloc.dart';

abstract class CollectionsListEvent extends Equatable {
  const CollectionsListEvent();

  @override
  List<Object> get props => [];
}

class CollectionsListRefreshEvent extends CollectionsListEvent {
  int pageNumber = 1;

  CollectionsListRefreshEvent({required this.pageNumber});
}
