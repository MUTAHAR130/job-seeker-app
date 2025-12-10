import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final String icon;
  final bool selected;
  final Function onTap;

  const DrawerTile({
    super.key,
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){onTap();},
      child: ListTile(
        leading: SvgPicture.string(icon),
        title: Text(title),
        selected: selected,
      ),
    );
  }
}
