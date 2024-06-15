import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:train_truck/Controllers/ReclamationController.dart';
import 'package:train_truck/Controllers/RouteController.dart';
import 'package:train_truck/Models/Reclamation.dart';
import 'package:train_truck/Screens/Login_Registration/ChoicePage.dart';
import 'package:train_truck/Screens/reclamation/emotion_face.dart';

import 'CustomDialogReclamation.dart';


class ReclamationPage extends StatefulWidget {

  const ReclamationPage({Key? key}) : super(key: key);
  @override
  State<ReclamationPage> createState() => _ReclamationPageState();
}

class _ReclamationPageState extends State<ReclamationPage> {
  File? _image;
  final ImagePicker _imagePicker = ImagePicker();
  ReclamationController controller=Get.put(ReclamationController());
  RouteController routeController=Get.put(RouteController());



  Future<void> getImage() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        print(image.path);
        _image = File(image.path);
        controller.reclamation.value.image=image;
      } else {
        print('No image selected.');
      }
    });
  }


  late Size mediaSize;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: mediaSize.width,

          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset("assets/images/entete.png"),
                  Container(
                    padding:EdgeInsets.only(top:40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            color: Colors.white,
                          ),
                        ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(
                      width:mediaSize.width/1.1,
                      child: DropdownButtonFormField<String>(
                        value: routeController.routes.isNotEmpty ? routeController.routes[0].routeLongName : null,
                        items: routeController.routes.map((route) {
                          return DropdownMenuItem<String>(
                            value: route.routeLongName,
                            child: Text(route.routeLongName),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          print("---------------------------"+newValue.toString());
                          controller.reclamation.value.route=newValue.toString();

                        },
                        icon: Icon(
                          Icons.arrow_drop_down_circle,
                          color: Color(0xFF62A39F),
                        ),
                        dropdownColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: "Choisir un itinéraire",
                          prefixIcon: Icon(
                            Icons.route_outlined,
                            color: Color(0xFF62A39F),
                          ),
                          hintStyle: TextStyle(color: Colors.white10),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white10),
                          ),
                        ),

                      ),

                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Comment te sens-tu ?',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ),


              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onLongPress: (){
                      print("Mauvais");
                      controller.reclamation.value.emotion="Mauvais";
                      },
                    child: Column(
                      children: [
                        EmotionFace(
                          emotionalFace: '😞',
                        ),
                        SizedBox(height: 8,),
                        Text('Mauvais',
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                  InkWell(
                    onLongPress: (){controller.reclamation.value.emotion="Bien";},
                    child: Column(
                      children: [
                        EmotionFace(
                          emotionalFace: '🙂',
                        ),
                        SizedBox(height: 8,),
                        Text('Bien',
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                  InkWell(
                    onLongPress: (){
                      print("Très bien");
                      controller.reclamation.value.emotion="Très bien";
                      },
                    child: Column(
                      children: [
                        EmotionFace(
                          emotionalFace: '😊',
                        ),
                        SizedBox(height: 8,),
                        Text('Très bien',
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                  InkWell(
                    onLongPress: (){
                      print("Excellent");
                      controller.reclamation.value.emotion="Excellent";
                      },
                    child:  Column(
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
                  )),

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
           Obx(()=> controller.isLoading.value==false?  ElevatedButton(
                onPressed: () async {
                  var res = await controller.createReclamation();
                    if (res != "error") {
                      showDialog(
                          context: Get.context!,
                          builder: (BuildContext context) {
                            return CustomDialogReclamation(msg: res);
                          });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res.toString())));
                    }

                },
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
              ):Container(child: CircularProgressIndicator(),),
           ) ],

          ),
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
      child:TextFormField(
        onChanged: (val){
          controller.reclamation.value.description=val;
        },
        minLines: 5,
        maxLines: 50,
        keyboardType: TextInputType.multiline,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          hintText: 'Ecrire votre description ...',
          hintStyle: TextStyle(color: Colors.black54.withOpacity(0.6)),
          border: InputBorder.none,
        ),
      )
  );


}