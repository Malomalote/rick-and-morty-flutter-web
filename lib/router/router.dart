import 'package:fluro/fluro.dart';
import 'package:rick_and_morty/router/handlers.dart';
import 'package:rick_and_morty/router/no_page_found_handler.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String homeRoute = '/';
  //Auth router
  static String charactersRoute = '/characters';
  static String characterRoute = '/character/:id';

  static void configureRoutes() {
    //Auth router
    router.define(homeRoute,
        handler: Handlers.home, transitionType: TransitionType.none);
    router.define(charactersRoute,
        handler: Handlers.characters, transitionType: TransitionType.none);
    router.define(characterRoute,
        handler: Handlers.character, transitionType: TransitionType.fadeIn);

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
