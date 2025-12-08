import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final String icon;
  final bool selected;

  const DrawerTile({
    super.key,
    required this.title,
    required this.icon,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.string(icon),
      title: Text(title),
      selected: selected,
    );
  }
}
