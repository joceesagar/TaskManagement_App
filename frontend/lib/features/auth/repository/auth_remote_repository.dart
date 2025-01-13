//auth_remote_repository - so that we can talk to the external backend apis that we have created
//local repository - that will help us in buidling offline first app

import 'dart:convert';
import 'package:frontend/core/constants/constants.dart';
import 'package:frontend/models/user_models.dart';
import 'package:http/http.dart' as http;

class AuthRemoteRepository {
  Future<UserModels> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final res = await http.post(
        Uri.parse('${Constants.backendUri}/auth/signup'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      // Handle non-201 status codes
      if (res.statusCode != 201) {
        final errorMsg = jsonDecode(res.body)['message'];
        throw errorMsg;
      }

      // Ensure that the response body can be properly parsed into UserModels
      final user = UserModels.fromJson(res.body);
      return user;
    } catch (e) {
      throw e.toString();
    }
  }
}


  // Future<void> login() {}

