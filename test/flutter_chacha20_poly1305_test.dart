import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_chacha20_poly1305/flutter_chacha20_poly1305_platform_interface.dart';
import 'package:flutter_chacha20_poly1305/flutter_chacha20_poly1305_method_channel.dart';

class MockFlutterChacha20Poly1305Platform
    implements FlutterChacha20Poly1305Platform {
  @override
  Future<Map?> encrypt(List<int> data, List<int> key) => Future.value(null);

  @override
  Future<Map?> encryptString(String string, String key, String keyEncoding,
          String outputEncoding) =>
      Future.value(null);

  @override
  Future<List<int>?> decrypt(
          List<int> encrypted, List<int> key, List<int> nonce, List<int> tag) =>
      Future.value([42]);

  @override
  Future<String?> decryptString(String inputEncoding, String encryptedString,
          String key, String nonce, String tag) =>
      Future.value(null);
}

void main() {
  final FlutterChacha20Poly1305Platform initialPlatform =
      FlutterChacha20Poly1305Platform.instance;

  test('$MethodChannelFlutterChacha20Poly1305 is the default instance', () {
    expect(
        initialPlatform, isInstanceOf<MethodChannelFlutterChacha20Poly1305>());
  });
}
