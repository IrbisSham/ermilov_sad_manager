import 'api_helpers/api_base_helper.dart';

class RestApiHandlerData {
  static final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  static getData(String path) async {
    final response = await _apiBaseHelper.get(path);
    return response;
  }

  static postData(String path, dynamic body) async {
    final response = await _apiBaseHelper.post(path, body);
    return response;
  }
}
