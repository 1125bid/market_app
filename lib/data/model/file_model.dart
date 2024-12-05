// {
//     "id": 2,
//     "url": "http://172.20.96.1:8080/api/file/74026ce3-77cc-4ea5-8205-c3bc3b079439",
//     "originName": "—Pngtree—mobile mockup transparent background_5887712.png",
//     "contentType": "image/png",
//     "createdAt": "2024-12-05T02:28:33.310+00:00"
//   }

class FileModel {
  int id;
  String url;
  String originName;
  String contentType;
  DateTime createdAt;

  FileModel({
    required this.id,
    required this.url,
    required this.originName,
    required this.contentType,
    required this.createdAt,
  });

  FileModel.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          url: map['url'],
          originName: map['originName'],
          contentType: map['contentType'],
          createdAt: DateTime.parse(map['createdAt']),
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'originName': originName,
      'contentType': contentType,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
