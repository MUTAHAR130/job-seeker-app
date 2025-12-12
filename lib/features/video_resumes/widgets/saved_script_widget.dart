import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/bubble_list_widget.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';

class SavedScriptWidget extends StatelessWidget {
  final String scriptNote;
  final List<String> scriptTypes;
  final String title;
  final Function onTap;
  final int index;

  const SavedScriptWidget({
    super.key,
    required this.scriptNote,
    required this.title,
    required this.onTap,
    required this.index,
    required this.scriptTypes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: WhiteCurvedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 28,
              child: ListView.builder(
                itemCount: scriptTypes.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return BubbleListWidget(
                    text: scriptTypes[index],
                    onTap: () {},
                    noOnTap: true,
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            Text(
              scriptNote,
              maxLines: 12,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ActionButton(
                  width: 50,
                  height: 40,
                  inverted: true,
                  buttonText: 'Copy',
                  onPress: () {},
                ),
                SizedBox(width: 5),
                ActionButton(
                  width: 80,
                  height: 40,
                  buttonText: 'Download',
                  onPress: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
