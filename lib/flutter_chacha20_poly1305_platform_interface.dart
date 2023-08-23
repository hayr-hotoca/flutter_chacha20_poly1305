import 'flutter_chacha20_poly1305_method_channel.dart';

abstract class FlutterChacha20Poly1305Platform {
  static FlutterChacha20Poly1305Platform instance =
      MethodChannelFlutterChacha20Poly1305();

  Future<Map?> encrypt(List<int> data, List<int> key) {
    throw UnimplementedError('encrypt() has not been implemented.');
  }

  Future<Map?> encryptString(
      String string, String key, String keyEncoding, String outputEncoding) {
    throw UnimplementedError('encryptString() has not been implemented.');
  }

  Future<List<int>?> decrypt(
      List<int> encrypted, List<int> key, List<int> nonce, List<int> tag) {
    throw UnimplementedError('decrypt() has not been implemented.');
  }

  Future<String?> decryptString(String inputEncoding, String encryptedString,
      String key, String nonce, String tag) {
    throw UnimplementedError('decryptString() has not been implemented.');
  }
}
