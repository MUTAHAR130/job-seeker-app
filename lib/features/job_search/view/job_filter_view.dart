import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/bubble_list_widget.dart';
import 'package:job_seeker/core/common/widgets/bubble_selector_widget.dart';
import 'package:job_seeker/core/common/widgets/drop_down_menu.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:job_seeker/core/common/widgets/option_toggle_tile.dart';
import 'package:job_seeker/core/common/widgets/value_display_slider.dart';
import 'package:job_seeker/features/job_search/controller/jobs_controller.dart';
import 'package:job_seeker/features/job_search/widgets/dialogs/save_filter_dialog.dart';

class JobFilterView extends StatelessWidget {
  final JobController jobController = Get.find<JobController>();

  JobFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filters',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              SizedBox(height: 15),
              LabeledDropDownMenu(
                label: 'Saved Filter',
                items: [],
                onChange: () {},
                hintText: 'Select',
              ),
              SizedBox(height: 30),
              Text(
                'Job Basics',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              SizedBox(height: 15),
              Text(
                'Job Type',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  BubbleSelectorWidget(text: 'All', selected: false),
                  BubbleSelectorWidget(text: 'Full-Time', selected: true),
                  BubbleSelectorWidget(text: 'Part-Time', selected: false),
                  BubbleSelectorWidget(text: 'Internship', selected: false),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  BubbleSelectorWidget(text: 'Freelance', selected: true),
                  BubbleSelectorWidget(text: 'Contract', selected: false),
                ],
              ),

              SizedBox(height: 15),
              Text(
                'Work Model',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  BubbleSelectorWidget(text: 'All', selected: false),
                  BubbleSelectorWidget(text: 'Onsite', selected: true),
                  BubbleSelectorWidget(text: 'Remote', selected: false),
                  BubbleSelectorWidget(text: 'Hybrid', selected: false),
                ],
              ),
              SizedBox(height: 15),
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
                controller: jobController.jobFilterPostCodeTC,
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
              Obx(
                () => OptionToggleTile(
                  toggleValue: jobController.jobFilterAnywhere.value,
                  toggleFunction: jobController.onAnywhereChange,
                  tileText: 'Anywhere',
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Preferences',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              SizedBox(height: 15),
              LabeledDropDownMenu(
                label: 'Department',
                items: [],
                onChange: () {},
                hintText: 'Select',
              ),
              SizedBox(height: 5),
              //displayed using horizontally scrollable listview builder
              BubbleListWidget(text: 'Design', onTap: (){}),
              SizedBox(height: 15),
              LabeledDropDownMenu(
                label: 'Skills',
                items: [],
                onChange: () {},
                hintText: 'Search Skills',
              ),
              SizedBox(height: 15),
              Text(
                'Salary Range',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              SizedBox(height: 8),
              Obx(
                () => CustomValueDisplaySlider(
                  min: 0,
                  max: 100,
                  valuePrefix: '\$',
                  valueSuffix: 'k',
                  showMin: true,
                  onChange: jobController.onSalaryChange,
                  currentSliderValue: jobController.jobFilterSalary.value
                      .toDouble(),
                  roundOff: true,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Exclusions',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
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
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ActionButton(
                    width: 150,
                    hPadding: 0,
                    noColor: true,
                    inverted: true,
                    buttonText: 'Save Filter',
                    onPress: () {
                      Get.dialog(SaveFilterDialog());
                    },
                  ),
                  ActionButton(
                    width: 150,
                    hPadding: 0,
                    buttonText: 'Apply Filter',
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
