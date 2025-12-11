import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';

class CustomSnackBar {
  static void showSnackBar(String message) {
    final Color successColor = Colors.green.shade600;
    Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.only(bottom: 20, left: 8, right: 8),
      backgroundColor: Colors.transparent,
      messageText: Container(
        padding: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(
          //   color: Colors.grey.shade300,
          //   width: 1.0,
          // ),
          boxShadow: [BoxShadow(color: Colors.transparent)],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 4,
                height: 50,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: successColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          
              // Green Checkmark Icon
              SvgPicture.string(AppIcons.checkMarkIcon),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: Get.theme.colorScheme.onSurface,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      titleText: const SizedBox.shrink(),
      icon: const SizedBox.shrink(),
    );
  }
}
