import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rijksmuseum/data/repositories/collections_repository.dart';
import 'package:rijksmuseum/domain/entities/collection.dart';
import 'package:rijksmuseum/domain/entities/collection_extra_details.dart';

part 'collection_extra_details_event.dart';
part 'collection_extra_details_state.dart';

class CollectionExtraDetailsBloc
    extends Bloc<CollectionExtraDetailsEvent, CollectionExtraDetailsState> {
  CollectionExtraDetailsBloc() : super(CollectionExtraDetailsInitial()) {
    on<GetCollectionExtraDetailsEvent>(_onFetchCollectionExtraDetails);
  }

  _onFetchCollectionExtraDetails(GetCollectionExtraDetailsEvent event,
      Emitter<CollectionExtraDetailsState> emit) async {
    emit(CollectionExtraDetailsLoading());

    final extraDetails = await CollectionsRepository.get(
      objectNumber: event.collection.objectNumber,
    );

    extraDetails.fold((exception) {
      emit(CollectionExtraDetailsLoadFailure(exception));
    }, (collectionExtraDetails) {
      emit(CollectionExtraDetailsLoaded(collectionExtraDetails));
    });
  }
}
