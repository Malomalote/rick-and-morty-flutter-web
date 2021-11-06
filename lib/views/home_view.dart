import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/global/enviroment.dart';
import 'package:rick_and_morty/router/router.dart';
import 'package:rick_and_morty/views/widgets/credits_modal.dart';
import 'package:rick_and_morty/views/widgets/custom_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Environment.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Rick and Morty',
            style: GoogleFonts.irishGrover(color: Colors.black87, fontSize: 22),
          ),
          backgroundColor: Environment.color1,
          actions: [
            IconButton(
                icon: Icon(Icons.question_answer),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return CreditsModal();
                      });
                })

            //   showModalBottomSheet(

            //     backgroundColor: Colors.transparent,
            //     context: context, builder: (_)=> const CreditsModal());
            // },
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    'Rick and Morty API',
                    style: GoogleFonts.irishGrover(
                        color: Colors.black87, fontSize: 60),
                  ),
                ),
              ),
              CustomButton(
                route: Flurorouter.charactersRoute,
                text: 'Start',
                fontSize: 40,
              ),
              SizedBox(height: 30),
              // CustomButton(
              //   route: Flurorouter.locationsRAMRoute,
              //   text: 'Locations',
              // ),
              // SizedBox(height: 22),
              // CustomButton(
              //   route: Flurorouter.chaptersRoute,
              //   text: 'Chapters',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
