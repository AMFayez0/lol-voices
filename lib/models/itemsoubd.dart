import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lol/models/character.dart';

class ItemSound extends StatefulWidget {
  final String text;
  final String asset;
  ItemSound({this.asset, this.text});

  @override
  _ItemSoundState createState() => _ItemSoundState();
}

class _ItemSoundState extends State<ItemSound> {
  Character character;
  final player = AudioPlayer();
  bool isplaying = false;
  IconData myicon = Icons.play_arrow;

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
          color: Color.fromRGBO(28, 30, 100, .22)
          
          ),
          child: InkWell(
            onTap: () {
              if (player.playing) {
                player.stop(); 
                return;
              }
              player.setAsset(widget.asset);
              player.play();
              
              if (isplaying) {
                 isplaying=false;
                 setState(() {
                    myicon = Icons.pause_circle; 
                 });
              }
              else{
                isplaying= true;
                setState(() {
                  myicon=Icons.play_arrow;
                });
               
              }

             ;
            },
            
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(child: Icon(myicon)),
                  SizedBox(
                    width: 10,
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
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 5,
          width: double.infinity,
          decoration:
              BoxDecoration(color: Color.fromRGBO(28, 50, 400, .22)),
        )
      ],
    );
  }
}
