import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moni/Core/utils/moni_colors.dart';

class ClusterDetailsScreen extends StatelessWidget {
  const ClusterDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/badge-dollar 1.svg'),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                'Cluster purse setting',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: MoniColors.darkDarker,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
