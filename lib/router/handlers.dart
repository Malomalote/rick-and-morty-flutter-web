import 'package:fluro/fluro.dart';
import 'package:rick_and_morty/api/rick_and_morty_api.dart';
import 'package:rick_and_morty/views/character_view.dart';
import 'package:rick_and_morty/views/home_characters_view.dart';
import 'package:rick_and_morty/views/home_view.dart';
import 'package:rick_and_morty/views/no_page_found_view.dart';

class Handlers {
  static Handler home = Handler(handlerFunc: (context, params) {
    return const HomeView();
  });

  static Handler characters = Handler(handlerFunc: (context, params) {
    return const HomeCharactersView();
  });

  static Handler character = Handler(handlerFunc: (context, params) {
    if (params['id']?.first != null) {
      final numCharacter = int.tryParse(params['id']!.first);
      if (numCharacter == null) {
        return CharacterView(id: params['id']!.first);
      } else {
        if (numCharacter < 1 || numCharacter > RickAndMortApi.maxCharacters) {
          return const NoPageFoundView();
        } else {
          return CharacterView(id: params['id']!.first);
        }
      }
    }
    return CharacterView(id: params['id']!.first);
  });
}
