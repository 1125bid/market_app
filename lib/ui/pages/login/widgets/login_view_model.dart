//1. 상태 클라스 만들기=> 상태가 없어서 안만듬

//2. 뷰모델 만들기=> 일반클라스로 만들기
import 'package:flutter_market_app/data/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel {
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    final userRepoitory = UserRepository();
    return await userRepoitory.login(
      username: username,
      password: password,
    );
  }
}

//3. 뷰모델 관리자 만들기
final loginViewModel = Provider.autoDispose(
  (ref) => LoginViewModel(),
);
