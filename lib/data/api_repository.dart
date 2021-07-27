import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:golden_diet/models/products_model.dart';

class ApiRepo {
  final Dio client;

  ApiRepo({required this.client});


  Future<ProductsModel> getProducts() async {
    Response response = await client.get(
      'https://run.mocky.io/v3/188d9248-9464-4241-ba24-e2da025f373e?fbclid=IwAR0IbVcKbSfdZwMfTX0s9vjM-BGP0XvnJJzCqtEZzpX7DrKYRgCL5WKDnyg',
    );
    print(response.data);
    return ProductsModel.fromJson(response.data);
  }
}
