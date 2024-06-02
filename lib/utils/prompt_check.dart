import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map> promptCheck(String prompt, String negativePrompt, String modelName,
    String userId) async {
  Map<String, String> body = {
    'prompts': prompt,
    'negative': negativePrompt,
    'model': modelName,
    'user_id': userId,
  };
  final http.MultipartRequest request = http.MultipartRequest('POST',
      Uri.parse('https://internal.api.aipictors.com/prompts/check/index.php'))
    ..fields.addAll(body);
  final http.StreamedResponse response = await request.send();
  final String responseText = await response.stream.bytesToString();
  return json.decode(responseText);
}
