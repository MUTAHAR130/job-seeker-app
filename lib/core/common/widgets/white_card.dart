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
  final bool? secondary;

  const WhiteCard({
    super.key,
    required this.title,
    this.onCancel,
    this.onBack,
    this.subTitle,
    this.child,
    this.topIcon,
    this.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return WhiteCurvedBox(
      margin: 24,
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            onCancel != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      onBack != null
                          ? IconButton(
                              onPressed: () {
                                onBack!();
                              },
                              icon: SvgPicture.string(AppIcons.backIcon),
                            )
                          : secondary == true
                          ? Expanded(
                            child: Text(
                                title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          )
                          : SizedBox(),
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
            secondary == true
                ? SizedBox()
                : Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
            subTitle != null
                ? Text(
                    subTitle!,
                    textAlign: secondary == true
                        ? TextAlign.left
                        : TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  )
                : SizedBox(),
            ?child,
          ],
        ),
      ),
    );
  }
}
