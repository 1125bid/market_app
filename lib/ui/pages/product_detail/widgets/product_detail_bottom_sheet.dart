import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/chat_detail_page.dart';

class ProductDetailBottomSheet extends StatelessWidget {
  ProductDetailBottomSheet(this.bottomPadding);
  final double bottomPadding;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 50 + bottomPadding,
      child: Column(
        children: [
          Divider(height: 0),
          Expanded(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print('heart 터치됨');
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.transparent,
                    child: Icon(CupertinoIcons.heart),
                  ),
                ),
                VerticalDivider(
                  width: 20,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Text(
                    '100,000원',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ChatDetailPage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      '채팅하기',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
          SizedBox(height: bottomPadding),
        ],
      ),
    );
  }
}
