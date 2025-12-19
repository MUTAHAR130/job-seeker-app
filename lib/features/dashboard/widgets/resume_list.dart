import 'package:flutter/material.dart';
import 'package:job_seeker/features/dashboard/models/resume_model.dart';
import 'package:job_seeker/features/dashboard/widgets/resume_widget.dart';

class ResumeList extends StatelessWidget {
  final int itemCount;
  final List<ResumeModel> resumeData;
  final bool? isRadio;
  final int? groupVal;

  const ResumeList({
    super.key,
    required this.itemCount,
    required this.resumeData,
    this.isRadio,
    this.groupVal
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ResumeWidget(
              asset: resumeData[index].thumbnailUrl,
              title: resumeData[index].title,
              isDefault: resumeData[index].isPrimary,
              isRadio: isRadio,
              groupVal: groupVal,
              index: index,
              onTap: (index) {
                //action on data on that index
              },
            ),
          );
        },
      ),
    );
  }
}
