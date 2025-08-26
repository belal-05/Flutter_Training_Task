// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_app_task/widgets/error_bottomsheet.dart';
import '../models/login_request.dart';
import '../services/api_service.dart';
import '../exceptions/api_exception.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool isLoggedIn = false;
  bool isLoading = false;

  String? _userEmail;
  String? get userEmail => _userEmail;

  Future<void> login(LoginRequest request, BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final token = await _apiService.login(request.toJson());
      if (token.isNotEmpty) {
        isLoggedIn = true;
        _userEmail = request.email;
      } else {
        isLoggedIn = false;
        ErrorBottomSheet.show(context, 401);
      }
    } on ApiException catch (e) {
      ErrorBottomSheet.show(context, e.statusCode);
      isLoggedIn = false;
    } catch (e) {
      ErrorBottomSheet.show(context, 0);
      isLoggedIn = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
    isLoggedIn = false;
    _userEmail = null;
    notifyListeners();
  }
}
