import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/Pw_text_form_field.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/id_text_form_field%20copy.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/nickname_text_form_field%20copy%202.dart';

class JoinPage extends StatefulWidget {
  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  final idController = TextEditingController();
  final pwController = TextEditingController();
  final nicknameController = TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    pwController.dispose();
    nicknameController.dispose();
    super.dispose();
  }

  void onImageUpload() {
    print('onImageUpload');
  }

  void onJoin() {
    print('OnJoin');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Text(
              '안녕하세요!\n아이디와 비밀번호로 가입해주세요.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                onImageUpload();
              },
              child: Container(
                width: 100,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 30,
                    ),
                    SizedBox(height: 2),
                    Text(
                      '프로필 사진',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(height: 20),
            IdTextFormField(controller: idController),
            SizedBox(height: 20),
            PwTextFormField(controller: pwController),
            SizedBox(height: 20),
            NicknameTextFormField(controller: nicknameController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onJoin,
              child: Text('회원가입'),
            )
          ],
        ),
      ),
    );
  }
}
