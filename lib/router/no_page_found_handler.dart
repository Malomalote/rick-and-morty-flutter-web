import 'package:fluro/fluro.dart';
import 'package:rick_and_morty/views/no_page_found_view.dart';

class NoPageFoundHandlers{

    static Handler noPageFound=Handler(handlerFunc: (context,params){
      return const NoPageFoundView();
    });
}