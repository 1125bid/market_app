import 'package:flutter_market_app/data/model/product_summary.dart';
import 'package:flutter_market_app/data/repository/base_remote_repository.dart';
//  {
//         "id": 1,
//         "title": "아이폰 팝니다",
//         "thumbnail": {
//           "id": 1,
//           "url": "http://localhost:8080/api/file/0e78ead5-cf18-465b-8f23-c1342a26fa6d",
//           "originName": "sanggoo.jpeg",
//           "contentType": "image/jpeg",
//           "createdAt": "2024-12-05T09:39:32.832Z"
//         },
//         "address": {
//           "id": 1,
//           "fullName": "부산광역시 동래구 온천동",
//           "displayName": "온천동",
//           "defaultYn": true
//         },
//         "price": 10000,
//         "likeCnt": 10000,
//         "updatedAt": "2024-12-05T09:39:32.832Z",
//         "createdAt": "2024-12-05T09:39:32.832Z"
//       }

class ProductRepository extends BaseRemoteRepository {
  Future<List<ProductSummary>?> getProductSummaryList(int addressId) async {
    final response = await client.get(
      '/api/product',
      queryParameters: {
        'addressId': addressId,
        'size': 100,
      },
    );
    if (response.statusCode == 200) {
      final content = response.data['content']['content'];

      return List.from(content).map((e) => ProductSummary.fromJson(e)).toList();
    }
    return null;
  }
}
