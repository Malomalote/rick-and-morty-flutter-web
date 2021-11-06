import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rick_and_morty/global/enviroment.dart';
import 'package:rick_and_morty/router/router.dart';
import 'package:rick_and_morty/views/widgets/custom_button.dart';

class NoPageFoundView extends StatelessWidget {
  const NoPageFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Environment.backgroundColor,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '404 No page found',
            style: GoogleFonts.montserratAlternates(
                fontSize: 50, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          CustomButton(route: Flurorouter.homeRoute, text: 'Go to home page')
        ],
      )),
    );
  }
}
