import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:train_truck/Models/User.dart';
import 'package:train_truck/Services/UserService.dart';

class UserController extends GetxController{
  static GlobalKey<FormState> RegistrationFormKey = GlobalKey<FormState>();
  static GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  UserService userService = UserService();


  var registrationForm=User().obs;
  var loginForm=User().obs;
  RxBool obscure = true.obs;
  RxBool isLoading=false.obs;

  RxBool isLoadingLogin=false.obs;
  RxBool obscureLogin = true.obs;


  @override
  onInit() {
    super.onInit();
    RegistrationFormKey = GlobalKey<FormState>();
    loginFormKey = GlobalKey<FormState>();
  }


  Future registration()async
  {
    final isValid = RegistrationFormKey.currentState!.validate();
    if(!isValid) {return;}
    RegistrationFormKey.currentState!.save();
    isLoading.value=true;
    if(registrationForm.value.firstName!.isEmpty)
    {return "Veuillez saisir votre prénom";}

    if(registrationForm.value.lastName!.isEmpty)
    {return "Veuillez saisir votre Nom";}

    if(registrationForm.value.passwordUser!.isEmpty)
    {return "Veuillez saisir votre mot de passe";}

    if(registrationForm.value.phoneNumber!.isEmpty)
    {return "Veuillez saisir votre numero de telephone";}

    if(registrationForm.value.phoneNumber!.length != 8)
    {return "Le numéro de téléphone est composée de 8 chiffres.";}

    var res=await userService.createUser(registrationForm.value);
    isLoading.value = false;
    print(res.body);

    if(res.statusCode == 200)
      {
        return "Success";
      }else
      {
          return jsonDecode(res.body);
      }
  }


  Future authenticate()async
  {
    final isValid = loginFormKey.currentState!.validate();
    if(!isValid) {return;}
    loginFormKey.currentState!.save();
    isLoadingLogin.value=true;

    if(loginForm.value.passwordUser!.isEmpty)
    {return "Veuillez saisir votre mot de passe";}

    if(loginForm.value.phoneNumber!.isEmpty)
    {return "Veuillez saisir votre numero de telephone";}

    if(loginForm.value.phoneNumber!.length != 8)
    {return "Le numéro de téléphone est composée de 8 chiffres.";}



    var res=await userService.authenticate(loginForm.value);
    isLoadingLogin.value = false;
    print("-------------------------"+res.statusCode.toString());

    if(res.statusCode == 200)
    {
      return "Success";
    }else
    {
      return "Veuillez vérifier le numéro de téléphone et le mot de passe";
    }


  }


}