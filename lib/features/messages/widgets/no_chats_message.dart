import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';

class NoChatsMessage extends StatelessWidget {
  const NoChatsMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              SvgPicture.string(AppIcons.highlightIcon),
              Positioned(
                top: 12,
                left: 12,
                child: SvgPicture.string(
                  AppIcons.messagesIcon,
                  height: 40,
                  width: 40,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Text(
            'No conversations yet',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8),
          Text(
            'Start a new chat to connect with recruiters or candidates. Your conversations will appear here once messages begin.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 15),
          ActionButton(
            height: 48,
            width: 165,
            prefixIcon: AppIcons.addIcon,
            buttonText: 'New Message',
            onPress: () {},
          )
        ],
      ),
    );
  }
}
