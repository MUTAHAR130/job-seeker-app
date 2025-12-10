import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';

class WhiteCard extends StatelessWidget {
  final String? topIcon;
  final String title;
  final String? subTitle;
  final Widget? child;
  final Function? onCancel;
  final Function? onBack;

  const WhiteCard({
    super.key,
    required this.title,
    this.onCancel,
    this.onBack,
    this.subTitle,
    this.child,
    this.topIcon,
  });

  @override
  Widget build(BuildContext context) {
    return WhiteCurvedBox(
      margin: 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          onCancel != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    onBack != null ? IconButton(
                      onPressed: () {onBack!();},
                      icon: SvgPicture.string(AppIcons.backIcon),
                    ) : SizedBox(),
                    IconButton(
                      onPressed: () {
                        onCancel!();
                      },
                      icon: Icon(Icons.close, size: 25),
                    ),
                  ],
                )
              : SizedBox(),
          Container(
            child: topIcon != null ? SvgPicture.string(topIcon!) : null,
          ),
          SizedBox(height: 15),
          Text(
            title,
            textAlign: TextAlign.center,
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
