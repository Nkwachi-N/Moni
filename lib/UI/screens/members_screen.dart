import 'package:flutter/material.dart';

import '../../Core/utils/moni_colors.dart';

class MembersScreen extends StatelessWidget {
  const MembersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}


class MoniExpansionTile extends StatefulWidget {
  final List<Widget> children;
  const MoniExpansionTile({Key? key,required this.children,}) : super(key: key);

  @override
  State<MoniExpansionTile> createState() => _MoniExpansionTileState();
}

class _MoniExpansionTileState extends State<MoniExpansionTile> {
  Icon  _icon = const Icon(Icons.add,key: ValueKey('add'),);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        collapsedIconColor: Colors.black.withOpacity(0.58),
        iconColor: Colors.black.withOpacity(0.58),
        textColor: MoniColors.textColor,
        trailing:  AnimatedSwitcher(
          child: _icon,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          duration: const Duration(milliseconds: 200),
        ),
        onExpansionChanged: (val){
          setState(() {
            _icon = val ? const Icon(Icons.remove,key: ValueKey('remove'),) : const Icon(Icons.add,key: ValueKey('add'),);
          });
        },
        title: const Text(
          'Overdue',
          style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400),
        ),
        children: widget.children,
      ),
    );
  }
}

