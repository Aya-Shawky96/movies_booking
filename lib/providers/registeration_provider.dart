import 'package:flutter/material.dart';
import '../models/auth_model.dart';
import '../services/regestration_service.dart';

class RegistrationProvider extends ChangeNotifier {
  AuthModel? registrationModel;

  Future<void> loginDataProvider({required String email, required String password}) async {
    registrationModel =
        await RegistrationServices.loginData(email: email, password: password);
    notifyListeners();
  }

  Future<void> signUpDataProvider(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    registrationModel = await RegistrationServices.signUpData(
        email: email, password: password, name: name, phone: phone);
    notifyListeners();
  }
}
