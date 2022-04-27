import 'package:flutter/material.dart';
import 'package:moni/Core/utils/moni_colors.dart';

class MembersTile extends StatelessWidget {
  final String imagePath;
  final Widget title;
  final Widget subtitle;

  const MembersTile({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 22.0,
              top: 8.0,
            ),
            height: 1.0,
            color: MoniColors.greyFive,
          ),
          Row(
            children: [
              Flexible(
                  child: Image.asset(
                imagePath,
              )),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title,
                    const SizedBox(
                      height: 4.0,
                    ),
                    subtitle,
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 22.0,
          ),

        ],
      ),
    );
  }
}

class LoanTitle extends StatelessWidget {
  final String title;
  final String dueText;
  final Color dueTextColor;

  const LoanTitle({
    Key? key,
    required this.title,
    required this.dueText,
    required this.dueTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 17.0,
          ),
        ),
        Container(
          height: 4.0,
          width: 4.0,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: MoniColors.grey,
          ),
        ),
        Text(
          dueText,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15.0,
            color: dueTextColor,
          ),
        ),
      ],
    );
  }
}
