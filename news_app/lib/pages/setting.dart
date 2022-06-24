import 'package:flutter/material.dart';
import 'package:news_app/models/waether_models.dart';
import 'package:news_app/services/services_weather.dart';
import 'package:news_app/widget/drawer_lateral.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = "User";

  TextEditingController textEditingController;

//**
//metodo abtracto que se dispara antes que el build */
  @override
  void initState() {
    super.initState();
    loadprefs();
    textEditingController = new TextEditingController(text: _nombre);
  }

  /**
   * se llama el initstate para lanzar los valores de los sharedpreferences
   */
  loadprefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _genero = prefs.getInt("gender");
    _nombre = prefs.getString("name");
    setState(() {});
  }

  
/**
 * usando sharedpreferences, similitud a localStorage, 
 * guarda la data en clave, valor. 
 * en andriod en la ubicacion sharedpreferences 
 * en Ios en NSUserDefaults
 */
  setselected(int gender) async {
    _genero = gender;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("gender", gender);
    setState(() {});
  }

  setnombre(String nombre) async {
    print(nombre);
    _nombre = nombre;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", nombre);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: Drawer_Page(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(7.0),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          Divider(),
          SwitchListTile(
              title: Text("Secondary color"),
              value: _colorSecundario,
              onChanged: (color) {
                setState(() {
                  _colorSecundario = color;
                });
              }),
          RadioListTile(
              value: 1,
              title: Text("Male"),
              groupValue: _genero,
              onChanged: setselected),
          RadioListTile(
              value: 2,
              title: Text("Female"),
              groupValue: _genero,
              onChanged: setselected),
          Divider(),
          Container(
            padding: EdgeInsets.all(7.0),
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.accessibility),
                icon: Icon(Icons.account_circle_rounded),
                labelText: "Name",
                helperText: "your name",
              ),
              onChanged: setnombre ,
            ),
          ),
        ],
      ),
    );
  }
}
