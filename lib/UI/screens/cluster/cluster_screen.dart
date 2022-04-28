import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' show SpinKitFadingFour;
import 'package:google_fonts/google_fonts.dart';
import 'package:moni/Core/features/loan/provider/loan_provider.dart';
import 'package:moni/Core/utils/currency_format.dart';
import 'package:moni/Core/utils/network_state.dart';
import 'package:moni/UI/screens/cluster/cluster_details_screen.dart';
import 'package:moni/UI/screens/failure_screen.dart';
import 'package:moni/UI/screens/no_internet_screen.dart';
import 'package:moni/UI/utils/moni_colors.dart';
import 'package:provider/provider.dart';
import 'members_screen.dart';
import 'widgets/container_painter.dart';
import 'widgets/repayment_widget.dart';

class ClusterScreen extends StatefulWidget {
  const ClusterScreen({Key? key}) : super(key: key);

  @override
  State<ClusterScreen> createState() => _ClusterScreenState();
}

class _ClusterScreenState extends State<ClusterScreen> {

  @override
  Widget build(BuildContext context) {
    final clusterModel = context.watch<LoanProvider>();


    if(clusterModel.networkSate == NetworkState.idle) {
      return _ClusterScreen();
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: MoniColors.darkDarker,
          leading: const BackButton(),
          title: const Text(
            'My cluster',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Visibility(
          visible: clusterModel.networkSate == NetworkState.loading,
          replacement: Visibility(
            visible: clusterModel.networkSate != NetworkState.failed,
            child: const FailureScreen(),
            replacement: const NoInternetScreen( ),
          ),
          child: const Center(
            child: SpinKitFadingFour(
              color: MoniColors.primaryBrand,
            ),
          ),
        ),
      );

    }
  }

  @override
  void initState() {
    super.initState();
    context.read<LoanProvider>().getCluster();
  }
}

class _ClusterScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final clusterModel = context.watch<LoanProvider>();
    final cluster = clusterModel.cluster!;
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: MoniColors.darkDarker,
                leading: const BackButton(),
                expandedHeight: 390.0,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.none,
                  background: CustomPaint(
                    painter: ContainerPatternPainter(
                      featuresCount: MediaQuery.of(context).size.width ~/ 5,
                    ),
                    child: Container(
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
                                children:  [
                                  Text(
                                    cluster.name,
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
                                    subtitle: '${cluster.rate}%',
                                    color: MoniColors.secondaryBrand,
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  RepaymentWidget(
                                    title: 'Repayment Day: ',
                                    subtitle: 'Every ${cluster.repaymentDay}',
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
                                    currency.format(cluster.purseBalance),
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
                                currency.format(cluster.totalInterestEarned),
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
                                currency.format(cluster.totalOwedByMembers),
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
                ),
                pinned: true,
                title: const Text(
                  'My cluster',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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
          },
          body: const TabBarView(children: <Widget>[
            MembersScreen(),
            ClusterDetailsScreen(),
          ]),
        ),
      ),
    );
  }
}

