import 'package:flutter/material.dart';

class AlertDialogScreen  {

  static Future<dynamic> alertDialogScreenCustom(BuildContext context , String title, 
  String routeImageCache ) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        elevation: 24.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          ),
        title:   Text('${title}'),
        content: Image(image: AssetImage(routeImageCache) , width: 210,  height:210,),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Container(
                //color: Colors.green,
                padding: const EdgeInsets.all(5),
                child: const Text("Okay" , style: TextStyle( color: Colors.deepPurple, fontSize: 20, ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}
