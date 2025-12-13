import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/bubble_list_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage('assets/images/temp.jpg'),
              ),
              title: Text(
                'Dave Smith',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              subtitle: Text(
                'davesmith@gmail.com',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Get.theme.colorScheme.surface
                ),
                child: Center(child: SvgPicture.string(AppIcons.bagIcon)),
              ),
              title: Text(
                'Talent Acquisition',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              subtitle: Text(
                'HR Department',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
            BubbleListWidget(text: 'MARKETING', onTap: (){}, noOnTap: true,)
          ],
        ),
      ),
    );
  }
}
