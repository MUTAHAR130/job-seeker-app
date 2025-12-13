import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/bubble_list_widget.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';

class SavedInterviewWidget extends StatelessWidget {
  const SavedInterviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WhiteCurvedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Senior Frontend Developer',
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              BubbleListWidget(
                text: 'Written',
                onTap: () {},
                noOnTap: true,
              ),
            ],
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'TechCorp Inc.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 8),
          Row(children: [
            SvgPicture.string(AppIcons.questionIcon),
            Text(
              ' 6 Questions ',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            Icon(Icons.watch_later_outlined, size: 20,),
            Text(
              ' 8:43',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SvgPicture.string(AppIcons.rateUpIcon),
            Text(
              ' 75%',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            )
          ],),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Oct 25, 2025',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}