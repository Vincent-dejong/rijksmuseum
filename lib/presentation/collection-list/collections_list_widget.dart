import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:rijksmuseum/presentation/collection-list/bloc/collections_list_bloc.dart';
import 'package:rijksmuseum/presentation/collection-list/collection_list_pagination.dart';
import 'package:rijksmuseum/presentation/collection-list/collection_tile_widget.dart';
import 'package:rijksmuseum/presentation/global/loader.dart';

class CollectionsListWidget extends StatelessWidget {
  const CollectionsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CollectionsListBloc, CollectionsListState>(
      listener: (context, state) {
        if (state is CollectionListLoadFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Fout bij het ophalen van kunstwerken.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is CollectionsListLoading) {
          return Loader();
        } else if (state is CollectionsListInitial) {
          return Column(
            children: <Widget>[
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async =>
                      BlocProvider.of<CollectionsListBloc>(context)
                        ..add(
                          CollectionsListRefreshEvent(
                            pageNumber: state.collectionList.currentPage,
                          ),
                        ),
                  child: AnimationLimiter(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: state.collectionList.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: CollectionTileWidget(
                                  state.collectionList.items[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const CollectionListPagination(),
            ],
          );
        }

        return Container();
      },
    );
  }
}
