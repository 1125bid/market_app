import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/chat_detail_recieve_item.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/chat_detail_send_item.dart';

class ChatDetailListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final children = [
      ChatDetailReceiveItem(
        imgUrl: 'https://picsum.photos/id/237/200/300',
        showProfile: true,
        content: '안녕하세요.',
        dateTime: DateTime.now(),
      ),
      ChatDetailReceiveItem(
        imgUrl: 'https://picsum.photos/id/237/200/300',
        showProfile: false,
        content: '네고 가능한가요?',
        dateTime: DateTime.now(),
      ),
      ChatDetailSendItem(
        content: '안녕하세요.',
        dateTime: DateTime.now(),
      ),
      ChatDetailSendItem(
        content: '네고 안돼요.',
        dateTime: DateTime.now(),
      ),
    ];

    return Expanded(
        child: ListView.separated(
      itemCount: children.length,
      itemBuilder: (context, index) {
        return children[index];
      },
      separatorBuilder: (context, index) => SizedBox(height: 4),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    ));
  }
}
