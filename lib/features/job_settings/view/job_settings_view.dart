import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/check_box_option.dart';
import 'package:job_seeker/core/common/widgets/drop_down_menu.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:job_seeker/core/common/widgets/option_toggle_tile.dart';
import 'package:job_seeker/core/common/widgets/value_display_slider.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/features/job_settings/controller/job_settings_controller.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/job_settings/widgets/reset_settings_dialog.dart';

class JobSettingsView extends StatelessWidget {
  final JobSettingsController jobSettingsController =
      Get.find<JobSettingsController>();

  JobSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WhiteCurvedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SvgPicture.string(AppIcons.personIcon),
                          SizedBox(width: 5),
                          Text(
                            'Employment Status',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    OptionToggleTile(
                      toggleValue: false,
                      toggleFunction: () {},
                      tileText: 'Current Employment Status',
                      subTitle: 'Marked as Jobless - Priority mode active',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              WhiteCurvedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SvgPicture.string(AppIcons.personIcon),
                          SizedBox(width: 5),
                          Text(
                            'Automation Controls',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    OptionToggleTile(
                      toggleValue: false,
                      toggleFunction: () {},
                      tileText: 'Enable Auto-Apply',
                      subTitle:
                          'Automatically submit applications for high-match jobs',
                    ),
                    SizedBox(height: 15),
                    OptionToggleTile(
                      toggleValue: false,
                      toggleFunction: () {},
                      tileText: 'Email Integration',
                      subTitle:
                          'Send applications via your connected email account',
                    ),
                    SizedBox(height: 15),
                    OptionToggleTile(
                      toggleValue: false,
                      toggleFunction: () {},
                      tileText: 'Browser Extension Auto-Fill',
                      subTitle:
                          'Enable automatic form filling on external platforms',
                    ),
                    SizedBox(height: 15),
                    OptionToggleTile(
                      toggleValue: false,
                      toggleFunction: () {},
                      tileText: 'Preview Documents Before Submission',
                      subTitle:
                          'Review resume and cover letter before SmartResume applies automatically.',
                    ),
                    SizedBox(height: 15),
                    OptionToggleTile(
                      toggleValue: false,
                      toggleFunction: () {},
                      tileText: 'AI Document Regeneration',
                      subTitle:
                          'Allow AI to regenerate resumes for high-priority jobs',
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Application Frequency Limit',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Limit the number of automated applications per day or week.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 15),
                    CustomValueDisplaySlider(
                      min: 0,
                      max: 150,
                      showMin: true,
                      valuePrefix: '',
                      valueSuffix: '',
                      onChange: () {},
                      currentSliderValue: 100,
                      roundOff: true,
                    ),
                    SizedBox(height: 15),
                    LabeledDropDownMenu(
                      label: 'Time',
                      items: [],
                      onChange: () {},
                      hintText: 'Select Frequency',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              WhiteCurvedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SvgPicture.string(AppIcons.locationIcon),
                          SizedBox(width: 5),
                          Text(
                            'Location Filters',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    LabeledDropDownMenu(
                      label: 'Country',
                      items: [],
                      onChange: () {},
                      hintText: 'Select country',
                    ),
                    SizedBox(height: 15),
                    LabeledDropDownMenu(
                      label: 'State',
                      items: [],
                      onChange: () {},
                      hintText: 'Select state',
                    ),
                    SizedBox(height: 15),
                    LabeledDropDownMenu(
                      label: 'City',
                      items: [],
                      onChange: () {},
                      hintText: 'Select city',
                    ),
                    SizedBox(height: 15),
                    InputField(
                      label: 'Post Code',
                      hintText: 'Enter post code',
                      controller: jobSettingsController.postCodeTC,
                      prefixIcon: Icons.location_on_outlined,
                    ),
                    SizedBox(height: 15),
                    LabeledDropDownMenu(
                      label: 'Distance',
                      items: [],
                      onChange: () {},
                      hintText: 'Select distance',
                    ),
                    SizedBox(height: 15),
                    OptionToggleTile(
                      toggleValue: false,
                      toggleFunction: () {},
                      tileText: 'Anywhere',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              WhiteCurvedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SvgPicture.string(AppIcons.bagIcon),
                          SizedBox(width: 5),
                          Text(
                            'Job Type & Work Mode',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Job Type',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    CheckBoxOption(
                      label: 'Full Time',
                      checked: true,
                      onTap: () {},
                    ),
                    SizedBox(height: 8),
                    CheckBoxOption(
                      label: 'Part Time',
                      checked: false,
                      onTap: () {},
                    ),
                    SizedBox(height: 8),
                    CheckBoxOption(
                      label: 'Contract',
                      checked: true,
                      onTap: () {},
                    ),
                    SizedBox(height: 8),
                    CheckBoxOption(
                      label: 'Internship',
                      checked: false,
                      onTap: () {},
                    ),
                    SizedBox(height: 8),
                    CheckBoxOption(
                      label: 'Freelance',
                      checked: false,
                      onTap: () {},
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Work Mode',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    CheckBoxOption(
                      label: 'Onsite',
                      checked: true,
                      onTap: () {},
                    ),
                    SizedBox(height: 8),
                    CheckBoxOption(
                      label: 'Remote',
                      checked: false,
                      onTap: () {},
                    ),
                    SizedBox(height: 8),
                    CheckBoxOption(
                      label: 'Hybrid',
                      checked: true,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              WhiteCurvedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SvgPicture.string(AppIcons.pinPointIcon),
                          SizedBox(width: 5),
                          Text(
                            'Skills',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    LabeledDropDownMenu(
                      label: 'Skills',
                      items: [],
                      onChange: () {},
                      hintText: 'Search Skills',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              WhiteCurvedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SvgPicture.string(AppIcons.moneyIcon),
                          SizedBox(width: 5),
                          Text(
                            'Salary Range',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    CustomValueDisplaySlider(
                      min: 0,
                      max: 100,
                      showMin: true,
                      valuePrefix: '\$',
                      valueSuffix: 'k',
                      onChange: () {},
                      currentSliderValue: 42,
                      roundOff: true,
                    ),
                    SizedBox(height: 15),
                    LabeledDropDownMenu(
                      label: 'Currency',
                      items: [],
                      onChange: () {},
                      hintText: 'Select Currency',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              WhiteCurvedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SvgPicture.string(AppIcons.exclusionIcon),
                          SizedBox(width: 5),
                          Text(
                            'Exclusions',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    LabeledDropDownMenu(
                      label: 'BlackList Companies',
                      items: [],
                      onChange: () {},
                      hintText: 'Select blacklist companies',
                    ),
                    SizedBox(height: 15),
                    OptionToggleTile(
                      toggleValue: false,
                      toggleFunction: () {},
                      tileText: 'Current Employer Exclusion',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              WhiteCurvedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SvgPicture.string(AppIcons.bellIcon),
                          SizedBox(width: 5),
                          Text(
                            'Notification Preferences',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    OptionToggleTile(
                      toggleValue: false,
                      toggleFunction: () {},
                      tileText: 'Application Submitted',
                      subTitle:
                          'Notify when an application is successfully submitted',
                    ),
                    SizedBox(height: 15),
                    OptionToggleTile(
                      toggleValue: false,
                      toggleFunction: () {},
                      tileText: 'Email Bounced',
                      subTitle:
                          'Alert when an email application fails to deliver',
                    ),
                    SizedBox(height: 15),
                    OptionToggleTile(
                      toggleValue: false,
                      toggleFunction: () {},
                      tileText: 'Employer Response',
                      subTitle:
                          'Notify when a recruiter responds to your application',
                    ),
                    SizedBox(height: 15),
                    OptionToggleTile(
                      toggleValue: false,
                      toggleFunction: () {},
                      tileText: 'High-Match Jobs Found',
                      subTitle:
                          'Alert when new jobs with 90%+ match are discovered',
                    ),
                    SizedBox(height: 15),
                    OptionToggleTile(
                      toggleValue: false,
                      toggleFunction: () {},
                      tileText: 'Weekly Summary',
                      subTitle:
                          'Receive weekly report of applications and responses',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ActionButton(
                    width: 150,
                    hPadding: 0,
                    noColor: true,
                    inverted: true,
                    buttonText: 'Reset to Default',
                    onPress: () {
                      Get.dialog(ResetSettingsDialog());
                    },
                  ),
                  ActionButton(
                    width: 150,
                    hPadding: 0,
                    buttonText: 'Save Settings',
                    onPress: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
