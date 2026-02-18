import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://your-railway-url/transcribe';

  static Future<String> transcribe(String path) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl));
    request.files.add(await http.MultipartFile.fromPath('file', path));
    var res = await request.send();
    var respStr = await res.stream.bytesToString();
    var json = jsonDecode(respStr);
    return json['text'] ?? '';
  }
}
