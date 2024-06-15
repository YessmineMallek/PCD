import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:train_truck/Controllers/UserController.dart';
import 'package:train_truck/Screens/Login_Registration/Authentification.dart';
import 'package:train_truck/Screens/Login_Registration/ChoicePage.dart';
import 'package:train_truck/Screens/Providers/HeaderWidget.dart';
import 'package:train_truck/Screens/Providers/logoWidget.dart';
import 'package:train_truck/main.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserController userController = Get.put(UserController());
  late Color myColor;
  late Size mediaSize;
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;

    myColor = Theme.of(context).primaryColor;

    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: const AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
          colorFilter:
          ColorFilter.mode(myColor.withOpacity(0.15), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(top:mediaSize.height/15, child: _buildTop()),
          Positioned(bottom: 0, child:_buildBottom()),
        ]),
      ),
    );
  }

  Widget _buildTop (){
    return SizedBox(
      width: mediaSize.width,
      child: !(WidgetsBinding.instance.window.viewInsets.bottom > 0.0)?
      Center(child: Image.asset("assets/images/img.png",)):Container()
    );
  }


  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: buildForm(),
        ),
      ),
    );
  }
  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget buildForm() {

    return Form(
      key: userController.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Bienvenue",
            style: TextStyle(
                color: myColor, fontSize: 32, fontWeight: FontWeight.w500),
          ),
          _buildGreyText("Veuillez vous connecter !"),
          SizedBox(height: 20,),
        
          //Numéro de téléphone
          Container(
            height: 48,
            child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                      BorderSide(
                          color: Theme
                              .of(context)
                              .primaryColor, width: 2.0),
                    ),
                    hintText: 'Numéro de téléphone',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),

                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          width: 2.0),
                    )),
                validator: (val) {
                  if (val
                      .toString()
                      .length != 8) {
                    return "Le numéro de téléphone doit comporter 8 chiffres";
                  }
                  if (val!.isEmpty) {
                    return "Veuillez saisir votre numéro de téléphone";
                  }
                },
                onSaved: (newValue) {
                  userController.loginForm.value.phoneNumber = newValue;
                }),
          ),
          //mot de passe
          Container(
            margin: EdgeInsets.only(top: 13),
            height: 48,
            child:Obx(()=> TextFormField(
                obscureText: userController.obscure.value,

                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      onPressed: () {
                        userController.obscure.value =
                        !userController.obscure.value;
                      },
                      icon: userController.obscure.value == true ? Icon(
                        FontAwesomeIcons.eyeSlash,
                        size: 20,
                      ) : Icon(Icons.remove_red_eye_outlined),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                      BorderSide(
                          color: Theme
                              .of(context)
                              .primaryColor, width: 2.0),
                    ),
                    hintText: 'Mot de passe',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),

                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          width: 2.0),
                    )),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Veuillez saisir votre mot de passe";
                  }
                },
                onSaved: (newValue) {
                  userController.loginForm.value.passwordUser = newValue;
                }
            ),
          )),


          Container(
            alignment: Alignment.topRight,
            child: MaterialButton(
                onPressed: () {

                },
                child: Text(
                  "Mot de Passe oublié ?",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 13.0, color: Colors.grey),
                )),
          ),

          ElevatedButton(onPressed: () async {
            var res = await userController.authenticate();
           print(res);
             if (res == "Success") {
             Get.to(()=>ChoicePage());

            } else {
              if (res != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(res.toString()),

                  ),
                );
              }
            }
          },
            style: ElevatedButton.styleFrom(
              backgroundColor: myColor,
              shape: const StadiumBorder(),
              elevation: 20,
              shadowColor: myColor,
              minimumSize: const Size.fromHeight(60),
            ),
            child: Obx(() =>
            userController.isLoadingLogin.value == false ? Text(
              "S'authentifier",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
            ) : CircularProgressIndicator(color: Colors.white,),
            ),),
          SizedBox(height: 25.0),

          Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      width: (mediaSize.width) / 4,
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
                      color: Theme
                          .of(context)
                          .primaryColor,
                      width: (mediaSize.width) / 4,
                      height: 1,
                    ),
                  ],
                ),
                SizedBox(height: 15.0),

                Center(
                    child: Column(
                        children: [
                          _buildGreyText ("Pas encore de compte?"),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AuthenticationPage()),
                                );
                              },
                              child: Text(" Ouvrez le vôtre maintenant",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.blue),))
                        ]


                    )),


              ],
            ),

          )


        ],
      ),
    );
  }
}

