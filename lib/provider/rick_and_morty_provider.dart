import 'dart:io';

import 'package:flutter/material.dart';

import 'package:rick_and_morty/api/rick_and_morty_api.dart';
import 'package:rick_and_morty/model/rick_and_morty_model.dart';

class RickAndMortyProvider extends ChangeNotifier {
  List<Character> listCharacters = [];
  Character? selectedCharacter;
  int lastPage = 0;
  bool isWeb = false;
  bool canLoadPage = true;

  RickAndMortyProvider() {
    initCharacters();
    lastPage = 1;

    //from https://stackoverflow.com/questions/58459483/unsupported-operation-platform-operatingsystem

    try {
      if (Platform.isAndroid || Platform.isIOS) {
        isWeb = false;
      } else {
        isWeb = true;
      }
    } catch (e) {
      isWeb = true;
    }

    if (isWeb) {
      getPageOfCharacters(2);
      getPageOfCharacters(3);
      lastPage = 3;
    }
  }

  initCharacters() async {
    listCharacters = await RickAndMortApi.getPageOfCharacters(1);
    notifyListeners();
  }

  getPageOfCharacters(int pos) async {
    final newList = await RickAndMortApi.getPageOfCharacters(pos);
    for (var newCharacter in newList) {
      if (!listCharacters.contains(newCharacter)) {
        listCharacters.add(newCharacter);
      }
    }
    notifyListeners();
  }

  // getMultipleCharacters(List<int> ids) async {
  //   final newList = await RickAndMortApi.getMultipleCharacters(ids);
  //   for (var newCharacter in newList) {
  //     if (!listCharacters.contains(newCharacter)) {
  //       listCharacters.add(newCharacter);
  //     }
  //   }
  //   notifyListeners();
  // }

  Character? getCharacter(int id){
    getSingleCharacter(id);
   Future.delayed(Duration.zero,() async =>  notifyListeners());
    return selectedCharacter;
    
  }
  getSingleCharacter(int id) async {
    if(id<1 || id>RickAndMortApi.maxCharacters) return null;
    bool existCharacter = false;
    for (var element in listCharacters) {
      if (element.id == id) {
        existCharacter = true;
        selectedCharacter = element;
        return element;
      }
    }
    if (!existCharacter) {
      selectedCharacter = await RickAndMortApi.getCharacter(id);
      return selectedCharacter;
    }
  }

  void loadNextPage() {
    if (lastPage < RickAndMortApi.maxCharacterPages) {
      lastPage++;
      getPageOfCharacters(lastPage);

      notifyListeners();
    }
  }
}
