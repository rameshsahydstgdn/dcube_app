import 'dart:io';

import 'package:dcube_app/model/word_response.dart';
import 'package:dcube_app/service/http_service.dart';

class WordRepository {
  Future<List<WordResponse>?> getWordsFromDictionary(String query) async {
    try {
      final response = await HttpService.getRequest("en_US/$query");

      if (response.statusCode == 200) {
        final result = wordResponseFromJson(response.body);
        return result;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }
  }
}
