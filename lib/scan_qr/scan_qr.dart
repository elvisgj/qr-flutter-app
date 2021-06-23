import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner/scan_qr/controller_buttons.dart';
import 'package:qr_scanner/scan_qr/scan_result.dart';

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((event) {
      setState(() => this.barcode = event);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(alignment: Alignment.center, children: <Widget>[
        buildQrView(context),
        Positioned(
          left: 100,
          right: 100,
          bottom: 40,
          child: ScanResult(barcode: barcode),
        ),
        Positioned(
          top: 10,
          child: ControllerButtons(controller: controller, refresh: refresh),
        ),
      ]),
    );
  }

void refresh(){
    setState(() {});
}
  // Costume widgets

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            cutOutSize: MediaQuery.of(context).size.width * 0.7,
            borderLength: 20,
            borderWidth: 10,
            borderRadius: 10,
            borderColor: Theme.of(context).accentColor,
            ),
      );
}
