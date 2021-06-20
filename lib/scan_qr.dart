import 'package:flutter/material.dart';

class Scan extends StatelessWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("scan",
            style: TextStyle(color: Theme.of(context).accentColor)),
      ),
    );
  }
}
