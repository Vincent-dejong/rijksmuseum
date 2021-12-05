part of 'collection_extra_details_bloc.dart';

abstract class CollectionExtraDetailsEvent extends Equatable {
  const CollectionExtraDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetCollectionExtraDetailsEvent extends CollectionExtraDetailsEvent {
  Collection collection;

  GetCollectionExtraDetailsEvent(this.collection);
}
