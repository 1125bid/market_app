import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorHelper {
  static Future<Position?> getPosition() async {
    final permission = await Geolocator.checkPermission();
    //1. 현재 권한이 허용되지 않았을때 권한 요청하기
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      //2. 권한 요청 후 결과가 거부 일때 리턴하기
      final permission2 = await Geolocator.requestPermission();
      if (permission2 == LocationPermission.denied ||
          permission2 == LocationPermission.deniedForever) {
        return null;
      }
    }
    //3. else 실행(Geolocator로 위치 가져와서 리턴)
    final position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100, //m거리마다 값을 갱신해라.
      ),
    );
    return position;
  }
}
