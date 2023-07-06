import 'package:flutter/material.dart';

import '../models/character.dart';
import 'character_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Character character;
  // String url;4
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(28, 60, 120, 0.40),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                SizedBox(height:80 ,),
                ...content.map((e) => Padding(
                          padding: const EdgeInsets.all(20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CharacterScreen(e)),
                              );
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(e.imageUrl),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  e.name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ]),
            ),
          ),
        ));
  }
}
// for(int i = 0 ; i < content.length ; i++)
// Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => CharacterScreen(content[i])),
//                               );
//                             },
//                             child: Row(
//                               children: [
//                                 CircleAvatar(
//                                   radius: 40,
//                                   backgroundImage: NetworkImage(content[i].imageUrl),
//                                 ),
//                                 SizedBox(
//                                   width: 15,
//                                 ),
//                                 Text(
//                                   content[i].name,
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 25),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )