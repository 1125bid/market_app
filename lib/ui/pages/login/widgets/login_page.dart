import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/snack_bar_util.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/pw_text_form_field.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/id_text_form_field%20copy.dart';
import 'package:flutter_market_app/ui/pages/home/home_page.dart';
import 'package:flutter_market_app/ui/pages/login/widgets/login_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                Consumer(builder: (context, ref, child) {
                  return ElevatedButton(
                    onPressed: () async {
                      //validation 성공했을때, 로그인 요청,
                      if (formkey.currentState?.validate() ?? false) {
                        final viewModel = ref.read(loginViewModel);
                        formkey.currentState?.validate();
                        final loginResult = await viewModel.login(
                          username: idController.text,
                          password: pwContorller.text,
                        );
                        if (loginResult) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }),
                            (route) {
                              //기존 네비게이터 스택에 남아있는 페이지들이 하나씩 route라는 인자로 넘어와서
                              //함수가 실행됨
                              //페이지 스택에 남길지 여부 리턴(false 면 안남김)
                              print(route);
                              return false;
                            },
                          );
// 로그인 성공했을때 홈페이지로 이동(모든페이지를 제거 한 뒤 가야함)
                        } else {
                          //login 실패시 스낵바!
                          SnackBarUtil.showSnackBar(
                              context, '아이디와 비밀번호를 확인해주세요.');
                        }
                      }
                    },
                    child: Text('로그인'),
                  );
                })
              ],
            ),
          )),
    );
  }
}
