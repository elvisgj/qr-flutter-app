import 'package:flutter/material.dart';

class GenerateInput extends StatelessWidget {
  GenerateInput(this.onChange);
  final onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
          style: TextStyle(color: Colors.black),
          onChanged: (val) => onChange(val),
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Theme.of(context).hintColor),
            fillColor: Colors.grey[100],
            hintText: "Type here",
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Theme.of(context).accentColor),
            ),
            contentPadding:
                new EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          )),
    );
  }
}
