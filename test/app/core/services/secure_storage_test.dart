import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hellotransaction/app/core/services/secure_storage.dart';
import 'package:mocktail/mocktail.dart';

class FlutterSecureStorageMock extends Mock implements FlutterSecureStorage {}

void main() {
  group('teste SecureStorage', () {
    late final SecureStorage storage;
    late final FlutterSecureStorage secure;

    setUpAll(() {
      secure = FlutterSecureStorageMock();
      storage = SecureStorageImpl(secure);
    });

    test('readAll() should me return Map<String,dynamic>', () async {
      final expectedData = {'key1': 'value1', 'key2': 'value2'};
      when(() => secure.readAll()).thenAnswer((_) async => expectedData);
      final result = await storage.readAll();
      expect(result, equals(expectedData));
    });
    test('read() should return the value for a given key', () async {
      const key = 'my_key';
      const expectedValue = 'my_value';
      when(() => secure.read(key: key)).thenAnswer((_) async => expectedValue);
      final result = await storage.read(key);
      expect(result, equals(expectedValue));
    });
    test('write() should return the value for a given key', () async {
      const key = 'my_key';
      const expectedValue = 'my_value';
      when(() => secure.write(key: key, value: expectedValue))
          .thenAnswer((_) async => expectedValue);
      final result = await storage.write(key, expectedValue);
      verify(() => secure.write(key: key, value: expectedValue)).called(1);
    });
    test('delete() should return the value for a given key', () async {
      const key = 'my_key';
      when(() => secure.delete(key: key)).thenAnswer((_) => Future.value());
      await storage.delete(key);

      verify(() => secure.delete(key: key)).called(1);
    });
  });
}
