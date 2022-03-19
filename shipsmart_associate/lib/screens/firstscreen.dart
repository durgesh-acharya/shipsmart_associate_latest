import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shipsmart_associate/screens/dashboard.dart';
import 'package:shipsmart_associate/screens/loginscreen.dart';
import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({ Key? key }) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  bool _centervisiblity = true;
  int? finalassociateid;
  
  Future _showExitDialog()async{

    return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("It seems you are not coneected to internet !"),
        actions: [
          TextButton(onPressed: (){
            SystemNavigator.pop();
          }, child:const Text("Ok"))
        ],
      );
    },
  );

  }

  Future checkConnections()async{
    var result = await(Connectivity().checkConnectivity());
    if(result == ConnectivityResult.none){
      setState(() {
        _centervisiblity = false;
      });
      _showExitDialog();
    }
    else{
    // Navigator.pushReplacement(
    // context,
    // MaterialPageRoute(builder: (context) => const LoginScreen()),
    getValidation().whenComplete(()async{
      Timer(Duration(milliseconds: 2000), ()=> Get.off(finalassociateid == null ? LoginScreen() : DashBoard()));
    });
    
  
    }
    
  }

Future getValidation()async{
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var obtainid = sharedPreferences.getInt("assoicateid");
  setState(() {
    finalassociateid = obtainid;
  });
}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkConnections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Visibility(
          visible: _centervisiblity,
          child: Card(
            child: Row(
              children: [
                CircularProgressIndicator(),
                Text("Checking Internet Connections!!")
              ],
            ),
          ),
        ),
      ),
    );
  }
}