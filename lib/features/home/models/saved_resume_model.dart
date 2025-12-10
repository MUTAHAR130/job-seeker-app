class SavedResumeModel {
  String resumeAsset;
  String resumeTitle;
  bool? isDefault;

  SavedResumeModel({
    required this.resumeTitle,
    required this.resumeAsset,
    this.isDefault,
  });
}
