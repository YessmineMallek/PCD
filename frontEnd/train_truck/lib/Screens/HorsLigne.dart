import 'package:train_truck/Models/Arret.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:train_truck/Models/Arret.dart';
import 'package:train_truck/Screens/Maps/Itin%C3%A9raireScreen.dart';
import 'package:train_truck/Screens/Maps/ItineraireCard.dart';

class HorsLigne extends StatefulWidget {
  const HorsLigne({Key? key}) : super(key: key);

  @override
  State<HorsLigne> createState() => _HorsLigneState();
}

class _HorsLigneState extends State<HorsLigne> {
  List<Arret> _foundedArret = [];
  bool _showList = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _foundedArret = arrets;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedArret = arrets
          .where((Arret) => Arret.title.toLowerCase().contains(search))
          .toList();
      _showList = true;
    });
  }

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
                          "Horaires du Train Hors-Ligne",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 40.0),
                      Icon(
                        Icons.timer_sharp,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.grey, HexColor('#62A39F')],
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 8.0),
                    Icon(Icons.search, color: Colors.white),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        onChanged: (value) => onSearch(value),
                        decoration: InputDecoration(
                          hintText: 'Vers quelle destination ?',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            _showList
                ? Container(

              width: 380,
              height: 500,
              decoration: BoxDecoration(
                color: HexColor('#62A39F').withOpacity(0.5),

                border: Border.all(
                  color: HexColor('#62A39F'),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10.0),
                  Text(
                    'Choisissez votre destination',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: _foundedArret.isEmpty
                        ? Center(
                      child: Text(
                        "Aucune Station trouvée",
                        style: TextStyle(fontSize: 15,color: Colors.black87
                        ),
                      ),
                    )
                        : ListView.builder(
                      itemCount: _foundedArret.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ItineraireCard(
                                arret: _foundedArret[index],
                                itemIndex: index),
                            SizedBox(
                                height:
                                10.0),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
                : Container(), // Container vide si aucune recherche n'a été effectuée
          ],
        ),
      ),
    );
  }
}
