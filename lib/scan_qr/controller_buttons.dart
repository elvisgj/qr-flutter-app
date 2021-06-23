import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ControllerButtons extends StatelessWidget {
  const ControllerButtons({Key? key, this.controller, this.refresh})
      : super(key: key);
  final QRViewController? controller;
  final refresh;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            onPressed: () async {
              await controller!.toggleFlash();
              refresh();
            },
            icon: FutureBuilder(
              future: controller?.getFlashStatus(),
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return Icon(
                    Icons.flash_on,
                    color: Theme.of(context).accentColor,
                  );
                } else {
                  return Icon(
                    Icons.flash_off,
                    color: Theme.of(context).accentColor,
                  );
                }
              },
            ),
          ),
          IconButton(
            onPressed: () async {
              await controller!.flipCamera();
              refresh();
            },
            icon: FutureBuilder<bool?>(builder: (context, snapshot) {
              return Icon(
                Icons.switch_camera,
                color: Theme.of(context).accentColor,
              );
            }),
          ),
        ],
      ),
    );
  }
}
