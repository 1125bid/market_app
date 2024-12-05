// {
//     "id": 1,
//     "username": "tester",
//     "nickname": "오상구",
//     "profileImage": {
//       "id": 1,
//       "url": "http://localhost:8080/api/file/0e78ead5-cf18-465b-8f23-c1342a26fa6d",
//       "originName": "sanggoo.jpeg",
//       "contentType": "image/jpeg",
//       "createdAt": "2024-12-05T03:00:47.123Z"
//     }
//   }

import 'package:flutter_market_app/data/model/file_model.dart';

class User {
  int id;
  String username;
  String nickname;
  FileModel profileImage;

  User({
    required this.id,
    required this.username,
    required this.nickname,
    required this.profileImage,
  });

  User.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          username: map['username'],
          nickname: map['nickname'],
          profileImage: FileModel.fromJson(map['profileImage']),
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'nickname': nickname,
      'profileImage': profileImage.toJson(),
    };
  }
}
