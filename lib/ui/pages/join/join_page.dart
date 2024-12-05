import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/image_picker_helper.dart';
import 'package:flutter_market_app/core/snack_bar_util.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/pw_text_form_field.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/id_text_form_field%20copy.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/nickname_text_form_field%20copy%202.dart';
import 'package:flutter_market_app/ui/pages/join/join_view_model.dart';
import 'package:flutter_market_app/ui/pages/welcome/welcome_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class JoinPage extends ConsumerStatefulWidget {
  JoinPage(this.address);
  final String address;
  @override
  ConsumerState<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends ConsumerState<JoinPage> {
  final idController = TextEditingController();
  final pwController = TextEditingController();
  final nicknameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    idController.dispose();
    pwController.dispose();
    nicknameController.dispose();
    super.dispose();
  }

  void onImageUpload() async {
    final result = await ImagePickerHelper.pickImage();
    if (result != null) {
      final viewModel = ref.read(joinViewModel.notifier);
      viewModel.uploadImage(
        filename: result.filename,
        mimeType: result.mimeType,
        bytes: result.bytes,
      );
    }
  }

  void onJoin() async {
    if (formKey.currentState?.validate() ?? false) {
      final viewModel = ref.read(joinViewModel.notifier);

      final validateResult = await viewModel.validateName(
        username: idController.text,
        nickname: nicknameController.text,
      );

      if (validateResult != null) {
        SnackBarUtil.showSnackBar(context, validateResult);
        return;
      }

      final result = await viewModel.join(
        username: idController.text,
        password: pwController.text,
        nickname: nicknameController.text,
        addressFullName: widget.address,
      );
      if (result) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) {
              return WelcomePage();
            },
          ),
          (route) {
            return false;
          },
        );
      } else {
        SnackBarUtil.showSnackBar(context, '회원가입에 실패하였습니다.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final fileModel = ref.watch(joinViewModel);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formKey,
          child: ListView(
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
                child: Align(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: fileModel != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(fileModel.url),
                          )
                        : Column(
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
      ),
    );
  }
}
