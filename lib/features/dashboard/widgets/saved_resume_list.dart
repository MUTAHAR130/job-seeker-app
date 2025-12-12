import 'package:flutter/material.dart';
import 'package:job_seeker/features/dashboard/models/saved_resume_model.dart';
import 'package:job_seeker/features/dashboard/widgets/saved_resume_widget.dart';

class SavedResumeList extends StatelessWidget {
  final int itemCount;
  final List<SavedResumeModel> savedResumeData;
  final bool? isRadio;
  final int? groupVal;

  const SavedResumeList({
    super.key,
    required this.itemCount,
    required this.savedResumeData,
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
            child: SavedResumeWidget(
              resumeAsset: savedResumeData[index].resumeAsset,
              resumeTitle: savedResumeData[index].title,
              isDefault: savedResumeData[index].isDefault,
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
