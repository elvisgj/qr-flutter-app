import 'package:flutter/material.dart';

class GenerateInput extends StatelessWidget {
  GenerateInput(this.onChange);
  final onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
          onChanged: (val) => onChange(val),
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: "Type here",
            border: InputBorder.none,
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
