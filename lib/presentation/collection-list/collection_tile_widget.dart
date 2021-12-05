import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rijksmuseum/domain/entities/collection.dart';
import 'package:rijksmuseum/presentation/collection-view/collection_view_widget.dart';
import 'package:rijksmuseum/presentation/global/hex_color.dart';

class CollectionTileWidget extends StatelessWidget {
  final Collection collection;
  CollectionTileWidget(this.collection);

  @override
  Widget build(BuildContext context) {
    const Radius _borderRadius = Radius.circular(5);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CollectionViewWidget(this.collection),
          ),
        );
      },
      child: Hero(
        tag: collection.id,
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 30.0,
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                  child: Text(
                    collection.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: _borderRadius,
                      bottomRight: _borderRadius,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(3.0, 3.0),
                blurRadius: 5.0,
                color: HexColor('#e1e1e1'),
              )
            ],
            image: DecorationImage(
              image: CachedNetworkImageProvider(collection.webImage.url),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(_borderRadius),
          ),
        ),
      ),
    );
  }
}
