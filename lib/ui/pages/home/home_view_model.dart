import 'package:flutter_riverpod/flutter_riverpod.dart';

//1. 상태 클래스 만들기
// 뷰모델의 인덱스만 관리하면 되기때문에 별도의 상태클래스는 필요가 없다.
//2. 뷰모델 만들기
class HomeViewModel extends AutoDisposeNotifier<int> {
  @override
  build() {
    return 0;
  }

  void onIndexChanged(int newIndex) {
    state = newIndex;
  }
}

//3. 뷰모델 관리자(provider)만들기
final homeViewModel = NotifierProvider.autoDispose<HomeViewModel, int>(() {
  return HomeViewModel();
});
