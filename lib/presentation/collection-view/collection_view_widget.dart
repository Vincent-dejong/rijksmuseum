import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rijksmuseum/domain/entities/collection.dart';
import 'package:rijksmuseum/presentation/global/loader.dart';

import 'bloc/collection_extra_details_bloc.dart';

class CollectionViewWidget extends StatelessWidget {
  final Collection collection;

  const CollectionViewWidget(this.collection);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(collection.title),
      ),
      body: BlocProvider(
        create: (context) => CollectionExtraDetailsBloc()
          ..add(
            GetCollectionExtraDetailsEvent(collection),
          ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: collection.id,
                child: Image(
                  image: CachedNetworkImageProvider(collection.webImage.url),
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      collection.title,
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.headline5!.fontSize,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      collection.principalOrFirstMaker,
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.subtitle1!.fontSize,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 10),
                    BlocConsumer<CollectionExtraDetailsBloc,
                            CollectionExtraDetailsState>(
                        listener: (context, state) {
                      if (state is CollectionExtraDetailsLoadFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Fout bij het ophalen van extra informatei over kunstwerk.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }, builder: (context, state) {
                      if (state is CollectionExtraDetailsInitial) {
                        BlocProvider.of<CollectionExtraDetailsBloc>(context)
                            .add(GetCollectionExtraDetailsEvent(collection));
                      }

                      if (state is CollectionExtraDetailsLoading) {
                        return Loader();
                      }

                      if (state is CollectionExtraDetailsLoaded) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.collectionExtraDetails.timeFrame),
                            SizedBox(height: 10),
                            Text(
                                state.collectionExtraDetails.plaqueDescription),
                          ],
                        );
                      }

                      return Container();
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
