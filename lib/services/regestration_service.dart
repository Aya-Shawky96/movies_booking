import 'package:dio/dio.dart';
import '../models/auth_model.dart';

class RegistrationServices {
  static Dio dio = Dio();

  static Future<AuthModel> loginData({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "https://librarysystemflutterteam.runasp.net/api/Registration/SignIn",
        data: {"Email": email, "Password": password},
      );
      return AuthModel.fromJSon(response.data);
    } on DioException catch (dioError) {
      throw Exception("dio related error: ${dioError.message}");
    } catch (error) {
      throw Exception("other related error: ${error.toString()}");
    }
  }

  static Future<AuthModel> signUpData({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    try {
      Response response = await dio.post(
        "https://librarysystemflutterteam.runasp.net/api/Registration/SignUp",
        data: {
          "email": email,
          "password": password,
          "phoneNumber": phone,
          "name": name,
        },
      );
      return AuthModel.fromJSon(response.data);
    } on DioException catch (dioError) {
      throw Exception("dio related error: ${dioError.message}");
    } catch (error) {
      throw Exception("other related error: ${error.toString()}");
    }
  }
}
