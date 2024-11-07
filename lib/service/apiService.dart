import 'dart:convert';
import 'package:flutter_api/model/Products.dart';
import 'package:flutter_api/model/RespAllProducts.dart';
import 'package:http/http.dart' as http;

/// A service class to handle API interactions for product-related data.
class ApiServices {
  // Base URL for the API endpoint
  final baseurl = "https://dummyjson.com";

  /// Fetches all products from the API and processes the response.
  Future<List<Products>?> getAllProducts() async {
    // Retrieve the API response from the URL and save it in the variable `response`
    final response = await http.get(Uri.parse("$baseurl/products"));



    // Decode the response body to JSON format and save it in the variable `jsonn`
    var jsonn = jsonDecode(response.body);

    /* Status code handling:
     * - Status code 200 - 299: Success
     * - Status code 400 - 499: Client errors (e.g., page not found)
     * - Status code 500 - 599: Server-side issues
     */
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      // Convert the JSON data to a RespAllProducts class object
      RespAllProducts respAllProducts = RespAllProducts.fromJson(jsonn);

      // Retrieve the list of products from the class object and save it in the variable `list`
      var list = respAllProducts.products;

      // You can now use `list` as needed in your application.
      return list;
    }
  }
}
