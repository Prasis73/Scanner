import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';



class ScanPagee extends StatefulWidget {
  @override
  _ScanPageeState createState() => _ScanPageeState();
}
Future<void> _launchInApp(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      enableJavaScript: true,
      enableDomStorage: true,

      headers: <String, String>{'header_key': 'header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}
class _ScanPageeState extends State<ScanPagee> {
  String qrCodeResult = "";
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Do Scan"),
          centerTitle: true,

        ),

        // backgroundColor: Color(0xff005CB4),

        body:Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.blue,
                //padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                // margin: EdgeInsets.fromLTRB(0, 00, 00, 300),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[

                    Text(
                      "Can Scan Hotel/Restaurant Menu, Wifi Password and Generate text of any Qr codes",
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 15.0,
                          color: Colors.white
                      ),
                      textAlign: TextAlign.center,

                    ),
                    SizedBox(
                      height: 50.0,

                    ),
                    Text(
                      "Scan To Compile QrCode:",
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 15.0,
                          color: Colors.white
                      ),
                      textAlign: TextAlign.center,

                    ),

                    Column(
                      children: <Widget>[
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          color: Colors.green,

                          onPressed: () async {


                            String codeSanner = await BarcodeScanner.scan();

                            //barcode scnner
                            setState(() {
                              qrCodeResult = codeSanner;
                              _launchInApp(qrCodeResult);
                              print(qrCodeResult);
                            },

                            );




                          },
                          child: Text(
                            "SCAN HERE",
                            style:
                            TextStyle(color: Colors.white, fontWeight: FontWeight.bold
                              ,fontFamily: 'poppins',
                              fontSize: 22.0,
                            ),
                          ),

                        ),
                        SizedBox(height: 100.0,),

                      ],
                    ),

                    Column(
                      children: <Widget>[
                        Text("Scan Result:",style:
                        TextStyle(color: Colors.white,
                          fontFamily: 'poppins',
                          fontSize: 22.0,
                        ),),
                        SizedBox(height: 10.0),
                        Text(qrCodeResult,style:
                        TextStyle(color: Colors.white,fontFamily: 'poppins',
                          fontSize: 15.0,
                        ),),
                      ],
                    ),



                    // image_carousel,
                  ],
                ),
              ),

            ),

          ],
        )
    );
  }

//its quite simple as that you can use try and catch staatements too for platform exception
}
