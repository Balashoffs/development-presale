import 'dart:convert';
import 'dart:typed_data';

Uint8List xorWithKey(Uint8List data, int key) {
  Uint8List result = Uint8List(data.length);
  for (int i = 0; i < data.length; i++) {
    result[i] = data[i] ^ key;
  }
  return result;
}

Uint8List toXorBytes(Map<String, dynamic> map, int key) {
  String jsonStr = json.encode(map);
  final jsonBytes = utf8.encode(jsonStr);
  final resultBytes = base64Decode(base64Encode(jsonBytes));
  return xorWithKey(resultBytes, key);
}

Map<String, dynamic> fromXorByte(Uint8List bytes, int key) {
  final decodedBytes = xorWithKey(bytes, key);
  final resultBytes = base64Decode(base64Encode(decodedBytes));
  final jsonBytes = utf8.decode(resultBytes);
  return json.decode(jsonBytes);
}

int stringToInt(String str) {
  List<int> bytes = utf8.encode(str);
  int result = 0;
  for (int i = 0; i < bytes.length; i++) {
    result |= (bytes[i] << (i * 8));
  }
  return result;
}
