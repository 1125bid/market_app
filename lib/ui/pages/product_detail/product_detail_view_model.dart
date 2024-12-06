//1. 상태 클래스 만들기-> Product 클래스 사용

//2. 뷰모델 만들기
import 'package:flutter_market_app/data/model/product.dart';
import 'package:flutter_market_app/data/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailViewModel extends AutoDisposeFamilyNotifier<Product?, int> {
  @override
  build(int arg) {
    return null;
  }

  final productRepository = ProductRepository();
//상품상세불러오기
  Future<void> fetchDetail() async {
    state = await productRepository.fetchDetail(arg);
  }

//좋아요
  Future<bool> like() async {
    final newLike = await productRepository.like(arg);
    if (newLike == null) {
      return false;
    }
    state = state?.copyWith(mylike: newLike);
    return true;
  }

//삭제
  Future<bool> delete() async {
    return await productRepository.delete(arg);
  }

  Future<void> createChat() async {
    //TODO 나중에 구현
  }
}

//3. 뷰모델 관리자 만들기
final productDetailViewModel = NotifierProvider.autoDispose
    .family<ProductDetailViewModel, Product?, int>(() {
  return ProductDetailViewModel();
});
