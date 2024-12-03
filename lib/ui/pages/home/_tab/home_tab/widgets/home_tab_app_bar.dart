import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/snack_bar_util.dart';

class HomeTabAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //bottom 속성 사용불가.=>scafold 의 appBar에서 사용가능.
    return AppBar(
      title: Text(
        '온천동',
        style: TextStyle(
            // fontSize:
            ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            SnackBarUtil.showSnackBar(context, '준비중입니다.');
          },
          child: Container(
            height: 50,
            width: 50,
            color: Colors.transparent,
            child: Icon(Icons.search),
          ),
        )
      ],
    );
  }
}
