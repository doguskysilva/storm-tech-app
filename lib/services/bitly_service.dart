import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class BitLyRequests {
  String _token = 'cdb6443d719d381dd39a0ba2ceada889a328d5bb';

  BitLyRequests();

  Future<String> fetchShortLink(String url) async {
    Map data = {
      "group_guid": "BkavictR2FF",
      "domain": "bit.ly",
      "long_url": url
    };

    final response = await http.post('https://api-ssl.bitly.com/v4/shorten',
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $_token",
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: json.encode(data));
    final responseJson = jsonDecode(response.body);

    return responseJson['link'];
  }
}
