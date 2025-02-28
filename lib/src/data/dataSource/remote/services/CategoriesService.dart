import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class CategoriesService {

  SharedPref sharedPref;
  CategoriesService(this.sharedPref);

  Future<Resource<Category>> create(Category category, File file) async {
    try {      
      // http://172.27.44.131:3000/categories
      Uri url = Uri.http( Apiconfig.API_ECOMMERCE, '/categories');
      String token ="";
      final userSession = await sharedPref.read('user');
      if (userSession != null) {
      AuthResponse authResponse = AuthResponse.fromJson(userSession);
      token = authResponse.token;
      }
      final request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] = token;
      request.files.add(http.MultipartFile(
        'file',
        http.ByteStream(file.openRead().cast()),
        await file.length(),
        filename: basename(file.path),
        contentType: MediaType('image', 'jpg')
        ));
      request.fields['name'] = category.name ?? "";  
      request.fields['description'] = category.description ?? "";  
      final response = await request.send(); 
      final data = json.decode(await response.stream.transform(utf8.decoder).first);
      if(response.statusCode == 200 || response.statusCode == 201){
        Category categoryResponse = Category.fromJson(data);
      return Success(categoryResponse);
      }
      else { // Error
      return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }

  }


  Future<Resource<List<Category>>> getCategories() async{
    try {
      // http://172.27.44.131:3000/categories
      Uri url = Uri.http( Apiconfig.API_ECOMMERCE, '/categories');
      String token ="";
      final userSession = await sharedPref.read('user');
      if (userSession != null) {
      AuthResponse authResponse = AuthResponse.fromJson(userSession);
      token = authResponse.token;
      }
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": token
      };
    
      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);
      if(response.statusCode == 200 || response.statusCode == 201){
        List<Category> categories = Category.fromJsonList(data);
        return Success(categories);
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