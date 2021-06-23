import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanResult extends StatelessWidget {
  final Barcode? barcode;
  const ScanResult({Key? key, this.barcode}) : super(key: key);

  void _launchURL(String scanData) async {
    String url = scanData;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white70,
      ),
      child: barcode != null
          ? validateRes()
          : Text(
              "Searching for QR code...",
              textAlign: TextAlign.center,
            ),
    );
  }

   validateRes() {
    String res = barcode!.code;
    String pattern =
        r'^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$';
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(res)) {
      return TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.all(0),
          ),
          onPressed: () {
            _launchURL(res);
          },
          child: Text(
            "$res",
            style: TextStyle(
                color: Colors.blue[700], decoration: TextDecoration.underline),
            maxLines: 3,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ));
    } else {
      return Text(
        "$res",
        maxLines: 3,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      );
    }
  }
}
