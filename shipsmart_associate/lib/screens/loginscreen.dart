import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shipsmart_associate/screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _pivisiblity = false;
  TextEditingController _associateid = TextEditingController();
   TextEditingController _associatepassword = TextEditingController();

  Widget buildId(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Associate Id",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        ),
        SizedBox(height: 10.0,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(

                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0,2)
              )
            ]

          ),
          height: 60,
          child : TextField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(6),
            ],
            controller: _associateid,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.black87,   
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.person,color: Color(0xff000080),
                ),
                hintText: 'Enter 6 Digit Associate Id',
                hintStyle: TextStyle(
                  color: Colors.black38
                )
              ),
          )
        )
      ],
    );
  }

  Widget buildPassword(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        ),
        SizedBox(height: 10.0,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(

                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0,2)
              )
            ]

          ),
          height: 60,
          child : TextField(
            controller: _associatepassword,
            obscureText: true,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black87,   
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.password,color: Color(0xff000080),
                ),
                hintText: 'Enter Password',
                hintStyle: TextStyle(
                  color: Colors.black38
                )
              ),
          )
        )
      ],
    );
  }
  
  Widget buildForgetPassword(){
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: (){
          print("Forgot passowrd clicked");
        },
        child: Text("Forgot Password ?",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        ),
      )
      ,
    );
  }

 Widget buildLoginButton(){
   return Container(
     padding: EdgeInsets.symmetric(vertical: 25),
     width: double.infinity,
     child: RaisedButton(onPressed: (){
       if(_associateid.text.length < 6 || _associatepassword.text.length < 6){
          return null;
       }else{
            getAssociateAuth(int.parse(_associateid.text), _associatepassword.text);
       }
    
     },
     elevation: 5,
     padding: EdgeInsets.all(15),
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(15) ),
       color: Colors.white,
       child: Text("Login",
       style: TextStyle(
         color: Color(0xff000080),
         fontSize: 18,
         fontWeight: FontWeight.bold
       ),
       ),

     ),
   );
 }

Widget buildSignUpButton(){
  return GestureDetector(
    onTap: (){print("Signup clicked");},
    child: RichText(text: TextSpan(
      children: [
        TextSpan(
          text: "Become an Associate. ",
          style: TextStyle(
            color: Colors.white
          )
        ),
        TextSpan(
          text: "Sign Up Now!!",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          )
        )
      ]
    )),
  );
}


 Future _showInvalidCredentialDialog()async{

    return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Invalid Credentials !"),
        actions: [
          TextButton(onPressed: (){
           Navigator.of(context).pop();
          }, child:const Text("Try Again!"))
        ],
      );
    },
  );

  }


Future getAssociateAuth(int id, String password)async{
  setState(() {
    _pivisiblity = true;
  });
  final String url = "http://shipsmart-env.eba-4nc5kenf.us-east-2.elasticbeanstalk.com/associate/authbyid/${id}/${password}";
  var response =  await http.get(Uri.parse(url));
  var jsonresponse = jsonDecode(response.body);
 var status = jsonresponse[0]['status'];
 if(status == false){
   setState(() {
     _pivisiblity = false;
   });
_showInvalidCredentialDialog();
 }else{
   setState(() {
     _pivisiblity = false;
   });
   int associateid = int.parse(_associateid.text);
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   sharedPreferences.setInt("assoicateid",associateid);
     Get.off(()=>DashBoard());
 }
}
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:AnnotatedRegion(child: GestureDetector(child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x66000080),
                  Color(0x99000080),
                  Color(0xcc000080),
                  Color(0xff000080)
                ])
            ),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 120
              ),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Login",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40
                ),
                ),
                SizedBox(height: 50.0,),
                buildId(),
                 SizedBox(height: 20.0,),
                buildPassword(),
                buildForgetPassword(),
                buildLoginButton(),
                 SizedBox(height: 10.0,),
                buildSignUpButton()
              ],
            ),
            )
          ),
          Visibility(
            visible: _pivisiblity,
            child: Center(child: CircularProgressIndicator(backgroundColor: Colors.white,),))
        ],
      ),), value: SystemUiOverlayStyle.light) ,
    );
  }
} 