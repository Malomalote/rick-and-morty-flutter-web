import 'package:flutter/material.dart';
import 'package:rick_and_morty/global/enviroment.dart';
import 'package:rick_and_morty/router/router.dart';
import 'package:rick_and_morty/services/navigation_service.dart';

class CustomFloatinActionButton extends StatelessWidget {
  const CustomFloatinActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Environment.color1,
      elevation: 0,
      onPressed: () {
        NavigationService.replaceTo(Flurorouter.homeRoute);
      },
      child: const Icon(
        Icons.menu_open_outlined,
        color: Colors.black87,
      ),
    );
  }
}
