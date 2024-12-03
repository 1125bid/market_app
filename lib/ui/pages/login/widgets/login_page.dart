import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/pw_text_form_field.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/id_text_form_field%20copy.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final idController = TextEditingController();
  final pwContorller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    idController.dispose();
    pwContorller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formkey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                Text(
                  '안녕하세요!\n 아이디와 비밀번호를 입력해주세요.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                IdTextFormField(controller: idController),
                SizedBox(height: 20),
                PwTextFormField(controller: pwContorller),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    formkey.currentState?.validate();
                  },
                  child: Text('로그인'),
                )
              ],
            ),
          )),
    );
  }
}
