import 'package:flutter/material.dart';
import 'package:news_app/widget/drawer_lateral.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = "Usuario";

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
    _genero = prefs.getInt("genero");
    _nombre = prefs.getString("nombre");
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
    prefs.setInt("genero", gender);
    setState(() {});
  }

  setnombre(String nombre) async {
    print(nombre);
    _nombre = nombre;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("nombre", nombre);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
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
              title: Text("Color secundario"),
              value: _colorSecundario,
              onChanged: (color) {
                setState(() {
                  _colorSecundario = color;
                });
              }),
          RadioListTile(
              value: 1,
              title: Text("Masculino"),
              groupValue: _genero,
              onChanged: setselected),
          RadioListTile(
              value: 2,
              title: Text("Femenino"),
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
                labelText: "Nombre",
                helperText: "Nombre del usuario con el dispositivo",
              ),
              onChanged: setnombre ,
            ),
          ),
        ],
      ),
    );
  }
}
