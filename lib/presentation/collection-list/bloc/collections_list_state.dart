part of 'collections_list_bloc.dart';

abstract class CollectionsListState extends Equatable {
  const CollectionsListState();

  @override
  List<Object> get props => [];
}

class CollectionsListInitial extends CollectionsListState {
  final CollectionList collectionList;

  const CollectionsListInitial(this.collectionList);
}

class CollectionsListLoading extends CollectionsListState {}

class CollectionListLoadFailure extends CollectionsListState {
  final Exception exception;

  CollectionListLoadFailure(this.exception);
}
