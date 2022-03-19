// @dart=2.9
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shipsmart_associate/screens/loginscreen.dart';
import 'package:http/http.dart' as http;

class DashBoard extends StatefulWidget {
  const DashBoard({ Key key }) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  int associateid;
  bool _piindicator = false;
  List datalist;
 

  

  Future getAssociateid()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var assoid = sharedPreferences.getInt("assoicateid");
    setState(() {
      associateid = assoid;
    });

  }

 

  Future removeCredential()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("assoicateid");
  }

  Future getAssociateDetail(int id)async{
    final String url = "http://shipsmart-env.eba-4nc5kenf.us-east-2.elasticbeanstalk.com/associate/alldetailsbyid/${id}";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      List jsonresponse = jsonDecode(response.body);
      Map<String,dynamic> data = jsonresponse[0]['data'];
    //  var data = jsonresponse[0]['data'] as List;
    List<Associates> associatedata;

     data.forEach((k, v) => associatedata.add(Associates()));
    
     print(associatedata);
     
    }
  

  }
 
// Grid Containers
//consignor
  Widget gridContainerConsignor(){
    return  GestureDetector(
      onTap: () => print("button clicked"),
      child: Container(
                  
                  color: Color(0xff000080),
                  margin: EdgeInsets.all(5.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                    Icon(Icons.person,color: Colors.white,size: 40,),
                    SizedBox(height: 5.0,),
                    Text("Consignor",style: TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.bold),)
                  ],),
                ),
    );
  }
  //docket
    Widget gridContainerDocket(){
    return  GestureDetector(
      onTap: () => print("button clicked"),
      child: Container(
                  
                  color: Color(0xff000080),
                  margin: EdgeInsets.all(5.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                    Icon(Icons.document_scanner,color: Colors.white,size: 40,),
                    SizedBox(height: 5.0,),
                    Text("Docket",style: TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.bold),)
                  ],),
                ),
    );
  }
  //operation
   Widget gridContainerOperation(){
    return  GestureDetector(
      onTap: () => print("button clicked"),
      child: Container(
                  
                  color: Color(0xff000080),
                  margin: EdgeInsets.all(5.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                    Icon(Icons.track_changes,color: Colors.white,size: 40,),
                    SizedBox(height: 5.0,),
                    Text("Operation",style: TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.bold),)
                  ],),
                ),
    );
  }
  //tools
  Widget gridContainerTools(){
    return  GestureDetector(
      onTap: () => print("button clicked"),
      child: Container(
                  
                  color: Color(0xff000080),
                  margin: EdgeInsets.all(5.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                    Icon(Icons.settings,color: Colors.white,size: 40,),
                    SizedBox(height: 5.0,),
                    Text("Tools",style: TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.bold),)
                  ],),
                ),
    );
  }

  Widget buildNaigationDrawer(){
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.0),
            color: Color(0xff000080),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:28.0),
                  child: Text("name",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Text("id",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: ListTile(
              leading: Icon(Icons.person,color: Color(0xff000080),size: 24.0,),
              title: Text("Profile",style: TextStyle(color: Color(0xff000080),fontSize: 16.0),),
            ),
          ),
          Divider(color: Colors.grey),
            ListTile(
            leading: Icon(Icons.person,color: Color(0xff000080),size: 24.0,),
            title: Text("KYC",style: TextStyle(color: Color(0xff000080),fontSize: 16.0),),
          ),
           Divider(color: Colors.grey),
           ListTile(
              leading: Icon(Icons.logout,color: Color(0xff000080),size: 24.0,),
              title: Text("Log Out",style: TextStyle(color: Color(0xff000080),fontSize: 16.0),),
              onTap: ()async{
                   setState(() {
              _piindicator = true;
            });
                removeCredential().whenComplete(() => Timer(Duration(microseconds: 3000), ()=> Get.off(LoginScreen())));
              },
            ),
            Divider(color: Colors.grey),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAssociateid().whenComplete(() => getAssociateDetail(associateid));
    
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000080),
        title: Row(
          children: [
            Text("Welcome", style: TextStyle(fontSize: 18),),
            SizedBox(width: 10.0,),
             
             Text("(${associateid})",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,),)
          ],
        ),
        
        
      ),
      drawer: buildNaigationDrawer(),
      body:  GestureDetector(child: Stack(children: [
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding:  EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 50
              ),
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24, right: 24),
              children: [
              gridContainerConsignor(),
              gridContainerDocket(),
              gridContainerOperation(),
              gridContainerTools()
               
                
              ],
              ),
          ),
          Visibility(
            visible: _piindicator,
            child: Center(child: CircularProgressIndicator(backgroundColor: Color(0xff000080),),))
        ],)),
    );
  }

}

class Associates{
 int associateid;
    int associatecoo;
    int associatestate;
    int associatecluster;
    int associatetsm;
    int associatesupportexe;
    int associatefranchisee;
    String associatefullname;
    String associatefirmname;
    String associateaddress;
    String associateresiaddress;
    int associatepincode;
    String associatemobile;
    String associateemail;
    String associatepan;
    String associategst;
    String assciateadharfronturl;
    String associateadharbackurl;
    String associatepanurl;
    String associatepicurl;
    String associatepassword;
    int associateactive;
    int fromcooid;
    String fromcooname;
    int fromcoostateid;
    int tsmid;
    String tsmname;
    int supportexeid;
    String supportexename;
    int franchiseeid;
    String franchiseename;
    int stateid;
    String statename;
    int clusterid;
    String clustername;

    Associates(
     { this.associateid,
        this.associatecoo,
        this.associatestate,
        this.associatecluster,
        this.associatetsm,
        this.associatesupportexe,
        this.associatefranchisee,
        this.associatefullname,
        this.associatefirmname,
        this.associateaddress,
        this.associateresiaddress,
        this.associatepincode,
        this.associatemobile,
        this.associateemail,
        this.associatepan,
        this.associategst,
        this.assciateadharfronturl,
        this.associateadharbackurl,
        this.associatepanurl,
        this.associatepicurl,
        this.associatepassword,
        this.associateactive,
        this.fromcooid,
        this.fromcooname,
        this.fromcoostateid,
        this.tsmid,
        this.tsmname,
        this.supportexeid,
        this.supportexename,
        this.franchiseeid,
        this.franchiseename,
        this.stateid,
        this.statename,
        this.clusterid,
        this.clustername,
     });
}