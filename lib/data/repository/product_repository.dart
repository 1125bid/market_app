import 'package:flutter_market_app/data/model/product.dart';
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

  Future<Product?> fetchDetail(int productId) async {
    final response = await client.get('/api/product/$productId');
    if (response.statusCode == 200) {
      final content = response.data['content'];
      return Product.fromJson(content);
    }
    return null;
  }

  Future<bool?> like(int productId) async {
    final response = await client.post('/api/product/like/$productId');
    if (response.statusCode == 200) {
      return response.data['content'];
    }
    return null;
  }

  Future<bool> delete(int productId) async {
    final response = await client.delete('/api/product/$productId');
    return response.statusCode == 200;
  }

  //상품등록
// {
//   "title": "아이폰 A급 팝니다",
//   "content": "상태 정말 좋습니다",
//   "imageFileIdList": [
//     1,
//     2
//   ],
//   "categoryId": 1,
//   "price": 1000000
// }
  Future<Product?> create({
    required String title,
    required String content,
    required List<int> imageFileIdList,
    required int categoryId,
    required int price,
  }) async {
    //
    final response = await client.post('/api/product', data: {
      'title': title,
      'content': content,
      'imageFileIdList': imageFileIdList,
      'categoryId': categoryId,
      'price': price,
    });
    if (response.statusCode == 201) {
      return Product.fromJson(response.data['content']);
    }
    return null;
  }

  //상품수정
//   {
//   "id": 1,
//   "title": "아이폰 A급 팝니다",
//   "content": "상태 정말 좋습니다",
//   "imageFileIdList": [
//     1,
//     2
//   ],
//   "categoryId": 1,
//   "price": 1000000
// }
  Future<bool> update({
    required int id,
    required String title,
    required String content,
    required List<int> imageFileIdList,
    required int categoryId,
    required int price,
  }) async {
    //
    final response = await client.put('/api/product', data: {
      'id': id,
      'title': title,
      'content': content,
      'imageFileIdList': imageFileIdList,
      'categoryId': categoryId,
      'price': price,
    });
    return response.statusCode == 200;
  }
}
