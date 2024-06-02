import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> activeImageGeneration(String nanoId) {
  return http.post(
    Uri.parse('https://www4.aipictors.com/index.php'),
    body: jsonEncode(<String, String>{
      'id': nanoId,
    }),
  );
}
