part of 'collection_extra_details_bloc.dart';

abstract class CollectionExtraDetailsState extends Equatable {
  const CollectionExtraDetailsState();

  @override
  List<Object> get props => [];
}

class CollectionExtraDetailsInitial extends CollectionExtraDetailsState {}

class CollectionExtraDetailsLoading extends CollectionExtraDetailsState {}

class CollectionExtraDetailsLoadFailure extends CollectionExtraDetailsState {
  final Exception exception;

  const CollectionExtraDetailsLoadFailure(this.exception);
}

class CollectionExtraDetailsLoaded extends CollectionExtraDetailsState {
  final CollectionExtraDetails collectionExtraDetails;

  const CollectionExtraDetailsLoaded(this.collectionExtraDetails);
}
