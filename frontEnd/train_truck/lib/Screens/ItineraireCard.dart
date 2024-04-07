import 'package:flutter/material.dart';
import 'package:train_truck/Models/Arret.dart';

class ItineraireCard extends StatelessWidget {
  const ItineraireCard({
    Key? key,
    required this.itemIndex,
    required this.arret,
  }) : super(key: key);

  final int itemIndex;
  final Arret arret;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              arret.title,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  arret.heure,
                  style: TextStyle(color: Colors.black87),
                ),
                Text(
                  arret.etat,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
