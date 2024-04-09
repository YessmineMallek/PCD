import 'package:train_truck/Models/Arret.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:train_truck/Screens/DetailsScreen.dart';
import 'package:train_truck/Screens/Favoris/FavorisArretCard.dart';
import 'package:train_truck/Screens/Favoris/LigneFavorisCard.dart';
import 'package:train_truck/Screens/Maps/Itin%C3%A9raireScreen.dart';

class Favoris_avec_resultat extends StatefulWidget {
  const Favoris_avec_resultat({Key? key});

  @override
  State<Favoris_avec_resultat> createState() => _Favoris_avec_resultatState();
}

class _Favoris_avec_resultatState extends State<Favoris_avec_resultat> {


  @override
  Widget build(BuildContext context) {
   return  Scaffold(

       body:SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/images/entete.png"),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 100.0),
                      Center(
                        child: Text(
                          "Favoris",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 140.0),
                      Icon(
                        Icons.star_border,
                        color: Colors.black,
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              child: Form(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.place,
                            color: HexColor('#62A39F'),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          "Arrêts Favoris",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 350,
                      height: 250,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: HexColor('#62A39F'),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: arrets.isNotEmpty
                          ? Container(
                        child: ListView.builder(
                          itemCount: arrets.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                FavorisCard(
                                  arret: arrets[index],
                                  itemIndex: index,
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsScreen(
                                              arret: arrets[index],
                                            ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      )
                          : Column(
                        children: [
                          SizedBox(height: 20,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'Assets/images/notfound.png',
                            ),
                          ),
                          Center(
                            child: Text(
                              "Aucun arrêt enregistré",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.train_outlined,
                            color: HexColor('#62A39F'),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          "Ligne Favoris",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 350,
                      height: 250,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: HexColor('#62A39F'),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: arrets.isNotEmpty
                          ? Expanded(
                        child: ListView.builder(
                          itemCount: arrets.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                LigneFavorisCard(
                                  arret: arrets[index],
                                  itemIndex: index,
                                ),
                              ],
                            );
                          },
                        ),
                      ) :
                      Column(
                        children: [
                          SizedBox(height: 20,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'Assets/images/notfound.png',
                            ),
                          ),
                          Center(
                            child: Text(
                              "Aucune ligne enregistrée",
                              style: TextStyle(fontSize: 12,color: Colors.grey
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
   )
    );
  }
}
