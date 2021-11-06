import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/services/navigation_service.dart';

class CustomButton extends StatelessWidget {
  final String route;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  const CustomButton(
      {Key? key,
      required this.route,
      required this.text,
      this.color = const Color(0x607D8Bff),
      this.textColor = Colors.black87,
      this.fontSize = 26})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Text(
          text,
          // style: GoogleFonts.fruktur(color: textColor, fontSize: fontSize),
          style: GoogleFonts.irishGrover(color: textColor, fontSize: fontSize),
        ),
        color: color,
        onPressed: () {
          NavigationService.replaceTo(route);
        });
  }
}
