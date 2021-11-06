import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty/api/rick_and_morty_api.dart';
import 'package:rick_and_morty/global/enviroment.dart';
import 'package:rick_and_morty/model/rick_and_morty_model.dart';
import 'package:rick_and_morty/provider/rick_and_morty_provider.dart';
import 'package:rick_and_morty/router/router.dart';
import 'package:rick_and_morty/services/navigation_service.dart';

class CharacterView extends StatefulWidget {
  final String id;
  const CharacterView({Key? key, required this.id}) : super(key: key);

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  @override
  Widget build(BuildContext context) {
    final rickProvider = Provider.of<RickAndMortyProvider>(context);
    final character = rickProvider.getCharacter(int.parse(widget.id));

    return(character == null)
        ? Container(
            height: 400.0, child: Center(child: CircularProgressIndicator()))
        : SafeArea(
      child: Scaffold(
          backgroundColor: Environment.backgroundColor,
          appBar: AppBar(automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              'Rick and Morty',
              style:
                  GoogleFonts.irishGrover(color: Colors.black87, fontSize: 22),
            ),
            backgroundColor: Environment.color1,

          ),
          body: _body(character: character),
          bottomNavigationBar: ConvexAppBar(
            items: [
              if (character.id > 1)
                TabItem(icon: Icons.arrow_back, title: 'Previous'),
              TabItem(icon: Icons.groups, title: 'Characters'),
              if (character.id < RickAndMortApi.maxCharacters)
                TabItem(icon: Icons.arrow_forward, title: 'Next'),
            ],
            color: Colors.black87,

            // backgroundColor: Environment.color1,
            backgroundColor: Color(0xff9ea3d3),

            activeColor: Colors.black45,
            curveSize: 120,
            style: TabStyle.titled,
            initialActiveIndex: 1,
            //optional, default as 0
           
            onTap: (int i) 
            {
   
              print('estamos aqui');
              navigationBehaviour(pos: i, id: character.id);
              },
          )),
    );
  }

  void navigationBehaviour({required int pos, required int id}) {

    if (id == 1) pos++;

    switch (pos) {
      case 0:
        {
          Future.delayed(const Duration(milliseconds: 300), () {
            NavigationService.replaceTo('/character/${id - 1}');
          });
        }

        break;
      case 1:
        {
        if(Navigator.canPop(context)){
          print('no se puede hacer pop');
          NavigationService.navigatePop();
        } else{
          print('id: $id');
 NavigationService.navigateTo('/characters');//Flurorouter.charactersRoute);
        
        }
          
        }

        break;
      case 2:
        {
          Future.delayed(const Duration(milliseconds: 300), () {
            NavigationService.replaceTo('/character/${id + 1}');
          });
        }

        break;
      default:
        return;
    }
  }
}

class _body extends StatelessWidget {
  const _body({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character? character;

  @override
  Widget build(BuildContext context) {
    return (character == null)
        ? Container(
            height: 400.0, child: Center(child: CircularProgressIndicator()))
        : Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 500,
                      child: Hero(
                          tag: 'imagen${character!.id}',
                          child: Image.network(character!.image,
                              fit: BoxFit.fill))),
                  Text(
                    character!.name,
                    style: GoogleFonts.lemonada(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  _descriptionItem(
                      textBold: 'Specie:', text: character!.species),
                  SizedBox(height: 8),
                  _descriptionItem(
                      textBold: 'Gender:', text: character!.gender),
                  SizedBox(height: 8),
                  if (character!.type.length > 0)
                    _descriptionItem(textBold: 'Type:', text: character!.type),
                  if (character!.type.length > 0) SizedBox(height: 8),
                  if (character!.location.name != "unknown")
                    _descriptionItem(
                      textBold: 'Location:',
                      text: character!.location.name,
                      // url: character!.location.url
                    ),
                  SizedBox(height: 8),
                  if (character!.origin.name != "unknown")
                    _descriptionItem(
                      textBold: 'Origin:',
                      text: character!.origin.name,
                      // url: character!.origin.url
                    ),
                  SizedBox(height: 30)
                ],
              ),
            ),
          );
  }
}

class _descriptionItem extends StatelessWidget {
  final String textBold;
  final String text;
  final String? url;
  const _descriptionItem({
    Key? key,
    required this.textBold,
    required this.text,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textBold,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(width: 10),
        Text(text, style: TextStyle(fontSize: 20)),
        SizedBox(width: 10),
        // if (url != null)
        //   GestureDetector(
        //       child: Icon(Icons.preview_sharp),
        //       onTap: () {
        //         //TODO: Falta llevara pagina relacionada
        //         print('ir a pagina $url');
        //       })
      ],
    );
  }
}
