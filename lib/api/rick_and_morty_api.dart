import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/global/enviroment.dart';
import 'package:rick_and_morty/model/rick_and_morty_model.dart';


class RickAndMortApi {
  static int maxCharacterPages=42;
  static int maxCharacters=826;
  //Get page of character (20 characters) 
  //pos between 1 and 42)
  static Future<List<Character>> getPageOfCharacters(int pos) async {

    if(pos>maxCharacterPages || pos<1) return [];
    final uri = '${Environment.apiUrlPaginated}${pos.toString()}';

    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      final results = await jsonDecode(response.body)['results'] as List;

      var valor = results
          .map((characterJson) => Character.fromMap(characterJson))
          .toList();

      return valor;
    } else {
      return [];
    }
  }
  //Get 1 character 
  //pos between 1 and 42)
  static Future<Character?> getCharacter(int pos) async {
    if(pos>maxCharacters || pos<1) return null;
    final uri = '${Environment.apiUrlCharacter}${pos.toString()}';
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {

      final result = Character.fromJson(response.body); 
      return result;
    } else {
      return null;
    }
  }
  // static Future<List<Character>> getMultipleCharacters(List<int> ids) async {
  //   //TODO: Falta esto petará
  //   var uri = Environment.apiUrlCharacter + ids.toString();
  //   var response = await http.get(Uri.parse(uri));
  //   if (response.statusCode == 200) {
  //     final results = await jsonDecode(response.body)['results'] as List;

  //     var valor = results
  //         .map((characterJson) => Character.fromMap(characterJson))
  //         .toList();

  //     return valor;
  //   } else {
  //     return [];
  //   }

  // }



}
