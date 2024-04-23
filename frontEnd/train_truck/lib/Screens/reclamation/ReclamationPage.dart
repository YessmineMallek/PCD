import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:train_truck/Controllers/RouteController.dart';
import 'package:train_truck/Screens/reclamation/emotion_face.dart';

class ReclamationPage extends StatefulWidget {

  const ReclamationPage({Key? key}) : super(key: key);
  @override
  State<ReclamationPage> createState() => _ReclamationPageState();
}

class _ReclamationPageState extends State<ReclamationPage> {
  File? _image;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> getImage() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  RouteController routeController=Get.put(RouteController());

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
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 90.0),
                      Center(
                        child: Text(
                          "Reclamation",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 100.0),
                      Icon(
                        Icons.rate_review_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 30.0),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  DropdownButtonFormField<String>(
                    value: routeController.routes.isNotEmpty ? routeController.routes.first.name : null,  // Assuming 'name' is a string property of 'route'
                    items: routeController.routes.map((route) {
                      return DropdownMenuItem<String>(
                        value: route,
                        child: Text(route),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                    },
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: HexColor('#62A39F'),
                    ),
                    dropdownColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: "Choose Route",
                      prefixIcon: Icon(
                        Icons.route_outlined,
                        color: HexColor('#62A39F'),
                      ),
                    ),
                  ),


                  Text(
                    'How do you feel ?',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.black87 ,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    EmotionFace(
                      emotionalFace: '😞',
                    ),
                SizedBox(height: 8,),
                Text('Bad',
                style: TextStyle(
                  color: Colors.black,
                )),
                  ],
                ),
                Column(
                  children: [
                    EmotionFace(
                      emotionalFace: '🙂',
                    ),
                    SizedBox(height: 8,),
                    Text('Fine',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ],
                ),
                Column(
                  children: [
                    EmotionFace(
                      emotionalFace: '😊',
                    ),
                    SizedBox(height: 8,),
                    Text('Well',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ],
                ),
                Column(
                  children: [
                    EmotionFace(
                      emotionalFace: '😁',
                    ),
                    SizedBox(height: 8,),
                    Text('Excellent',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ],
                ),

                  ],
                ),
            SizedBox(height: 30.0),
            buildBasicCard(),
            SizedBox(height: 30),
            TextButton(
              onPressed: getImage,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(HexColor('#A6C5C4').withOpacity(0.5)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.black.withOpacity(0.4), width: 2), // Ajout de la bordure
                  ),
                ),
                overlayColor: MaterialStateProperty.all(Colors.transparent), // Suppression de la couleur de superposition
                shadowColor: MaterialStateProperty.all(Colors.transparent), // Suppression de la couleur de l'ombre
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.camera_alt, color: Colors.black87),
                    SizedBox(width: 8),
                    Text(
                      'Prendre une photo',
                      style: TextStyle(color: Colors.black54.withOpacity(0.6), fontSize: 16), // Correction de la couleur du texte
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(Size(50, 50)),
                backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
              ),
              child: Text(
                "Envoyer",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),

              ],

            ),

        ),
      );

  }

  Widget buildBasicCard() => Container(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white10.withOpacity(0.5),
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all( // Added border
        color: Colors.black.withOpacity(0.4),
        width: 2,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: TextFormField(
      minLines: 5,
      maxLines: 50,
      keyboardType: TextInputType.multiline,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        hintText: 'Write your description ...',
        hintStyle: TextStyle(color: Colors.black54.withOpacity(0.6)),
        border: InputBorder.none,
      ),
    ),
  );


}


