import 'package:flutter/material.dart';

class Environment {
  //get first 20  character
  //for get 1 character add the id (number between 1 and 671)
  static String apiUrlCharacter = 'https://rickandmortyapi.com/api/character/';
  //add number of page
  static String apiUrlPaginated =
      'https://rickandmortyapi.com/api/character?page=';

  static Color backgroundColor = const Color(0xF5F5F5ff);
  static Color color1 = const Color(0x607D8Bff);
  static Color color2 = const Color(0xFCE4ECff);
}
