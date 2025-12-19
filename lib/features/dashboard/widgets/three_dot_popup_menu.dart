import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/widgets/delete_item_dialog.dart';
import 'package:job_seeker/features/dashboard/widgets/dialogs/edit_resume_dialog.dart';
import 'package:job_seeker/features/dashboard/widgets/dialogs/set_default_dialog.dart';
import 'package:job_seeker/features/dashboard/widgets/edit_item_title_dialog.dart';

enum MenuItemAction { downloadPdf, setDefault, duplicate, edit, delete }

class ThreeDotPopupMenu extends StatelessWidget {
  final int index;
  final String currentTitle;
  final Function? onDownload;
  final Function? onDefault;
  final Function? onDuplicate;
  final Function? onEdit;
  final Function? onDelete;

  const ThreeDotPopupMenu({
    super.key,
    required this.index,
    required this.currentTitle,
    this.onDownload,
    this.onDefault,
    this.onDuplicate,
    this.onEdit,
    this.onDelete,
  });

  void _onMenuItemSelected(MenuItemAction action) {
    //trigger functions on specific actions on the index
    debugPrint('testing');
    debugPrint(index.toString());
    switch (action) {
      case MenuItemAction.downloadPdf:
        break;
      case MenuItemAction.setDefault:
        Get.dialog(
          SetDefaultDialog(index: index, onConfirm: onDefault ?? () {}),
        );
        break;
      case MenuItemAction.duplicate:
        break;
      case MenuItemAction.edit:
        Get.dialog(
          EditItemTitleDialog(
            index: index,
            onConfirm: onEdit ?? () {},
            currentTitle: currentTitle,
          ),
        );
        break;
      case MenuItemAction.delete:
        Get.dialog(
          DeleteItemDialog(index: index, onConfirm: onDelete ?? () {}),
        );
        break;
    }
  }

  PopupMenuItem<MenuItemAction> _buildPopupMenuItem({
    required MenuItemAction value,
    required String icon,
    required String title,
  }) {
    return PopupMenuItem(
      value: value,
      child: Row(
        mainAxisSize: MainAxisSize.min, // Essential for tight spacing
        children: [
          SvgPicture.string(icon),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItemAction>(
      onSelected: _onMenuItemSelected,
      icon: SvgPicture.string(AppIcons.dottedMenuIcon),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      elevation: 8,
      offset: const Offset(0, 40),

      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItemAction>>[
        if (onDownload != null)
          _buildPopupMenuItem(
            value: MenuItemAction.downloadPdf,
            icon: AppIcons.downloadIcon,
            title: 'Download PDF',
          ),
        if(onDefault != null)
        _buildPopupMenuItem(
          value: MenuItemAction.setDefault,
          icon: AppIcons.bookMarkIcon,
          title: 'Set as default',
        ),
        if(onDuplicate != null)
        _buildPopupMenuItem(
          value: MenuItemAction.duplicate,
          icon: AppIcons.duplicateIcon,
          title: 'Duplicate',
        ),
        if(onEdit != null)
        _buildPopupMenuItem(
          value: MenuItemAction.edit,
          icon: AppIcons.editIcon,
          title: 'Edit',
        ),
        if(onDelete != null)
        _buildPopupMenuItem(
          value: MenuItemAction.delete,
          icon: AppIcons.deleteIcon,
          title: 'Delete',
        ),
      ],
    );
  }
}
