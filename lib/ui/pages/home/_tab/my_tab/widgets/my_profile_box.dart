import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/snack_bar_util.dart';
import 'package:flutter_market_app/ui/widgets/user_profile_image.dart';

class MyProfileBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserProfileImage(
          dimension: 50,
          imageUrl: 'https://picsum.photos/id/237/200/300',
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            'data',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            SnackBarUtil.showSnackBar(context, '준비 중 입니다.');
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            child: Text(
              '프로필수정',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
