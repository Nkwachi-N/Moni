import 'package:flutter/material.dart';
import '../utils/moni_colors.dart';

class FailureScreen extends StatelessWidget {
  const FailureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Icon(
            Icons.error,
            size: 150.0,
            color: MoniColors.darkDarker,
          ),
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          'We encountered an error, we\'re really sorry.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
          ),
        )
      ],
    );
  }
}
