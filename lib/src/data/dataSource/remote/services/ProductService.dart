import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class ProductsService {

  SharedPref sharedPref;

  ProductsService(this.sharedPref);

  Future<Resource<Product>> create(Product product, List<File> files) async {
    try {      
      // http://172.27.44.141:3000/categories
      Uri url = Uri.http( Apiconfig.API_ECOMMERCE, '/products');
      String token ="";
      final userSession = await sharedPref.read('user');
      if (userSession != null) {
        AuthResponse authResponse = AuthResponse.fromJson(userSession);
        token = authResponse.token;
      }
      final request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] = token;

      files.forEach ((file) async {
        request.files.add(http.MultipartFile(
        'files[]',
        http.ByteStream(file.openRead().cast()),
        await file.length(),
        filename: basename(file.path),
        contentType: MediaType('image', 'jpg')
        ));

      });


      request.fields['name'] = product.name;  
      request.fields['description'] = product.description;  
      request.fields['price'] = product.price.toString();  
      request.fields['id_category'] = product.idCategory.toString();
      final response = await request.send(); 
      final data = json.decode(await response.stream.transform(utf8.decoder).first);
      if(response.statusCode == 200 || response.statusCode == 201){
        Product productResponse = Product.fromJson(data);
      return Success(productResponse);
      }
      else { // Error
      return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }

  }
}