import 'package:flutter/material.dart';
import 'package:moni/UI/utils/moni_colors.dart';

class NoInternetScreen extends StatelessWidget {
  final GestureTapCallback? onTap;

  const NoInternetScreen({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Icon(
            Icons.signal_wifi_connected_no_internet_4_rounded,
            size: 150.0,
            color: MoniColors.darkDarker,
          ),
        ),
        SizedBox(
          height: 16.0,
        ),
        Text('It seems you don\'t have internet.',
          textAlign: TextAlign.center,
          style: TextStyle(
          fontSize: 18.0,
        ),)
      ],
    );
  }
}
