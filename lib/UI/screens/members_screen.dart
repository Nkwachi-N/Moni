import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moni/UI/widgets/moni_expansion_tile.dart';

import '../../Core/utils/moni_colors.dart';
import '../widgets/members_tile.dart';

class MembersScreen extends StatelessWidget {
  const MembersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MoniExpansionTile(
            title: 'Overdue',
            children: [
              MembersTile(
                title: const LoanTitle(
                  title: 'Florence Tanika',
                  dueText: '3 days over due',
                  dueTextColor: MoniColors.redDarkest,
                ),
                subtitle: Text(
                  '₦10,555,000 Late loan',
                  style: GoogleFonts.mulish(
                    color: MoniColors.redDarkest,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                imagePath: 'assets/florence.png',
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 8.0,
                ),
                height: 1.0,
                color: MoniColors.greyFive,
              ),
            ],
          ),
          MoniExpansionTile(
            title: 'Due Today',
            children: [
              MembersTile(
                title: const LoanTitle(
                  title: 'Tiamiyu Adzan',
                  dueText: '3 days over due',
                  dueTextColor: MoniColors.yellowDarkest,
                ),
                subtitle: Text(
                  '₦10,555,000 Late loan',
                  style: GoogleFonts.mulish(
                    color: MoniColors.yellowDarkest,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                imagePath: 'assets/tiamiyu.png',
              ),
              MembersTile(
                title: const LoanTitle(
                  title: 'Eze Tarka',
                  dueText: '3 days over due',
                  dueTextColor: MoniColors.yellowDarkest,
                ),
                subtitle: Text(
                  '₦10,555,000 Late loan',
                  style: GoogleFonts.mulish(
                    color: MoniColors.yellowDarkest,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                imagePath: 'assets/eze.png',
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 8.0,
                ),
                height: 1.0,
                color: MoniColors.greyFive,
              ),
            ],
          ),
          MoniExpansionTile(
            title: 'Active Loans',
            children: [
              MembersTile(
                title: const LoanTitle(
                  title: 'Tiamiyu Adzan',
                  dueText: '3 days over due',
                  dueTextColor: MoniColors.textColor2,
                ),
                subtitle: Text(
                  '₦10,555,000 Late loan',
                  style: GoogleFonts.mulish(
                    color: MoniColors.greenDarkest,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                imagePath: 'assets/halima.png',
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 8.0,
                ),
                height: 1.0,
                color: MoniColors.greyFive,
              ),
            ],
          ),
          //TODO: loan instead of loans.
          MoniExpansionTile(
            title: 'Inactive Loans',
            children: [
              const MembersTile(
                title: Text(
                  'Rebecca Funto',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17.0,
                  ),
                ),
                subtitle: Text(
                  'No active loan',
                  style: TextStyle(
                    color: MoniColors.darkLighter,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                imagePath: 'assets/halima.png',
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 8.0,
                ),
                height: 1.0,
                color: MoniColors.greyFive,
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
        ]
      ),
    );
  }
}


