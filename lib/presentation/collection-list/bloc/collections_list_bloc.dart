import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rijksmuseum/data/repositories/collections_repository.dart';
import 'package:rijksmuseum/domain/entities/collection_list.dart';

part 'collections_list_event.dart';
part 'collections_list_state.dart';

class CollectionsListBloc
    extends Bloc<CollectionsListEvent, CollectionsListState> {
  CollectionsListBloc()
      : super(CollectionsListInitial(CollectionList(const [], 1, 0, 0))) {
    on<CollectionsListRefreshEvent>(_onCollectionsListRefresh);
  }

  _onCollectionsListRefresh(CollectionsListRefreshEvent event,
      Emitter<CollectionsListState> emit) async {
    emit(CollectionsListLoading());

    final collectionList = await CollectionsRepository.index(
      pageNumber: event.pageNumber,
    );

    collectionList.fold((exception) {
      emit(CollectionListLoadFailure(exception));
    }, (collectionList) {
      emit(CollectionsListInitial(collectionList));
    });
  }
}
