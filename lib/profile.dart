import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Profil'),
          centerTitle: true,
          leading: Icon(Icons.menu),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Picture(),
              Name(),
              NIM(),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.blueAccent;
                        return Colors
                            .tealAccent; // Use the component's default.
                      },
                    ),
                  ),
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder:(context) => HomeScreen()));
                  },
                  child: Text(
                    'BACK',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Picture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 250,
      margin: const EdgeInsets.only(top: 45.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        image: DecorationImage(
          image: AssetImage('images/deon.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "I Made Deon Virgananta",
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
      margin: const EdgeInsets.only(top: 40.0),
    );
  }
}

class NIM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "1915051035",
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
      margin: const EdgeInsets.only(top: 10.0),
    );
  }
}
