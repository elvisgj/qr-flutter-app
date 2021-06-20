import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

import 'generate_bloc.dart';

class QrProduct extends StatelessWidget {
  const QrProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateBloc, GenerateState>(builder: (context, state) {
      return state.input != ""
          ? Screenshot(
              controller: state.qrScreenshot,
              child: QrImage(
                size: 250.00,
                data: state.input,
                backgroundColor: state.colorPickerBG,
                foregroundColor: state.colorPickerQr,
              ),
            )
          : Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white70),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Write something",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
    });
  }
}
