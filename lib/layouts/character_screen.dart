// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../models/character.dart';
import '../models/itemsoubd.dart';

class CharacterScreen extends StatefulWidget {
  Character character;
  CharacterScreen(this.character, {super.key});
  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 60, 120, 0.40),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25)
                      ,image: DecorationImage(
                        image: NetworkImage(widget.character.imageGif),
                        fit:BoxFit.cover
                      ),
                     ),
                     
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: widget.character.characterdata.keys
                      .map((e) => ItemSound(
                            text: e,
                            asset:widget.character.characterdata[e]!,
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
