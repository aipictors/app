import 'dart:convert';

import 'package:http/http.dart' as http;

class SafeJsonHttpClient extends http.BaseClient {
  SafeJsonHttpClient(this._inner);

  static const Duration _timeout = Duration(seconds: 20);

  final http.Client _inner;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final streamed = await _inner.send(request).timeout(_timeout);

    // Buffer the response so we can inspect/replace it.
    final bytes = await http.ByteStream(streamed.stream).toBytes().timeout(_timeout);

    final contentType = (streamed.headers['content-type'] ?? '').toLowerCase();
    final bodyText = utf8.decode(bytes, allowMalformed: true).trimLeft();
    final looksJson =
        contentType.contains('application/json') || bodyText.startsWith('{') || bodyText.startsWith('[');

    if (looksJson) {
      return http.StreamedResponse(
        http.ByteStream(Stream.value(bytes)),
        streamed.statusCode,
        contentLength: bytes.length,
        request: streamed.request,
        headers: streamed.headers,
        isRedirect: streamed.isRedirect,
        persistentConnection: streamed.persistentConnection,
        reasonPhrase: streamed.reasonPhrase,
      );
    }

    // Convert non-JSON responses (e.g. plain-text 404/502 HTML) into GraphQL-shaped JSON.
    final snippet = bodyText.isEmpty
        ? '(empty response)'
        : (bodyText.length > 200 ? bodyText.substring(0, 200) : bodyText);

    final replacement = jsonEncode({
      'errors': [
        {
          'message': 'Non-JSON response from server (${streamed.statusCode}). ${snippet.replaceAll('\n', ' ')}',
        }
      ],
      'data': null,
    });

    final replacementBytes = utf8.encode(replacement);

    final newHeaders = Map<String, String>.from(streamed.headers);
    newHeaders['content-type'] = 'application/json; charset=utf-8';

    return http.StreamedResponse(
      http.ByteStream(Stream.value(replacementBytes)),
      200,
      contentLength: replacementBytes.length,
      request: streamed.request,
      headers: newHeaders,
      isRedirect: false,
      persistentConnection: streamed.persistentConnection,
      reasonPhrase: 'OK',
    );
  }

  @override
  void close() {
    _inner.close();
    super.close();
  }
}
