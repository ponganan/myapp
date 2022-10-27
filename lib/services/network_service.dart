import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:myapp/constants/api.dart';
import 'package:myapp/models/product.dart';
import 'package:http_parser/http_parser.dart';

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

  Future<String> addProduct(File imageFile, Product product) async {
    String url = '${API.BASE_URL}${API.PRODUCT}';

    FormData data = FormData.fromMap({
      'name': product.name,
      'price': product.price,
      'stock': product.stock,
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(imageFile.path,
            contentType: MediaType('image', 'jpg'))
    });
    final Response response = await _dio.post(url, data: data);
    if (response.statusCode == 201) {
      return 'Add Product OK';
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
