import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  final GestureTapCallback? onTap;
  const NoInternetScreen({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(onPressed: onTap, icon: Icon(Icons.add), label: Text('Retry'))

      ],
    );
  }
}
