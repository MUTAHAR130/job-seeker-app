import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Requires the 'intl' package in pubspec.yaml

class DateSelectorField extends StatelessWidget {
  final String hintText;
  final DateTime? currentDate;
  final ValueChanged<DateTime> onDateSelected;

  const DateSelectorField({
    super.key,
    required this.hintText,
    this.currentDate,
    required this.onDateSelected,
  });

  static final DateFormat formatter = DateFormat('MMMM yyyy');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      // Use the provided currentDate as the initial date
      initialDate: currentDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != currentDate) {
      // When a date is picked, call the external callback to update the controller's state
      onDateSelected(picked);
    }
  }

  String getDisplayText() {
    if (currentDate == null) {
      return hintText;
    }
    return formatter.format(currentDate!);
  }

  @override
  Widget build(BuildContext context) {
    // Determine the text color for the placeholder/value
    final Color textColor = currentDate == null
        ? Colors.grey.shade500
        : Colors.black87;

    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Display the selected date or hint text
            Text(
              getDisplayText(),
              style: TextStyle(fontSize: 12, color: textColor),
            ),

            // Calendar Icon on the right
            Icon(
              Icons.calendar_today_outlined,
              color: Colors.grey.shade600,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
