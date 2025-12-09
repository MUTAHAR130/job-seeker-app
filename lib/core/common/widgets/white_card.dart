import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';

class WhiteCard extends StatelessWidget {
  final String? topIcon;
  final String title;
  final String? subTitle;
  final Widget? child;

  const WhiteCard({
    super.key,
    required this.title,
    this.subTitle,
    this.child,
    this.topIcon,
  });

  @override
  Widget build(BuildContext context) {
    return WhiteCurvedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: topIcon != null ? SvgPicture.string(topIcon!) : null,
          ),
          SizedBox(height: 15),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          subTitle != null
              ? Text(
                  subTitle!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                )
              : SizedBox(),
          ?child,
        ],
      ),
    );
  }
}
