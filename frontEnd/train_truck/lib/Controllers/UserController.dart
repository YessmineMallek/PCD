import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:train_truck/Models/User.dart';
import 'package:train_truck/Services/UserService.dart';

import '../main.dart';

class UserController extends GetxController{
   GlobalKey<FormState> RegistrationFormKey = GlobalKey<FormState>();
   GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  UserService userService = UserService();


  var registrationForm=User().obs;
  var loginForm=User().obs;
  RxBool obscure = true.obs;
  RxBool isLoading=false.obs;

  RxBool isLoadingLogin=false.obs;
  RxBool obscureLogin = true.obs;

  var userUpdated=User().obs;
  var userUpdateForm=User().obs;
  GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();

  RxBool isLodingUpdate=false.obs;
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
    await UserService.savePhoneNumber(registrationForm.value.phoneNumber!);

    isLoading.value = false;
    print(res.body);

    if(res.statusCode == 200)
      {
        var body=jsonDecode(res.body);
        print(body);
        print(body["token"]);
        await UserService.saveToken(body["token"]);
        return "Success";
      }else if (res.statusCode == 409)
      {
        return jsonDecode(res.body)["msg"];
      }

      else
      {
          return jsonDecode(res.body)["msg"];
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
    await UserService.savePhoneNumber(loginForm.value.phoneNumber!);

    isLoadingLogin.value = false;
    print("-------------------------"+res.statusCode.toString());
    if(res.statusCode == 200)
    {
      var body=jsonDecode(res.body);
      print(body);
      print(body["token"]);

      await UserService.saveToken(body['token']) ;
      return "Success";
    }else
    {
      return "Veuillez vérifier le numéro de téléphone et le mot de passe";
    }

  }

  Future findUser()async
  {
    final token = await UserService.getToken();

    var phone=await UserService.getPhoneNumber();
    var res=await userService.getUser(phone,token);
    print(res.body);
    if(res.statusCode == 200)
    {
      var body=User.fromJson(jsonDecode(res.body));
      userUpdated.value=body;
      return "Success";
    }else
    {
      return "Echec";
    }


  }

  Future updateUser()async
  {
    isLodingUpdate.value=true;
    final isValid = updateFormKey.currentState!.validate();
    if(!isValid) {return;}
    updateFormKey.currentState!.save();
    final token = await UserService.getToken();
    var phone=await UserService.getPhoneNumber();
    var res=await userService.updateUser(phone,userUpdateForm.value,token);

    if(res.statusCode == 200)
    {
      var body=User.fromJson(jsonDecode(res.body));
      userUpdated.value=body;
      isLodingUpdate.value=false;
      return "Success";

    }else
    {
      isLodingUpdate.value=false;

      return "Echec";
    }


  }
  logOut()
  {
    UserService.clearPhoneNumber();
    UserService.clearToken();
    RegistrationFormKey = GlobalKey<FormState>();
    loginFormKey = GlobalKey<FormState>();

  }




}