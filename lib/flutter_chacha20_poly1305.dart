import 'flutter_chacha20_poly1305_platform_interface.dart';

class FlutterChacha20Poly1305 {
  static Future<Map?> encrypt(List<int> data, List<int> key) {
    /// this will call to native platform
    return FlutterChacha20Poly1305Platform.instance.encrypt(data, key);
  }

  static Future<Map?> encryptString(
      String string, String key, String keyEncoding, String outputEncoding) {
    /// this will call to native platform
    return FlutterChacha20Poly1305Platform.instance
        .encryptString(string, key, keyEncoding, outputEncoding);
  }

  static Future<List<int>?> decrypt(
      List<int> encrypted, List<int> key, List<int> nonce, List<int> tag) {
    /// this will call to native platform
    return FlutterChacha20Poly1305Platform.instance
        .decrypt(encrypted, key, nonce, tag);
  }

  static Future<String?> decryptString(String inputEncoding,
      String encryptedString, String key, String nonce, String tag) {
    /// this will call to native platform
    return FlutterChacha20Poly1305Platform.instance
        .decryptString(inputEncoding, encryptedString, key, nonce, tag);
  }
}
