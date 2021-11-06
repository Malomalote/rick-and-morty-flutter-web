import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty/api/rick_and_morty_api.dart';
import 'package:rick_and_morty/global/enviroment.dart';
import 'package:rick_and_morty/model/rick_and_morty_model.dart';
import 'package:rick_and_morty/provider/rick_and_morty_provider.dart';
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

    return (character == null)
        ? const SizedBox(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SafeArea(
            child: Scaffold(
                backgroundColor: Environment.backgroundColor,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  title: Text(
                    'Rick and Morty',
                    style: GoogleFonts.irishGrover(
                        color: Colors.black87, fontSize: 22),
                  ),
                  backgroundColor: Environment.color1,
                ),
                body: _Body(character: character),
                bottomNavigationBar: ConvexAppBar(
                  items: [
                    if (character.id > 1)
                      const TabItem(icon: Icons.arrow_back, title: 'Previous'),
                    const TabItem(icon: Icons.groups, title: 'Characters'),
                    if (character.id < RickAndMortApi.maxCharacters)
                      const TabItem(icon: Icons.arrow_forward, title: 'Next'),
                  ],
                  color: Colors.black87,
                  backgroundColor: const Color(0xff9ea3d3),
                  activeColor: Colors.black45,
                  curveSize: 120,
                  style: TabStyle.titled,
                  initialActiveIndex: 1,
                  onTap: (int i) {
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
          if (Navigator.canPop(context)) {
            NavigationService.navigatePop();
          } else {
            NavigationService.navigateTo('/characters');
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

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character? character;

  @override
  Widget build(BuildContext context) {
    return (character == null)
        ? const SizedBox(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 500,
                    child: Hero(
                      tag: 'imagen${character!.id}',
                      child: Image.network(character!.image, fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    character!.name,
                    style: GoogleFonts.lemonada(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  _DescriptionItem(
                      textBold: 'Specie:', text: character!.species),
                  const SizedBox(height: 8),
                  _DescriptionItem(
                      textBold: 'Gender:', text: character!.gender),
                  const SizedBox(height: 8),
                  if (character!.type.isNotEmpty)
                    _DescriptionItem(textBold: 'Type:', text: character!.type),
                  if (character!.type.isNotEmpty) const SizedBox(height: 8),
                  if (character!.location.name != "unknown")
                    _DescriptionItem(
                      textBold: 'Location:',
                      text: character!.location.name,
                    ),
                  const SizedBox(height: 8),
                  if (character!.origin.name != "unknown")
                    _DescriptionItem(
                      textBold: 'Origin:',
                      text: character!.origin.name,
                    ),
                  const SizedBox(height: 30)
                ],
              ),
            ),
          );
  }
}

class _DescriptionItem extends StatelessWidget {
  final String textBold;
  final String text;
  final String? url;
  const _DescriptionItem({
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
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(fontSize: 20)),
        const SizedBox(width: 10),
      ],
    );
  }
}
