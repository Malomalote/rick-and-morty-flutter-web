import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rick_and_morty/global/enviroment.dart';
import 'package:rick_and_morty/model/rick_and_morty_model.dart';
import 'package:rick_and_morty/services/navigation_service.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({Key? key, required this.character}) : super(key: key);

  Widget build(BuildContext context) {

    return GestureDetector(
      
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Environment.color2,
        ),
        margin: EdgeInsets.all(8),
        width: 450,
        height: 180,
        child: Row(
          children: [
            SizedBox(width: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Hero(
                
                 tag: 'imagen${character.id}',
                child: Image.network(
                  character.image,
                  height: 110.0,
                ),
              ),
            ),
    
            SizedBox(width: 8),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      character.name,
                      style: GoogleFonts.actor(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      character.species,
                      style: GoogleFonts.actor(fontWeight: FontWeight.bold),
                    ),
                    FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          character.location.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      onTap: (){NavigationService.navigateTo('/character/${character.id}');},
    );
  }
}
