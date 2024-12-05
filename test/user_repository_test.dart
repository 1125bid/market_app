import 'package:flutter_market_app/data/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final userRepo = UserRepository();
  test('UserRepository: login test', () async {
    //

    final result = await userRepo.login(username: '1111', password: '1111');
    expect(result, false);

    final result1 = await userRepo.login(username: 'tester', password: '1111');
    expect(result1, true);
  });
  //닉네임체크
  test('UserRepository: 닉네임체크', () async {
//중복일때
    final result1 = await userRepo.nicknameCk('테스트');
    expect(result1, false);
//사용할 수 있을때!
    final result2 = await userRepo.nicknameCk('테스');
    expect(result2, true);
  });
  //아이디체크
  test('UserRepository: 아이디체크', () async {
    //중복일때
    final result1 = await userRepo.usernameCk('tester');
    expect(result1, false);
//사용할 수 있을때!
    final result2 = await userRepo.usernameCk('qqqq');
    expect(result2, true);
  });

  //회원정보조회체크
  test('UserRepository: 회원정보조회체크', () async {
//조회
    final user = await userRepo.myInfo();
    expect(user == null, true);
//로그인
    await userRepo.login(username: 'tester', password: '1111');
    final user2 = await userRepo.myInfo();
//조회
    expect(user2 == null, false);
    print(user2); //TODO .toJson
  });

  // //회원가입체크
  // test('UserRepository: 회원가입체크', () async{

  // });
}
