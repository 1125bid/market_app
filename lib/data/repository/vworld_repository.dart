import 'package:dio/dio.dart';

class VWorldRepository {
  final Dio _client = Dio(BaseOptions(
    //설정 안할 시 실패 응답오면 throw 던져서 에러남,
    validateStatus: (status) => true,
  ));

  //1. 이름으로 검색하는 기능

  Future<List<String>> findByName(String query) async {
    //     https://api.vworld.kr/req/search
// request=search
// key=BDE9EB0E-B8BF-379E-9FEF-A6330689A01E
// query=잠원동
// type=DISTRICT
// category=L4
    try {
      final response = await _client
          .get('https://api.vworld.kr/req/search', queryParameters: {
        'request': 'search',
        'key': 'BDE9EB0E-B8BF-379E-9FEF-A6330689A01E',
        'query': query,
        'type': 'DISTRICT',
        'category': 'L4'
      });
      if (response.statusCode == 200 &&
          response.data['response']['status'] == 'OK') {
//response>result>items>>title
        final items = response.data['response']['result']['items'];
        final itemList = List.from(items);
        final iterable = itemList.map((item) {
          // print('${item['title']}');
          return '${item['title']}';
        });
        return iterable.toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
    // response.statusCode;
    // response.data;
  }

  //2. 위도&경도로 검색하는 기능

  //Response>result>featureCollection>features>>properties>full_nm
  Future<List<String>> findByLatLng(double lat, double lng) async {
//     요청 url: https://api.vworld.kr/req/data
// request=GetFeature
// key=BDE9EB0E-B8BF-379E-9FEF-A6330689A01E
// data=LT_C_ADEMD_INFO
// geomFilter=POINT(127.0036319 37.5081687)
// geometry=false
// size=100
    try {
      final response =
          await _client.get('https://api.vworld.kr/req/data', queryParameters: {
        'request': 'GetFeature',
        'key': 'BDE9EB0E-B8BF-379E-9FEF-A6330689A01E',
        'data': 'LT_C_ADEMD_INFO',
        'geomFilter': 'POINT($lng $lat)',
        'geometry': false,
        'size': 100,
      });
      if (response.statusCode == 200 &&
          response.data['response']['status'] == 'OK') {
        //Response>result>features>>properties>full_nm
        final features = response.data['response']['result']
            ['featureCollection']['features'];
        final featureList = List.from(features);
        final iterable = featureList.map((feat) {
          return '${feat['properties']['full_nm']}';
        });
        return iterable.toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
