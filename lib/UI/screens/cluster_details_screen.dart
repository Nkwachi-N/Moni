import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moni/Core/utils/moni_colors.dart';

class ClusterDetailsScreen extends StatelessWidget {
  const ClusterDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/badge-dollar 1.svg',
                  height: 20.0,
                  width: 20.0,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  'Cluster purse setting',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: MoniColors.darkDarker,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Frequency of contribution',
                        style: TextStyle(
                          color: MoniColors.darkDark,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        'Monthly upfront',
                        style: TextStyle(
                          color: MoniColors.darkDarker,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('Change'))
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              '₦550,000,000',
              style: GoogleFonts.mulish(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: MoniColors.darkDarker,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Your contribution is 8% of your eligible amount ',
              style: GoogleFonts.mulish(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: MoniColors.greyDark,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22.0),
              child: Container(
                height: 1.0,
                color: MoniColors.greyLight,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/link 2.svg',
                  height: 20.0,
                  width: 20.0,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  'Group invite Link/Code',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: MoniColors.darkDarker,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              'Use the link or code below to invite new member',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: MoniColors.darkDarker,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Member invite code',
                        style: TextStyle(
                          color: MoniColors.darkDark,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        '30DF38TG000',
                        style: TextStyle(
                          color: MoniColors.darkDarker,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('Get new code'))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22.0),
              child: Container(
                height: 1.0,
                color: MoniColors.greyLight,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/Group.svg',
                  height: 20.0,
                  width: 20.0,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  'Loan setting',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: MoniColors.darkDarker,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              'Total loan collected by cluster',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: MoniColors.darkBase,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              '₦550,000,000',
              style: GoogleFonts.mulish(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: MoniColors.darkDarker,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Repayment Day',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: MoniColors.darkBase,
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        'Every Monday',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: MoniColors.darkDarker,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Change'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22.0),
              child: Container(
                height: 1.0,
                color: MoniColors.greyLight,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/Group.svg',
                  height: 20.0,
                  width: 20.0,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  'Pending Join Request',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: MoniColors.darkDarker,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              'No pending cluster join request',
              style: TextStyle(
                fontSize: 16.0,
                color: MoniColors.darkLighter,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22.0),
              child: Container(
                height: 1.0,
                color: MoniColors.greyLight,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/biking-mountain 1.svg',
                  height: 20.0,
                  width: 20.0,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  'Group Settings',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: MoniColors.darkDarker,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              'Group rules',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: MoniColors.darkDarker,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '1. ',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: MoniColors.darkBase,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Check the car’s rental terms as well, because each company has its own rules.',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: MoniColors.darkBase,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '2. ',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: MoniColors.darkBase,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Check the car’s rental terms as well, because each company has its own rules.',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: MoniColors.darkBase,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              'Group Whatsapp',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: MoniColors.darkDarker,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              'https://chat.whatsapp.com/BmK1mYu9zGAGh\nhqi8xqQQ5',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                color: MoniColors.greenDarkest,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit),
              label: const Text(
                'Edit Settings',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 16.0,
              ),
              child: Container(
                height: 1.0,
                color: MoniColors.greyLight,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/money-bill-wave 1.svg',
                  height: 20.0,
                  width: 20.0,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  'Benefits earned',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: MoniColors.darkDarker,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              'Total CH benefits earned',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: MoniColors.darkDarker,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              '₦550,000,000',
              style: GoogleFonts.mulish(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: MoniColors.darkDarker,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const Text(
              'Available Benefits',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: MoniColors.darkDarker,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₦550,000,000',
                  style: GoogleFonts.mulish(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: MoniColors.darkDarker,
                  ),
                ),
                Text(
                  '₦550,000,000',
                  style: GoogleFonts.inter(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: MoniColors.greenBase,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.visibility),
              label: const Text('View earning history'),
            ),
            const SizedBox(
              height: 64.0,
            ),
          ],
        ),
      ),
    );
  }
}
