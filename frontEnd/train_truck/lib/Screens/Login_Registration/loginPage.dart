import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:train_truck/Screens/Login_Registration/Authentification.dart';
import 'package:train_truck/Screens/Login_Registration/ChoicePage.dart';
import 'package:train_truck/Screens/Providers/HeaderWidget.dart';
import 'package:train_truck/Screens/Providers/logoWidget.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  var obscureValue=true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          HeaderWidget(),
          LogoWidget(),

            Container(
                padding: EdgeInsets.symmetric(vertical: 30,horizontal: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[

                      //Numéro de téléphone
                      Container(
                        height: 48,
                        child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(15) ,
                                  borderSide:
                                  BorderSide(
                                      color: Theme.of(context).primaryColor, width: 2.0),
                                ),
                                hintText: 'Numéro de téléphone',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(15) ,

                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 2.0),
                                )),
                            validator: (val) {
                              if (val.toString().length != 8) {
                                return "Le numéro de téléphone doit comporter 8 chiffres";
                              }
                              if (val!.isEmpty) {
                                return "Veuillez saisir votre numéro de téléphone";
                              }
                            },
                            onSaved: (newValue) {
                              //controller.profileForm.value.phone = newValue;
                            }),
                      ),

                    //mot de passe
                      Container(
                        margin: EdgeInsets.only(top:30),
                        height: 48,
                        child: TextFormField(
                          obscureText: obscureValue,

                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                color: Theme.of(context).primaryColor,
                                onPressed: (){
                                  obscureValue==true?obscureValue=false:obscureValue=true;
                                  setState(() {
                                  });
                                  },
                                icon:obscureValue==true?Icon(
                                  FontAwesomeIcons.eyeSlash,
                                  size: 20,
                                ): Icon(Icons.remove_red_eye_outlined) ,
                              ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(15) ,
                                  borderSide:
                                  BorderSide(
                                      color: Theme.of(context).primaryColor, width: 2.0),
                                ),
                                hintText: 'Mot de passe',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(15) ,

                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 2.0),
                                )),
                            validator: (val) {

                              if (val!.isEmpty) {
                                return "Veuillez saisir votre mot de passe";
                              }
                            },
                            onSaved: (newValue) {
                              //controller.profileForm.value.phone = newValue;
                            }
                            ),
                      ),


                      Container(
                        alignment: Alignment.topRight,
                        child: MaterialButton(
                            onPressed: () {

                            },
                            child: Text(
                              "Mot de Passe oublié ?",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 13.0, color: Colors.black),
                            )),
                      ),

                      ElevatedButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  ChoicePage()),
                        );

                      },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            minimumSize:
                            MaterialStateProperty.all(Size(50, 50)),
                            backgroundColor:
                            MaterialStateProperty.all(Theme.of(context).primaryColor),
                          ),
                          child: Text(
                            "S'authentifier",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),),
                      SizedBox(height: 25.0),

                      Center(
                          child:Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Theme.of(context).primaryColor,
                                    width: (Get.width) / 3,
                                    height: 1,
                                  ),
                                  SizedBox(width: 25.0),

                                  Center(
                                    child: Text(
                                      "Ou",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  SizedBox(width: 25.0),
                                  Container(
                                    color: Theme.of(context).primaryColor,
                                    width: (Get.width) / 3,
                                    height: 1,
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.0),

                              Text("Pas encore de compte? Ouvrez le vôtre maintenant"),
                              SizedBox(height: 15.0),

                              ElevatedButton(onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  AuthenticationPage()),
                                );

                              },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  minimumSize:
                                  MaterialStateProperty.all(Size(50, 50)),
                                  backgroundColor:
                                  MaterialStateProperty.all(Theme.of(context).primaryColor),
                                ),
                                child: Text(
                                  "S'inscrire",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                ),),


                            ],
                          ),

                        )


                    ],
                  ),
                ),

            ),


        ],),
      ),
    );;
  }
}

