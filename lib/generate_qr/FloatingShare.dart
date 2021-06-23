import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'generate_bloc.dart';

class FloatingShare extends StatelessWidget {
  const FloatingShare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateBloc, GenerateState>(builder: (context, state) {
      return FloatingActionButton(
        elevation: 5,
        child: Icon(
          Icons.share,
        ),
        onPressed: () {
          state.input == ""
              ? ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "No QR avaiable to share",
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : BlocProvider.of<GenerateBloc>(context).takeQrScreenshot();
        },
      );
    });
  }
}
