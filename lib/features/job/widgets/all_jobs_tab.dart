import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:job_seeker/features/job/controller/jobs_controller.dart';

class AllJobsTab extends StatelessWidget {
  final JobController jobController = JobController();

  AllJobsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 15),
        InputField(
          controller: jobController.jobListingSearchTC,
          prefixIcon: Icons.search,
          hintText: 'Search Job Title',
        ),
        SizedBox(height: 15),
        InputField(
          controller: jobController.jobListingLocationTC,
          prefixIcon: Icons.location_on_outlined,
          hintText: 'Search Location',
        ),
        SizedBox(height: 15),
        ActionButton(
          buttonText: 'Filter',
          invertedColor: true,
          prefixIcon: AppIcons.sliderBarsIcon,
          onPress: () {},
        ),
        //jobs list view here
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(value: 1, groupValue: 1, onChanged: (val) {}),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.string(AppIcons.newIcon),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'UI/UX Designer',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Competitive Package',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.bookmark_border_outlined),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.string(AppIcons.googleIconSvg),
                    Text(
                      'Google - Los Angeles, California, US',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
