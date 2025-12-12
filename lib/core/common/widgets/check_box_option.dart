import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CheckBoxOption extends StatelessWidget {
  final String label;
  final bool checked;
  final Function onTap;

  const CheckBoxOption({
    super.key,
    required this.label,
    required this.onTap,
    required this.checked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: BoxBorder.all(color: Get.theme.colorScheme.outline),
      ),
      child: ListTile(
        onTap: (){onTap();},
        title: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        trailing: Icon(checked ? Icons.check_circle : Icons.circle_outlined),
      ),
    );
  }
}