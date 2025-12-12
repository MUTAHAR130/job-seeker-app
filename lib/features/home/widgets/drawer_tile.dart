import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final String icon;
  final String filledIcon;
  final bool selected;
  final Function onTap;

  const DrawerTile({
    super.key,
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
    required this.filledIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: ListTile(
        leading: SvgPicture.string(selected ? filledIcon : icon),
        title: Text(title),
        selected: selected,
      ),
    );
  }
}
