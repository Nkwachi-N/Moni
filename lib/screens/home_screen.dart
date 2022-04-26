import 'package:flutter/material.dart';
import 'package:moni/Core/utils/moni_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('My cluster',style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Column(
        children: [
          Container(
            color: MoniColors.darkDarker,
          )

        ],
      ),
    );
  }
}
