import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/join/join_page.dart';

class AddressSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            onSubmitted: (value) {
              print('onSubmitted $value');
            },
            decoration: InputDecoration(
                hintText: '동명(읍,면)으로 검색(ex. 서초동)',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4, horizontal: 16)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 10),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('현재위치로 찾기'),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return JoinPage();
                            },
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.transparent,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '부산광역시 동래구 온천동',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
