import 'package:flutter/material.dart';
import 'package:news_app/services/services.dart';
import 'package:provider/provider.dart';

class PageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userservice = Provider.of<AuthLoginFirebase>(context);

    return SafeArea(
      bottom: false,
      child: Container(
        alignment: Alignment.topCenter,
        child: columnText(userservice),
      ),
    );
  }

  columnText(AuthLoginFirebase userservice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 15,
        ),
        FutureBuilder(
            future: userservice.readInformationUser(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Hi " + snapshot.data.toLowerCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                );
              }
            }),
        SizedBox(
          height: 15,
        ),
        Text(
          "¿What do you want to do today?",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
