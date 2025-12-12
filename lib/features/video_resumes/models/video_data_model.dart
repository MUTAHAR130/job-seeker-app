class VideoDataModel {
  String resumeAsset;
  String title;
  bool isRecorded;
  bool isDefault;
  DateTime date;

  VideoDataModel({
    required this.title,
    required this.resumeAsset,
    required this.isDefault,
    required this.isRecorded,
    required this.date
  });
}
