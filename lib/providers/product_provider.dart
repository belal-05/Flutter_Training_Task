import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';
import '../exceptions/api_exception.dart';

class ProductProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Product> _products = [];
  bool _isLoading = false;
  String? _error;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _products = await _apiService.fetchProducts();
    } on ApiException catch (e) {
      _error = e.message;
    } catch (e) {
      _error = 'Failed to load products!!!';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Product getProductById(int id) {
    return _products.firstWhere((product) => product.id == id);
  }
}
