// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// // This custom widget combines a TextFormField with a formatting toolbar above it.
// // It is now a StatelessWidget using GetX for state management.
// class RichInputField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final int maxLines;
//
//   RichInputField({
//     super.key,
//     required this.controller,
//     this.hintText = 'Enter your description...',
//     this.maxLines = 10,
//   });
//
//   // Inject and retrieve the controller instance
//   // We use Get.put in the ExamplePage, so we use Get.find here.
//   final FocusNode _focusNode = FocusNode();
//
//   // Helper widget for a single format button
//   Widget _buildFormatButton({
//     required IconData icon,
//     required String format,
//     required bool isActive,
//     required RichTextController rtc,
//     required RxBool observable,
//   }) {
//     // Use Obx to rebuild only the IconButton when its state changes
//     return Obx(() => IconButton(
//       icon: Icon(icon),
//       color: observable.value ? Colors.deepPurple.shade700 : Colors.grey.shade600,
//       iconSize: 20,
//       padding: EdgeInsets.zero,
//       constraints: const BoxConstraints(), // To make the buttons closer
//       onPressed: () => rtc.toggleFormat(format),
//     ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Find the controller instance initialized in the ExamplePage
//     final RichTextController rtc = Get.find<RichTextController>();
//
//     return Container(
//       decoration: BoxDecoration(
//         color: Get.theme.colorScheme.surface,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // --- 1. Formatting Toolbar ---
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             decoration: BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(color: Colors.grey.shade300, width: 1.0),
//               ),
//             ),
//             child: Row(
//               children: [
//                 _buildFormatButton(icon: Icons.format_bold, format: 'bold', isActive: rtc.isBold.value, rtc: rtc, observable: rtc.isBold),
//                 const SizedBox(width: 12),
//                 _buildFormatButton(icon: Icons.format_italic, format: 'italic', isActive: rtc.isItalic.value, rtc: rtc, observable: rtc.isItalic),
//                 const SizedBox(width: 12),
//                 _buildFormatButton(icon: Icons.format_underlined, format: 'underline', isActive: rtc.isUnderline.value, rtc: rtc, observable: rtc.isUnderline),
//                 const SizedBox(width: 12),
//                 // Strikethrough icon (Stateless)
//                 _buildFormatButton(icon: Icons.strikethrough_s, format: 'strikethrough', isActive: false, rtc: rtc, observable: false.obs), // Placeholder, not implemented in controller
//                 const SizedBox(width: 12),
//                 // List icons
//                 _buildFormatButton(icon: Icons.format_list_bulleted, format: 'list', isActive: rtc.isList.value, rtc: rtc, observable: rtc.isList),
//                 const SizedBox(width: 12),
//                 _buildFormatButton(icon: Icons.format_list_numbered, format: 'numbered', isActive: false, rtc: rtc, observable: false.obs), // Placeholder, not implemented in controller
//                 const SizedBox(width: 12),
//                 // Link icon
//                 _buildFormatButton(icon: Icons.link, format: 'link', isActive: rtc.isLink.value, rtc: rtc, observable: rtc.isLink),
//               ],
//             ),
//           ),
//
//           // --- 2. Text Input Area ---
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: Obx(() => TextFormField(
//               controller: controller,
//               focusNode: _focusNode,
//               maxLines: maxLines,
//               minLines: 1,
//               keyboardType: TextInputType.multiline,
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.zero,
//                 isDense: true,
//               ),
//               // Use Obx to reactively apply text style based on controller state
//               style: TextStyle(
//                 fontWeight: rtc.isBold.value ? FontWeight.bold : FontWeight.normal,
//                 fontStyle: rtc.isItalic.value ? FontStyle.italic : FontStyle.normal,
//                 decoration: rtc.isUnderline.value ? TextDecoration.underline : TextDecoration.none,
//                 fontSize: 14,
//                 height: 1.5,
//               ),
//               onChanged: (text) {
//                 // Formatting logic goes here
//               },
//             )),
//           ),
//         ],
//       ),
//     );
//   }
// }
