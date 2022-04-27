import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moni/Core/utils/moni_colors.dart';

class MembersTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String dueText;
  final Color color;

  const MembersTile({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.dueText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(
              height: 1.0,
              color: Colors.green,
            ),
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
                    Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17.0,
                          ),
                        ),
                        Container(
                          height: 4.0,
                          width: 4.0,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: MoniColors.grey),
                        ),
                        Text(
                          dueText,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0,
                              color: color),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.mulish(
                        color: color,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
