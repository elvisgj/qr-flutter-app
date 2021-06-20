import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerQR extends StatelessWidget {
  final String title;
  final changeColor;
  final color;

  ColorPickerQR({
    required this.title,
    required this.changeColor,
    required this.color,
  });

  _colorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Pick $title!',
            textAlign: TextAlign.center,
          ),
          titlePadding: const EdgeInsets.all(5.0),
          contentPadding: const EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          content: Container(
            width: 180,
            height: 205,
            child: MaterialPicker(
              pickerColor: color,
              onColorChanged: (color) {
                changeColor(color);
                Navigator.of(context).pop();
              },
              enableLabel: true,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.teal,
        side: BorderSide(
          color: Colors.white,
          width: 0.5,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
      ),
      onPressed: () => _colorPicker(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Icon(
                Icons.colorize,
                color: Colors.white,
                size: 20,
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              color: color,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
