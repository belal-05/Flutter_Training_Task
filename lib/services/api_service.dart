import 'dart:convert';
import 'package:flutter_app_task/models/product.dart';
import 'package:http/http.dart' as http;
import '../exceptions/api_exception.dart';

class ApiService {
  static const loginUrl = "https://api.escuelajs.co/api/v1/auth/login";
  static const productUrl = "https://dummyjson.com/products";

  Future<String> login(Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      if (data['access_token'] != null) {
        return data['access_token'];
      } else {
        throw ApiException(response.statusCode, 'Invalid login response');
      }
    } else {
      throw ApiException(response.statusCode, 'Login failed');
    }
  }


  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(productUrl));
    
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = json.decode(response.body);
      final productJson = data['products'] as List<dynamic>;
      return productJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw ApiException(response.statusCode, 'Failed to load products!!');
    }
  }
}
