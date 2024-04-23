import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class EmotionFace extends StatefulWidget {
  final String emotionalFace;

  const EmotionFace({Key? key, required this.emotionalFace}) : super(key: key);

  @override
  _EmotionFaceState createState() => _EmotionFaceState();
}

class _EmotionFaceState extends State<EmotionFace> {
  Color buttonColor = HexColor('#A6C5C4');

  @override
  Widget build(BuildContext context) {

    return TextButton(
      onPressed: () {
        // Vérifier la couleur actuelle du bouton
        if (buttonColor == HexColor('#A6C5C4')) {
          // Si la couleur actuelle est claire, la changer à une couleur plus foncée
          setState(() {
            buttonColor = HexColor('#407D7F');
          });
        } else {
          // Sinon, changer la couleur à une couleur plus claire
          setState(() {
            buttonColor = HexColor('#A6C5C4');
          });
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor), // Utiliser la couleur actuelle du bouton
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            widget.emotionalFace,
            style: TextStyle(
              fontSize: 28,
              color: Colors.white, // Couleur du texte
            ),
          ),
        ),
      ),
    );
  }
}
