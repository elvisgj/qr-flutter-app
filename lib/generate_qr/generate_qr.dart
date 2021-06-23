import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:qr_scanner/generate_qr/color_picker.dart';
import 'package:qr_scanner/generate_qr/qr_image.dart';
import 'generate_bloc.dart';
import 'generate_textfield.dart';

class Generate extends StatefulWidget {
  const Generate({Key? key}) : super(key: key);

  @override
  _GenerateState createState() => _GenerateState();
}


class _GenerateState extends State<Generate> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateBloc, GenerateState>(builder: (context, state) {
      return KeyboardDismisser(
        gestures: [GestureType.onTap],
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: QrProduct(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GenerateInput(
                    BlocProvider.of<GenerateBloc>(context).onChangeInput,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ColorPickerQR(
                        title: "QR Color",
                        changeColor: BlocProvider.of<GenerateBloc>(context)
                            .changeColorQR,
                        color: state.colorPickerQr,
                      ),
                      ColorPickerQR(
                        title: "BG Color",
                        changeColor: BlocProvider.of<GenerateBloc>(context)
                            .changeColorBG,
                        color: state.colorPickerBG,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
