import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'profile.dart';

import 'webview_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String kode = "";
  var getKode;
  Future scanBarcode() async {
    getKode = await BarcodeScanner.scan();
    setState(() {
      kode = getKode.rawContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        leading: Icon(Icons.announcement_outlined),
        title: Text("QR SCANNER"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_box_outlined),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyProfile()),
              );
            },
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            height: 10,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Image.asset("images/qrscan.jpg",
          height: 400,
          width: 300,),
          SizedBox(
            height: 10.0,
          ),
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: () {
              scanBarcode();
            },
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    "Scan QR",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.lightBlue[400],
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: kode == ""
                ? () {}
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebScreen(kode),
                      ),
                    );
                  },
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: kode == ""
                      ? Text(
                          "Result",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        )
                      : Text(
                          kode,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.greenAccent[400],
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
