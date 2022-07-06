
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/**
 *  guardar el token de acceso en keystore en android y keychaio en Ios , 
 * se necesita cambiar la version de mindsdk : 18 
 * 
 * [project]/android/app/build.gradle set minSdkVersion to >= 18.
 * 
               android {
                  ...

                  defaultConfig {
                      ...
                      minSdkVersion 18
                      ...
                  }

  esta clase se usa estatica para tener acceso a traves del paquete serivices y hace todas 
  funciones de guardar, leer y elimar , uso de sesion y login 

}

 */
class UserSecureStorage {

 static final storage = new FlutterSecureStorage();

  //para escribir un valor en el secure storage. 
 static Future<void> writeValue(String key, String value )async{
    await storage.write(key: key, value: value); 
   return ;
 }

  //borrar el token de la app para cerrar sesion y validarla
 static Future<void> logout(String key)async {
  await storage.delete(key: key);
  return;
 }

 static Future<void> saveInformationUser( String email )async{
  await storage.write(key: 'emailuser', value: email);
  return ;
 }

  

}