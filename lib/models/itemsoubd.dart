// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lol_voices_version2/models/character.dart';

class ItemSound extends StatefulWidget {
  final String text;
  final String asset;
  ItemSound({required this.asset, required this.text});

  @override
  _ItemSoundState createState() => _ItemSoundState();
}

class _ItemSoundState extends State<ItemSound> {
  late Character character;

  final player = AudioPlayer();
  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  bool isplaying = false;
  IconData myicon = Icons.play_arrow;
  Widget item({
    required String assetpath,
  }) =>
      Column(children: [
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                await player.stop();
                await player.play(
                  AssetSource(
                    assetpath.replaceAll('assets/', ''),
                  ),
                );
              },
              child: CircleAvatar(
                // backgroundColor: Color(0xff009FBD),
                radius: 30,
                child: Icon(Icons.play_arrow_outlined),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                if (player.state == PlayerState.playing) {
                  player.pause();
                } else {
                  player.resume();
                }
              },
              child: CircleAvatar(
                // backgroundColor: Color(0xff009FBD),
                radius: 30,
                child: Icon(Icons.pause),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                player.stop();
              },
              child: CircleAvatar(
                // backgroundColor: Color(0xff009FBD),
                radius: 30,
                child: Icon(Icons.stop),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(55, 59, 167, 0.22)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [  SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Text(
                        widget.text,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        maxLines: 10,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                item(assetpath: widget.asset),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 5,
          width: double.infinity,
          decoration: BoxDecoration(color: Color.fromRGBO(12, 53, 218, 0.22)),
        ),  
      ],
    );
  }
}
