//1. 상태클래스 만들기
import 'package:flutter_market_app/data/model/address.dart';
import 'package:flutter_market_app/data/model/product_summary.dart';
import 'package:flutter_market_app/data/repository/address_repository.dart';
import 'package:flutter_market_app/data/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTabState {
  List<Address> addresses;
  List<ProductSummary> products;

  HomeTabState({required this.addresses, required this.products});
}

//2. 뷰모델 만들기
class HomeTabViewModel extends AutoDisposeNotifier<HomeTabState> {
  @override
  build() {
    fetchAddresses().then((_) {
      fetchProducts();
    });

    return HomeTabState(
      addresses: [],
      products: [],
    );
  }

  final addressRepository = AddressRepository();
  final productRepository = ProductRepository();

  //1. 주소 내동네 list갖고오기
  Future<void> fetchAddresses() async {
    final addresses = await addressRepository.getMyAddressList();
    state = HomeTabState(
      addresses: addresses ?? [],
      products: [],
    );
  }

  //2. 상품 목록 갖고오기=> 내동네 리스트갖고 온 후 불러오기
  Future<void> fetchProducts() async {
    final addresses = state.addresses;
    final target = addresses.where((e) => e.defaultYn ?? false).toList();
    if (target.isEmpty) {
      return;
    }
    final products =
        await productRepository.getProductSummaryList(target.first.id);
    state = HomeTabState(
      addresses: addresses,
      products: products ?? [],
    );
  }
}

//3. 뷰모델 관리자 만들기
final homeTabViewModel =
    NotifierProvider.autoDispose<HomeTabViewModel, HomeTabState>(() {
  return HomeTabViewModel();
});
