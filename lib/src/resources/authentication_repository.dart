import 'package:ermilov_sad_manager/api_constants.dart';
import 'package:ermilov_sad_manager/src/rest/rest_api_handler_data.dart';

class AuthenticationRepository {

  Future<dynamic> signUpWithEmailAndPassword(
      String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // simulate a network delay
    final response = await RestApiHandlerData.postData(
        '${restApiConstants["auth"]}/register', {'email': email, 'password': password});
    return response;
  }

  Future<dynamic> loginWithEmailAndPassword(
      String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // simulate a network delay
    final response = await RestApiHandlerData.postData(
        '${restApiConstants["auth"]}/login', {'email': email, 'password': password});

    return response;
  }

  Future<dynamic> getUserData(int id) async {
    final response = await RestApiHandlerData.getData('${restApiConstants["auth"]}/users/$id');

    return response;
  }

}
