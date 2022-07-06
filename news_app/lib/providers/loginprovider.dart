import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier  {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();


  String email    =  '';
  String password =  '';
  String password2 = '';

  bool _isloading = false;

  bool get isloading => _isloading;

  set  isloading (bool value ){
    this._isloading = value ;
    notifyListeners();
  }
  




  /**
   * validar los campos que esten correcto con sus validater y cambiar el estado (true , false) 
   * al boton parad dar acceso a otra pantalla
   */
  bool isValidateForm (){
    //print(formkey.currentState?.validate()??false);
    print('$password - $email - $password2');
    return formkey.currentState?.validate()??false;
  } 


  bool isValidatePassword(){
    if(password == password2){
      print('$password - $password2');
      return formkey.currentState?.validate()??false;
    }
    return false;
  }

}