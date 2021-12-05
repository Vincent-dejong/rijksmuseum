import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rijksmuseum/presentation/global/hex_color.dart';

import 'bloc/collections_list_bloc.dart';

class CollectionListPagination extends StatelessWidget {
  const CollectionListPagination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionsListBloc, CollectionsListState>(
      builder: (context, state) {
        if (state is CollectionsListInitial) {
          return Container(
            color: HexColor('#d55140'),
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, bottom: 30.0, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    if (state.collectionList.currentPage == 1) {
                      return;
                    }

                    BlocProvider.of<CollectionsListBloc>(context).add(
                      CollectionsListRefreshEvent(
                        pageNumber: state.collectionList.currentPage - 1,
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                Text(
                  'Pagina ${state.collectionList.currentPage}/${state.collectionList.numberOfPages}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    if (state.collectionList.currentPage >=
                        state.collectionList.numberOfPages) {
                      return;
                    }

                    BlocProvider.of<CollectionsListBloc>(context).add(
                      CollectionsListRefreshEvent(
                        pageNumber: state.collectionList.currentPage + 1,
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}
