import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';

class WhiteCardRich extends StatelessWidget {
  final String? topIcon;
  final String title;
  final String leadingSubTitle;
  final String subTitle;
  final String trailingSubTitle;
  final Widget? child;

  const WhiteCardRich({
    super.key,
    required this.title,
    required this.leadingSubTitle,
    required this.subTitle,
    required this.trailingSubTitle,
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
          topIcon != null ? SvgPicture.string(topIcon!) : SizedBox(),
          SizedBox(height: 15),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              children: <TextSpan>[
                TextSpan(text: leadingSubTitle),
                TextSpan(
                  text: subTitle,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(text: trailingSubTitle),
              ],
            ),
          ),
          ?child,
        ],
      ),
    );
  }
}
