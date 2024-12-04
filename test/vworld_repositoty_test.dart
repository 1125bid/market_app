import 'package:flutter_market_app/data/repository/vworld_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final vworldRepo = VWorldRepository();

  test('VworldRepository: findByName test', () async {
    final result = await vworldRepo.findByName('잠원동');
    expect(result.isEmpty, false);
    final result2 = await vworldRepo.findByName('asd동');
    expect(result2.isEmpty, true);
  });
  test('VworldRepository: findByLatLng test', () async {
    // 37.5081687
    final result = await vworldRepo.findByLatLng(37.5081687, 127.0036319);
    print(result);
    expect(result.isEmpty, false);
    final result2 = await vworldRepo.findByLatLng(31.5081687, 127.0036319);
    expect(result2.isEmpty, true);
  });
}
