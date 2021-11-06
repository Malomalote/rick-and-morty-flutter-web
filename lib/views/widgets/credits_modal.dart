import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rick_and_morty/global/enviroment.dart';
import 'package:rick_and_morty/router/router.dart';
import 'package:rick_and_morty/views/widgets/custom_button.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditsModal extends StatelessWidget {
  const CreditsModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: Environment.backgroundColor,
      content: _alertBody(size: size),
      actions: [CustomButton(route: Flurorouter.homeRoute, text: 'Close')],
    );
  }
}

class _alertBody extends StatelessWidget {
  const _alertBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: size.width * 2 / 3,
          padding: EdgeInsets.all(30),
          height: size.height * 2 / 3,
          color: Environment.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               SizedBox(height: 30),
              Text('Based on Rick an Morty API',style: GoogleFonts.architectsDaughter(fontSize:28,fontWeight: FontWeight.bold)),
              SelectableAutoLinkText(
                'https://rickandmortyapi.com/',
                linkStyle: TextStyle(color: Colors.blueAccent,fontSize: 22),
                highlightedLinkStyle: TextStyle(
                  color: Colors.blueAccent,
                  backgroundColor: Colors.blueAccent.withAlpha(0x33),
                ),
                onTap: (url) => launch(url),
              ),
            SizedBox(height: 30),
              Text('Designed and coded by Antonio Miguel Dev. ',style: GoogleFonts.architectsDaughter(fontSize:28,fontWeight: FontWeight.bold)),
              SelectableAutoLinkText(
                'antoniomigueldev@gmail.com',

                linkStyle: TextStyle(color: Colors.blueAccent,fontSize: 22),
                highlightedLinkStyle: TextStyle(
                  color: Colors.blueAccent,
                  backgroundColor: Colors.blueAccent.withAlpha(0x33),
                ),
                onTap: (url) {

                  launch(Uri(scheme: 'mailto',path: url).toString());
                }
                
                // => launch(url.toString()),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
