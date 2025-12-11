class SavedResumeModel {
  String resumeAsset;
  String title;
  bool? isDefault;

  SavedResumeModel({
    required this.title,
    required this.resumeAsset,
    this.isDefault,
  });
}
