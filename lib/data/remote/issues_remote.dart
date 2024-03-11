import 'package:comic_book/models/remote/issues/comic_list_response.dart';
import 'package:comic_book/utils/constants.dart';
import 'package:dio/dio.dart';

class IssuesRemote {
  static Future<ComicListResponse?> getApiResponse(String url) async {
    try {
      Response response = await Dio().get(url);

      if (response.statusCode == 200) {
        return ComicListResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<ComicListResponse?> getIssues(String nameToFilter) {
    String url = '${MyConstants.baseUrl}/issues/?&filter=name:$nameToFilter&api_key=${MyConstants.apiKey}&format=json&sort=cover_date:desc';
    return getApiResponse(url);
  }
}
