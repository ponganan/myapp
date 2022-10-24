import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:myapp/constants/api.dart';
import 'package:myapp/models/product.dart';

import '../models/post.dart';

class NetworkService {
  NetworkService._internal();
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;

  static final _dio = Dio();

  Future<List<Product>> getAllProduct() async {
    String url = '${API.BASE_URL}${API.PRODUCT}';
    print(url);
    final Response response = await _dio.get(url);
    if (response.statusCode == 200) {
      return productFromJson(jsonEncode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<List<Post>> fetchPosts(int startIndex, {int limit = 1}) async {
    String url =
        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit';
    final Response response = await _dio.get(url);
    if (response.statusCode == 200) {
      return postFromJson(jsonEncode(response.data));
    }
    throw Exception('Network failed');
  }
}
