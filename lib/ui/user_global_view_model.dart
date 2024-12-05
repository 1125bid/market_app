//1. 상태생성=>user 클래스 사용
//2. 뷰모델 생성
import 'package:flutter_market_app/data/model/user.dart';
import 'package:flutter_market_app/data/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserGlobalViewModel extends Notifier<User?> {
  @override
  User? build() {
    fetchUserInfo();
    return null;
  }

  final userRepository = UserRepository();

  Future<void> fetchUserInfo() async {
    final user = await userRepository.myInfo();
    state = user;
  }
}

//3.  관리자 생성
final userGlobalViewModel = NotifierProvider<UserGlobalViewModel, User?>(
  () {
    return UserGlobalViewModel();
  },
);
