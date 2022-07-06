import 'package:flutter/material.dart';
import 'package:news_app/providers/providers.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/widget/constant.dart';
import 'package:news_app/widget/widget.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundScreen(
        iconAvatar: Icons.person_pin_circle_sharp,
        childbody: childbodycard(context),
        ),
    );
  }

  Widget childbodycard (BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 200,),
          CardContainer(
            childcard: Column(
              children: [
                SizedBox(height: 10,),
                Text('Login' , style: Theme.of(context).textTheme.headline4 ),
                SizedBox(height: 20,),

                ChangeNotifierProvider(
                  create: (_)=> LoginFormProvider(),
                  child: _Loginforms(), 
                ),
                
              ],
            )
          ),
          SizedBox(height: 30,),
          TextButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, 'createUserNew');
            },
            child: Text('Create a new account', style:  Theme.of(context).textTheme.headline6,)
          ),
          SizedBox(height: 50,),
        ],
      ),
    );
  }

}

class _Loginforms extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final loginform = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginform.formkey ,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        // TODO: mantener la  referencia del KEY 
        child: Column(
          children: [

            TextFormField(
                style: TextStyle(color: Colors.black),
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorationLogin.getinputDecorationlogin(
                hintText: 'Example@gmail.com',
                labelText: 'Email',
                prefixIcon: Icons.alternate_email_rounded,
              ),
              onChanged: (email){
                loginform.email = email;

              },
              validator: (value ){
                return regExp.hasMatch(value ?? '') ? null  //operador ternario 
                : 'The email format is not correct';
              },
            ),

            SizedBox(height: 15,),

            TextFormField(
              style: TextStyle(color: Colors.black),
              autocorrect: false,
              obscureText: true   ,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorationLogin.getinputDecorationlogin(
                hintText: '******',
                labelText: 'Password',
                prefixIcon: Icons.lock_outline_rounded,
              ),
              onChanged: (pass){
                 loginform.password = pass;
              },
              validator: (value ){
                if(value !=null && value.length >=6 && !loginform.isValidatePassword()) return null;
                return 'password must 6 characters';
              },
            ),

            SizedBox(height: 30,),


            MaterialButton(
              shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                child: Text(

                  loginform.isloading ? 'loading...' : 'Enter', //el loading en false y si esta todo todo bien pasa a true 
                style: TextStyle(color:  Colors.white),
                ),
              ),

              /**
               * validar que el atributo loading no este cargado. 
               * para , sino quita el focus y valida la informacion 
               *cambia la propiedad y damos un ttiempo con el future
               * para despues enviar a otra pantalla. 
               */
              onPressed: loginform.isloading ? null : () async{
                
                 FocusScope.of(context).unfocus(); //para quitar el teclado al presionar el boton 
                final authservice = Provider.of<AuthLoginFirebase>(context, listen: false);

                loginform.isloading = true ;

                final String answer = await authservice.loginUserFirebase( loginform.email,loginform.password );
                print('Respuesta    '+answer.toString());

                if(loginform.email.length > 5 && loginform.password.length >= 6){
                  if(answer == null){ //navego a la pantalla, todo esta bien 
                    Navigator.pushReplacementNamed(context, 'home') ;
                  }else{// error con la cuenta de google 
                    AlertDialogScreen.alertDialogScreenCustom(
                        context , 'Authentication Error' , 'assets/gif/auth.gif');
                  }
                }else{
                  AlertDialogScreen.alertDialogScreenCustom(
                        context , 'Empty fields' , 'assets/gif/nullexcep.gif');
                }
               
                loginform.isloading = false;//desbloquear el boton 
                
              }
            )


          ],
        )
      ),
    );
  }
}