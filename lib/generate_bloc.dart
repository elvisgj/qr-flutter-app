import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class GenerateBloc extends Cubit<GenerateState> {
  GenerateBloc() : super(GenerateState());

  void changeColorQR(Color color) {
    emit(state.copyWith(colorPickerQr: color));
  }

  void changeColorBG(Color color) {
    emit(state.copyWith(colorPickerBG: color));
  }

  void onChangeInput(String input) async {
    emit(state.copyWith(input: input));
  }

  takeQrScreenshot() async {
    final image = await state.qrScreenshot.capture();
    if (image != null) {
      await saveImage(image);
    }
  }

  Future saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now().toIso8601String();
    final name = "QR_Code_$time";
    final tempDir = await getTemporaryDirectory();
    final pathName = tempDir.path;
    final file = await new File("$pathName/$name.jpg").create();
    await file.writeAsBytes(bytes);
    Share.shareFiles(['$pathName/$name.jpg'], text: 'Your QR code');
  }
}

class GenerateState {
  late Color colorPickerQr;
  late Color colorPickerBG;
  late String input;
  late ScreenshotController qrScreenshot;

  GenerateState(
      {Color? colorPickerQr,
      Color? colorPickerBG,
      String? input,
      ScreenshotController? qrScreenshot}) {
    this.colorPickerBG = colorPickerBG ?? Color(0xFFFAFAFA);
    this.colorPickerQr = colorPickerQr ?? Color(0xFF000000);
    this.input = input ?? "";
    this.qrScreenshot = qrScreenshot ?? ScreenshotController();
  }

  copyWith(
      {Color? colorPickerQr,
      Color? colorPickerBG,
      String? input,
      ScreenshotController? qrScreenshot}) {
    var state = GenerateState(
      colorPickerQr: colorPickerQr ?? this.colorPickerQr,
      colorPickerBG: colorPickerBG ?? this.colorPickerBG,
      input: input ?? this.input,
      qrScreenshot: qrScreenshot ?? this.qrScreenshot,
    );
    return state;
  }
}
