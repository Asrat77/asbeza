import 'dart:convert';
import 'package:asbeza/models/asbeza.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
//import 'item_model.g.dart';


@JsonSerializable()
class ApiService{

  Future<List?> fetchAsbeza() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    return Asbeza.asbezaList(json.decode(response.body));

  }
}