import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:train_truck/Models/Arret.dart';

class FavorisCard extends StatelessWidget {
  const FavorisCard({
    Key? key,
    required this.itemIndex,
    required this.arret,
    required this.press,
  }) : super(key: key);
  final int itemIndex;
  final Arret arret;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: Container(
          width: double.infinity,
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
                    SizedBox(width: 20.0),
                    Text(
                      arret.title,
                      style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.star_border,
                color: Colors.black,
              ),
              SizedBox(width: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}
