import 'package:train_truck/Models/Arret.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class LigneFavorisCard extends StatelessWidget {
  const LigneFavorisCard({
    Key? key,
    required this.itemIndex,
    required this.arret,

  }) : super(key: key);
  final int itemIndex;
  final Arret arret;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  color: HexColor('#A5C0BF'),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 15.0),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(width: 10.0,),
                          Icon(
                            Icons.train_outlined,
                            color: Colors.black,

                          ),
                          SizedBox(width: 20.0,),
                          Column(
                            children: [
                              SizedBox(height: 10.0,),
                              Text(
                                'Tunis-Sfax',
                                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Arrive dans 5 min',
                                style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.0,),
              Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: HexColor('#A5C0BF'),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  },
                      icon: Icon(Icons.arrow_forward_outlined,
                        color: Colors.black,))
              ),
            ],
          ),
        ),

      ],
    );
  }
}
