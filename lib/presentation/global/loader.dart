import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
      alignment: Alignment.center,
      child: CircularProgressIndicator(strokeWidth: 2),
    );
  }
}
