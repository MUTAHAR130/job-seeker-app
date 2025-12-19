import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/custom_snack_bar.dart';
import 'package:job_seeker/core/common/widgets/delete_item_dialog.dart';
import 'package:job_seeker/core/routes/app_routes.dart';

// import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:get/get.dart';

// import 'package:job_seeker/features/job_search/widgets/dialogs/save_filter_dialog.dart';
import 'package:job_seeker/features/saved_filters/controller/saved_filters_controller.dart';

class SavedFiltersView extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  final SavedFiltersController savedFiltersController =
      Get.find<SavedFiltersController>();

  SavedFiltersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter name',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        await Get.toNamed(AppRoutes.jobFilterView);
                        CustomSnackBar.showSuccessSnackBar('Filter Updated');
                      },
                      child: SvgPicture.string(AppIcons.editBoxIcon),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Get.dialog(
                          DeleteItemDialog(index: 0, onConfirm: () {}),
                        );
                      },
                      child: SvgPicture.string(AppIcons.deleteIcon),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
    //shown when list is empty
    // return Center(
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Stack(
    //         children: [
    //           SvgPicture.string(AppIcons.highlightIcon),
    //           Positioned(
    //             top: 12,
    //             left: 12,
    //             child: SvgPicture.string(AppIcons.sliderBarsIcon, height: 40),
    //           ),
    //         ],
    //       ),
    //       SizedBox(height: 15),
    //       Text(
    //         'No saved filters yet',
    //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    //       ),
    //       SizedBox(height: 8),
    //       Text(
    //         'Save a job search filter to quickly reuse it and find matching jobs faster.',
    //         textAlign: TextAlign.center,
    //         style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    //       ),
    //       SizedBox(height: 15),
    //       ActionButton(width: 162,buttonText: 'Got to Job Search', onPress: () {
    //         homeController.changeDrawer(1);
    //       }),
    //     ],
    //   ),
    // );
  }
}
