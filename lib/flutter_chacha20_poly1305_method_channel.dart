import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_chacha20_poly1305_platform_interface.dart';

/// An implementation of [FlutterChacha20Poly1305Platform] that uses method channels.
class MethodChannelFlutterChacha20Poly1305
    extends FlutterChacha20Poly1305Platform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_chacha20_poly1305');

  @override
  Future<Map?> encrypt(List<int> data, List<int> key) async {
    final plainData = asUint8List(data);
    final keyData = asUint8List(key);
    final encryptedObj = await methodChannel
        .invokeMethod<Map>('encrypt', {'data': plainData, 'key': keyData});
    return encryptedObj;
  }

  /// key must be in base64 or hex encoding string depending on keyEncoding, outputEncoding should be in "base64" or "hex"
  @override
  Future<Map?> encryptString(String string, String key, String keyEncoding,
      String outputEncoding) async {
    final encryptedObj =
        await methodChannel.invokeMethod<Map>('encryptString', {
      'string': string,
      'key': key,
      'keyEncoding': keyEncoding,
      'outputEncoding': outputEncoding
    });
    return encryptedObj;
  }

  @override
  Future<List<int>?> decrypt(List<int> encrypted, List<int> key,
      List<int> nonce, List<int> tag) async {
    final encryptedData = asUint8List(encrypted);
    final keyData = asUint8List(key);
    final nonceData = asUint8List(nonce);
    final tagData = asUint8List(tag);
    final decrypted = await methodChannel.invokeMethod<List<int>>('decrypt', {
      'encrypted': encryptedData,
      'key': keyData,
      'nonce': nonceData,
      'tag': tagData
    });
    return decrypted;
  }

  /// this method takes inputs in base64 or hex encoding string depending on inputEncoding
  @override
  Future<String?> decryptString(String inputEncoding, String encryptedString,
      String key, String nonce, String tag) async {
    final encryptedObj =
        await methodChannel.invokeMethod<String>('decryptString', {
      'inputEncoding': inputEncoding,
      'encryptedString': encryptedString,
      'key': key,
      'nonce': nonce,
      'tag': tag
    });
    return encryptedObj;
  }
}

/// List<int> must be converted to Unit8List before passing to native
Uint8List asUint8List(List<int> bytes) {
  return (bytes is Uint8List && bytes.runtimeType == Uint8List)
      ? bytes
      : Uint8List.fromList(bytes);
}
