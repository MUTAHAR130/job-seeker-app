import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/drop_down_menu.dart';

class JobTile extends StatelessWidget {
  final String? jobCondition;
  final String jobTitle;
  final String jobSalary;
  final bool bookMarked;
  final String companyLogo;
  final String companyName;
  final String companyLocation;
  final String workHourType;
  final String workLocation;
  final DateTime datePosted;
  final Function onTileTap;
  final Function onIconTap;
  final bool? isDeletable;
  final bool? statusKnown;
  final String? defaultValue;

  JobTile({
    super.key,
    this.jobCondition,
    required this.jobTitle,
    required this.jobSalary,
    required this.bookMarked,
    required this.companyLogo,
    required this.companyName,
    required this.companyLocation,
    required this.workHourType,
    required this.workLocation,
    required this.datePosted,
    required this.onTileTap,
    required this.onIconTap,
    this.isDeletable,
    this.statusKnown,
    this.defaultValue,
  });

  final List<String> jobStatusOptions = [
    'NO STATUS',
    'APPLIED',
    'REVIEWED',
    'SHORTLISTED',
    'INTERVIEWED',
    'OFFERED',
    'HIRED',
    'REJECTED',
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTileTap();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(value: 1, groupValue: 1, onChanged: (val) {}),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      jobCondition != null
                          ? SvgPicture.string(jobCondition!)
                          : SizedBox(),
                      statusKnown == true
                          ? LabeledDropDownMenu(
                              height: 24,
                              width: 123,
                              items: jobStatusOptions,
                              onChange: () {},
                              hintText: '',
                              defaultValue: defaultValue,
                            )
                          : SizedBox(),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        jobTitle,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            jobSalary,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              onIconTap();
                            },
                            child: statusKnown == true
                                ? SizedBox()
                                : (isDeletable == true
                                      ? SvgPicture.string(AppIcons.deleteIcon)
                                      : (bookMarked
                                            ? Icon(Icons.bookmark)
                                            : Icon(
                                                Icons.bookmark_border_outlined,
                                              ))),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SvgPicture.string(companyLogo),
                      Text(
                        '$companyName - $companyLocation',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.string(workHourType),
                          SizedBox(width: 3),
                          SvgPicture.string(workLocation),
                        ],
                      ),
                      Text(
                        DateFormat('MMM dd yyyy').format(datePosted),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
