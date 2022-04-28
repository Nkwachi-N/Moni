import 'package:flutter/material.dart';
import 'package:moni/UI/utils/moni_colors.dart';


class RepaymentWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  const RepaymentWidget({Key? key, required this.title, required this.subtitle, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0,),
      decoration: BoxDecoration(
        color: const Color(0xFF090A0A),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: RichText(
        text: TextSpan(
          text: title,
          style: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
            color: MoniColors.greyBase,
          ),
          children: [
            TextSpan(
              text: subtitle,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
