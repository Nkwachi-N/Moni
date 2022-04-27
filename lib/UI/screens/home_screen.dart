import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moni/Core/utils/moni_colors.dart';
import 'package:moni/UI/screens/cluster_details_screen.dart';
import 'package:moni/UI/screens/members_screen.dart';
import 'package:moni/UI/widgets/repayment_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: NestedScrollView(

        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
             SliverAppBar(
              leading: BackButton(),
              pinned: true,
              title: Text(
                'My cluster',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

            ),
            SliverToBoxAdapter(
              child: Container(
                color: MoniColors.darkDarker,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Moni dreambig community',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            RepaymentWidget(
                              title: 'Repayment rate: ',
                              subtitle: '60%',
                              color: MoniColors.secondaryBrand,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            RepaymentWidget(
                              title: 'Repayment Day: ',
                              subtitle: 'Every Sunday',
                              color: MoniColors.greenLighter,
                            ),
                          ],
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Image.asset(
                              'assets/avatar.png',
                              height: 70.0,
                              width: 70.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Divider(
                        height: 0.5,
                        color: Color(0xFF72777A),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cluster purse balance',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            //TODO: DM sans does not support the naira symbol so I used mulish
                            Text(
                              '₦550,000,000',
                              style: GoogleFonts.mulish(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),

                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              '+₦550,000,000 interest today',
                              style: GoogleFonts.mulish(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: MoniColors.greenLighter,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: MoniColors.primaryBrand,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                                horizontal: 24.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                              )),
                          child: Text(
                            'View Purse',
                            style: GoogleFonts.dmSans(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Divider(
                        height: 0.5,
                        color: Color(0xFF72777A),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total interest earned',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: MoniColors.greyBase,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '₦550,000,000',
                          style: GoogleFonts.mulish(
                            fontSize: 14.0,
                            color: MoniColors.secondaryBrand,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Divider(
                        height: 0.5,
                        color: Color(0xFF72777A),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total owed by members',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: MoniColors.greyBase,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '₦550,000,000',
                          style: GoogleFonts.mulish(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
              ),
            ),
            const SliverAppBar(
              pinned: true,
              primary: false,
              backgroundColor: MoniColors.secondaryBrandLightest,
              toolbarHeight: 5.0,

              bottom: TabBar(
                labelColor: MoniColors.primaryBrand,
                unselectedLabelColor: MoniColors.darkDark,
                indicatorColor: MoniColors.primaryBrand,
                indicatorWeight: 2.0,
                unselectedLabelStyle:
                TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                ),
                tabs: [
                  Tab(text: 'Members (9)'),
                  Tab(text: 'Cluster Details'),
                ],
              ),
            ),
          ];

        }, body: TabBarView(children: <Widget>[
        MembersScreen(),
        ClusterDetailsScreen(),
      ]),
      ),
    ));
  }
}
