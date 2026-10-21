import 'package:flutter/material.dart';
import 'auth_state.dart';
import '../../data/repositories/auth_repository_impl.dart';

class AuthController extends ChangeNotifier {
  final AuthRepositoryImpl repository;
  AuthState _state = const AuthState();

  AuthController({AuthRepositoryImpl? repository})
      : repository = repository ?? AuthRepositoryImpl();

  AuthState get state => _state;

  Future<void> login(String email, String password) async {
    _state = _state.copyWith(isLoading: true, error: null);
    notifyListeners();
    try {
      final res = await repository.login(email, password);
      _state = _state.copyWith(isLoading: false, user: res.user);
    } catch (e) {
      _state = _state.copyWith(isLoading: false, error: e.toString());
    }
    notifyListeners();
  }
}
