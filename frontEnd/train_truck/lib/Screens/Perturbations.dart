import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:train_truck/Models/Arret.dart';
import 'package:train_truck/Screens/Favoris/LigneFavorisCard.dart';
import 'package:train_truck/Screens/Maps/Itin%C3%A9raireScreen.dart';


class Perturbations extends StatefulWidget {
  const Perturbations({Key? key});

  @override
  State<Perturbations> createState() => _PerturbationsState();
}

class _PerturbationsState extends State<Perturbations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItineraireScreen()),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Center(
                        child: Text(
                          "Lignes et perturbations ",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 40.0),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Form(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.train_outlined,
                          color: HexColor('#62A39F'),
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
                    SizedBox(height: 10.0),
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
                      child: arretsFav.isNotEmpty
                          ? ListView.builder(
                        itemCount: arretsFav.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              LigneFavorisCard(
                                arret: arretsFav[index],
                                itemIndex: index,
                              ),
                            ],
                          );
                        },
                      )
                          : Column(
                        children: [
                          SizedBox(height: 20),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'Assets/images/notfound.png',
                            ),
                          ),
                          Center(
                            child: Text(
                              "Aucune ligne enregistrée",
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
                        Icon(
                          Icons.error_outline,
                          color: HexColor('#62A39F'),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          "Perturbation",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      width: 350,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: HexColor('#62A39F'),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Icon(
                            Icons.filter_list,
                            color: HexColor('#62A39F'),
                            size: 80.0,
                          ),
                          Center(
                            child: Text(
                              "Aucune perturbation n'est à prévoir",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
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
      ),
    );
  }
}
