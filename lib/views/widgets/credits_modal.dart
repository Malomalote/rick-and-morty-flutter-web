import 'package:flutter/material.dart';
import 'package:rick_and_morty/global/enviroment.dart';
import 'package:rick_and_morty/router/router.dart';
import 'package:rick_and_morty/views/widgets/custom_button.dart';


class CreditsModal extends StatelessWidget {
  const CreditsModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return AlertDialog(backgroundColor: Environment.backgroundColor,
      content: _alertBody(size: size),
      actions: [
        CustomButton(route: Flurorouter.homeRoute, text: 'Close')
      ],
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
      child: Container(
        width: size.width*2/3,
        padding: EdgeInsets.all(30),
        height: size.height*2/3,
        color: Environment.backgroundColor,
        child: Column(
          children: [
            Text('Based on Rick an Morty API'),
            Text('https://rickandmortyapi.com/'),

            
          ],
        ),
      ),
    );
  }
}