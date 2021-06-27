import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'generate_bloc.dart';

class FloatingShare extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateBloc, GenerateState>(builder: (context, state) {
      return FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 5,
        child: Icon(
          Icons.share,
        ),
        onPressed: () {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
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
