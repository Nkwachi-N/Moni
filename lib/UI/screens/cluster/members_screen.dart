import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moni/Core/features/loan/model/active_agent.dart';
import 'package:moni/Core/features/loan/model/inactive_agent.dart';
import 'package:moni/Core/features/loan/provider/loan_provider.dart';
import 'package:moni/Core/utils/currency_format.dart';
import 'package:moni/UI/screens/cluster/widgets/moni_expansion_tile.dart';
import 'package:moni/UI/utils/moni_colors.dart';
import 'package:provider/provider.dart';

import 'widgets/members_tile.dart';


class MembersScreen extends StatelessWidget {
  const MembersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clusterModel = context.watch<LoanProvider>();
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
                  dueText: '1 day over due',
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
              for(ActiveAgent agent in clusterModel.cluster!.activeAgents)
                MembersTile(
                  title: LoanTitle(
                    title: '${agent.firstName} ${agent.lastName}',
                    dueText: '${agent.daysToDue} day${agent.daysToDue > 1 ? 's' : ''} to due date',
                    dueTextColor: MoniColors.textColor2,
                  ),
                  subtitle: Text(
                    '${currency.format(agent.loanAmount)} Active loan',
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
              for(InActiveAgent agent in clusterModel.cluster!.inactiveAgents)
               MembersTile(
                title: Text(
                  '${agent.firstName} ${agent.lastName}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17.0,
                  ),
                ),
                subtitle: const Text(
                  'No active loan',
                  style: TextStyle(
                    color: MoniColors.darkLighter,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                imagePath: agent.avatar,
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


