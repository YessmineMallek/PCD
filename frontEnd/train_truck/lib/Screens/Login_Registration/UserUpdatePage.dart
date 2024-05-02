
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:train_truck/Controllers/UserController.dart';
import 'package:train_truck/Screens/Login_Registration/SplashScreen.dart';
import 'package:train_truck/Screens/Providers/HeaderWidget.dart';
import 'package:train_truck/Services/UserService.dart';


class UserUpdatePage extends StatefulWidget {
  const UserUpdatePage({super.key});

  @override
  State<UserUpdatePage> createState() => _UserUpdatePageState();
}

class _UserUpdatePageState extends State<UserUpdatePage> {
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
          Container(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.logout, size: 30, color: Colors.red),
                onPressed: () {
                  userController.logOut();
                  Get.offAll(SplashScreen());
                },
              ),
            ),
          ),
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
  

  Widget _buildForm() {
    var primaryColor=Theme.of(context).primaryColor;
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            alignment: Alignment.center,
            child:Text("Modifier votre compte",style: TextStyle(
                color: primaryColor,fontWeight: FontWeight.w500,
                fontSize: 30)) ,
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 30,horizontal: 30),
            child: Form(
              key:userController.updateFormKey ,
              child: Column(
                children: [
                  Container(

                    height: 48,
                    child: TextFormField(
                      initialValue: userController.userUpdated.value.firstName,
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
                          userController.userUpdateForm.value.firstName = newValue;
                        }),
                  ),

                  //Nom utilisateur
                  Container(
                    margin: EdgeInsets.only(top:15),

                    height: 48,
                    child: TextFormField(
                        initialValue: userController.userUpdated.value.lastName,

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
                          userController.userUpdateForm.value.lastName = newValue;
                        }),
                  ),

                  //Numéro de téléphone
                  Container(
                    margin: EdgeInsets.only(top:15),
                    height: 48,
                    child: TextFormField(
                        initialValue: userController.userUpdated.value.phoneNumber,
                        readOnly: true,
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
                        }),
                  ),

                  //mot de passe
                  Container(
                    margin: EdgeInsets.only(top:15),
                    height: 48,
                    child: TextFormField(
                        initialValue:"******",
                        obscureText:  userController.obscure.value,
                        readOnly: true,
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
                        }
                    ),
                  ),


                  SizedBox(height: 15,),

                  ElevatedButton(
                    onPressed: ()async{
                      userController.userUpdateForm.value.passwordUser= userController.userUpdated.value.passwordUser;
                      userController.userUpdateForm.value.phoneNumber= userController.userUpdated.value.phoneNumber;
                      userController.userUpdateForm.value.activated= 1;

                      var res=await userController.updateUser();

                        if(res!=null){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content:  Text(res.toString()),),);
                        }
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
                    child: Obx(
                          ()=>(userController.isLodingUpdate.value==false) ?Text(
                        "Enregistrer",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                      ):CircularProgressIndicator(),
                    ),),


                  SizedBox(height: 30,),

                 ElevatedButton(
                        onPressed: ()async{

                          userController.userUpdateForm.value.passwordUser= userController.userUpdated.value.passwordUser;
                          userController.userUpdateForm.value.phoneNumber= userController.userUpdated.value.phoneNumber;
                          userController.userUpdateForm.value.activated= 0;

                          var res=await userController.updateUser();

                          if(res!=null){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content:  Text(res.toString())));
                              userController.logOut();
                             Get.offAll(SplashScreen());
                          }


                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor:
                          MaterialStateProperty.all(Theme.of(context).primaryColor),
                        ),
                        child:Obx(()=>userController.isLodingUpdate.value==false?  Text(
                            "Désactiver le compte",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),

                        ):CircularProgressIndicator())),

                    ],
                  )


              ),
          )

        ],
      ),
    );
  }
}
