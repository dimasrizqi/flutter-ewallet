class TipFromModel {
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnail;

  TipFromModel({
    this.id,
    this.title,
    this.url,
    this.thumbnail,
  });

  factory TipFromModel.fromJson(Map<String, dynamic> json) => TipFromModel(
        id: json['id'],
        title: json['title'],
        url: json['url'],
        thumbnail: json['thumbnail'],
      );
}
