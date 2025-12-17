import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/custom_snack_bar.dart';
import 'package:job_seeker/core/common/widgets/drop_down_menu.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/video_resumes/controller/upload_video_controller.dart';
import 'package:job_seeker/features/video_resumes/controller/video_resumes_controller.dart';

class UploadVideoView extends StatelessWidget {
  final UploadVideoController uploadVideoController = Get.put(
    UploadVideoController(),
  );
  final VideoResumesController videoResumesController =
      Get.find<VideoResumesController>();

  UploadVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Video',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Obx(
            () => Column(
              children: [
                SizedBox(
                  height: uploadVideoController.videoUploaded.value
                      ? 0
                      : MediaQuery.sizeOf(context).height * 0.18,
                ),
                WhiteCurvedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        SvgPicture.string(AppIcons.uploadIcon),
                        SizedBox(height: 15),
                        Text(
                          'Drop your video here or click upload to browse',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 15),
                        Visibility(
                          visible: uploadVideoController.videoUploaded.value,
                          child: Text(
                            'davesmith_videoresume.mp4',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: uploadVideoController.videoUploaded.value
                              ? 15
                              : 0,
                        ),
                        ActionButton(
                          height: 40,
                          width: 76,
                          inverted: true,
                          noBorder: true,
                          bgColor: Get.theme.listTileTheme.selectedTileColor,
                          buttonText: uploadVideoController.videoUploaded.value
                              ? 'Change'
                              : 'Upload',
                          onPress: () {
                            uploadVideoController.onUpload();
                          },
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Accepted formats: MP4, MOV, MKV',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Minimum 720p resolution, 45 seconds to 3 minutes duration, maximum 150MB file size',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: uploadVideoController.videoUploaded.value,
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      InputField(
                        label: 'Video Title',
                        mandatory: true,
                        controller: uploadVideoController.videoTitleTC,
                        hintText: 'Enter Video Title',
                      ),
                      SizedBox(height: 15),
                      LabeledDropDownMenu(
                        label: 'Video Type',
                        items: [],
                        onChange: () {},
                        hintText: 'Select',
                      ),
                      SizedBox(height: 15),
                      ActionButton(
                        buttonText: 'Upload Video',
                        onPress: () {
                          Get.back();
                          videoResumesController.shownVideoResumeMenu.value =
                              '';
                          CustomSnackBar.showSuccessSnackBar('Video Uploaded');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
