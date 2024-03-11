import 'package:comic_book/models/remote/detail/comic_detail_response.dart';
import 'package:comic_book/utils/constants.dart';
import 'package:dio/dio.dart';

class IssueDetailRemote {
  static Future<ComicDetailResponse?> getApiResponse(String url) async {
    try {
      Response response = await Dio().get(url);

      if (response.statusCode == 200) {
        return ComicDetailResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<ComicDetailResponse?> getIssueDetail(String apiDetailUrl) {
    String url = '$apiDetailUrl?api_key=${MyConstants.apiKey}&format=json';
    return getApiResponse(url);
  }
}
