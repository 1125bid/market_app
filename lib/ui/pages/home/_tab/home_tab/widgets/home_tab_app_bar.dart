import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/snack_bar_util.dart';
import 'package:flutter_market_app/ui/pages/home/_tab/home_tab/home_tab_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTabAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //bottom 속성 사용불가.=>scafold 의 appBar에서 사용가능.
    return AppBar(
      title: Consumer(builder: (context, ref, child) {
        final homeTabState = ref.watch(homeTabViewModel);
        final target =
            homeTabState.addresses.where((e) => e.defaultYn ?? false).toList();
        final addr = target.isEmpty ? '' : target.first.displayName;
        return Text(
          addr,
          style: TextStyle(
              // fontSize:
              ),
        );
      }),
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
