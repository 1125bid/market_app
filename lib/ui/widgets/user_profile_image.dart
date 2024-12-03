import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  UserProfileImage({
    super.key,
    required this.dimension,
    required this.imageUrl,
  });
  double dimension;
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          )),
    );
  }
}
