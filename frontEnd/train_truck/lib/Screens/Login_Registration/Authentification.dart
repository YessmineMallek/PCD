import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:train_truck/Controllers/UserController.dart';
import 'package:train_truck/Screens/Login_Registration/ChoicePage.dart';
import 'package:train_truck/Screens/Providers/HeaderWidget.dart';
import 'package:train_truck/Screens/Providers/logoWidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  UserController userController=Get.put(UserController());
  var myColor;
  late Size mediaSize;
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    myColor=Theme.of(context).primaryColor;
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
      child:  Stack(
        children: [
          IconButton(
              onPressed: (){
            Navigator.of(context).pop();

          }, icon: Icon(Icons.arrow_back_outlined,color: Colors.white,)),
          !(WidgetsBinding.instance.window.viewInsets.bottom > 0.0)?
          Center(child: Image.asset("assets/images/img.png",)):Container(),
        ],
      ),
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
          child: _buildForm(),
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


  Widget _buildForm()
  {
    var color=HexColor("#355095");
    return Form(
      key:userController.RegistrationFormKey ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Inscription",
            style: TextStyle(
                color: myColor, fontSize: 32, fontWeight: FontWeight.w500),
          ),
          _buildGreyText("Veuillez saisir vos données!"),
          SizedBox(height: 15,),

          //prenom utilisateur
          Container(

            height: 48,
            child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(15) ,
                      borderSide:
                      BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0),
                    ),
                    hintText: "Prénom d'utilisateur",
                    enabledBorder: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(15) ,

                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2.0),
                    )),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Veuillez saisir le prénom d'utilisateur";
                  }
                },
                onSaved: (newValue) {
                  userController.registrationForm.value.firstName = newValue;
                }),
          ),

          //Nom utilisateur
          Container(
            margin: EdgeInsets.only(top:15),

            height: 48,
            child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(15) ,
                      borderSide:
                      BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0),
                    ),
                    hintText:"Nom d'utilisateur" ,
                    enabledBorder: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(15) ,

                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2.0),
                    )),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Veuillez saisir le Nom d'utilisateur";
                  }
                },
                onSaved: (newValue) {
                  userController.registrationForm.value.lastName = newValue;
                }),
          ),
          //Numéro de téléphone
          Container(
            margin: EdgeInsets.only(top:15),

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
                  userController.registrationForm.value.phoneNumber = newValue;
                }),
          ),

          //mot de passe
          Container(
            margin: EdgeInsets.only(top:15),
            height: 48,
            child: TextFormField(
                obscureText:  userController.obscure.value,

                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: (){
                        userController.obscure.value=!userController.obscure.value;
                        setState(() {
                        });
                      },
                      icon: userController.obscure.value==true?Icon(
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
                  userController.registrationForm.value.passwordUser = newValue;
                }
            ),
          ),
          SizedBox(height: 15,),
          ElevatedButton(
            onPressed: ()async{

              var res=await userController.registration();
              if(res=="Success")
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  ChoicePage()),
                );
              }else
              {
                if(res!=null){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:  Text(res.toString())),);
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
            child: Obx(
                  ()=>(userController.isLoading.value==false) ?Text(
                "S'inscrire",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ):CircularProgressIndicator(),
            ),),

        ],
      ),
    );
  }
}
