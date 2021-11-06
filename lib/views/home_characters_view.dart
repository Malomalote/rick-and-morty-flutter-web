import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty/global/enviroment.dart';
import 'package:rick_and_morty/provider/rick_and_morty_provider.dart';
import 'package:rick_and_morty/views/widgets/character_card.dart';
import 'package:rick_and_morty/views/widgets/custom_floatingactionbutton.dart';

class HomeCharactersView extends StatelessWidget {
  const HomeCharactersView({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    final rickProvider = Provider.of<RickAndMortyProvider>(context);

    return SafeArea(
      child: Scaffold(
              backgroundColor: Environment.backgroundColor,
        appBar: AppBar(automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Rick and Morty',style: GoogleFonts.irishGrover(color: Colors.black87,fontSize: 22),),
          backgroundColor: Environment.color1,
        ),
        body: _body(onNextPage:() {rickProvider.loadNextPage();} ),
        floatingActionButton: CustomFloatinActionButton(),
      ),
    );
  }
}

class _body extends StatefulWidget {
  Function onNextPage;
  _body({Key? key,required this.onNextPage}) : super(key: key);

  @override
  __bodyState createState() => __bodyState();
}

class __bodyState extends State<_body> {
     
    ScrollController scrollController = ScrollController();


    @override
    void initState() {
      super.initState();
      //  scrollController = ScrollController(initialScrollOffset: 0);
      scrollController.addListener(() {
       
        if(scrollController.position.pixels>=scrollController.position.maxScrollExtent-200){
          
          widget.onNextPage();
        }
      //  print(scrollController.position.pixels);
      });
    }

    @override
    void dispose() {
      scrollController.dispose();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
     final rickProvider = Provider.of<RickAndMortyProvider>(context);
    final width = MediaQuery.of(context).size.width;

    return (rickProvider.listCharacters.length == 0)
        ? Container(
            height: 400.0,
            child: Center(child: CircularProgressIndicator()))
        : GridView.count(
          controller: scrollController,
            childAspectRatio: 2.5,
            crossAxisCount: (width / 500).round(),
            crossAxisSpacing: 4,
            mainAxisSpacing: 8,
            children: [
              ...rickProvider.listCharacters
                  .map((character) => CharacterCard(character: character)),
            ],
          );
  }
}
