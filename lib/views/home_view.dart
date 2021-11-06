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
                icon: const Icon(
                  Icons.question_answer,
                  color: Colors.black87,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return const CreditsModal();
                      });
                }),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 30),
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
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
