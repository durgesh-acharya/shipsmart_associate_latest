
// To parse this JSON data, do
//
//     final associate = associateFromJson(jsonString);
// @dart=2.9
import 'dart:convert';

Associate associateFromJson(String str) => Associate.fromJson(json.decode(str));

String associateToJson(Associate data) => json.encode(data.toJson());

class Associate {
    Associate({
        this.associateid,
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

    factory Associate.fromJson(Map<String, dynamic> json) => Associate(
        associateid: json["associateid"],
        associatecoo: json["associatecoo"],
        associatestate: json["associatestate"],
        associatecluster: json["associatecluster"],
        associatetsm: json["associatetsm"],
        associatesupportexe: json["associatesupportexe"],
        associatefranchisee: json["associatefranchisee"],
        associatefullname: json["associatefullname"],
        associatefirmname: json["associatefirmname"],
        associateaddress: json["associateaddress"],
        associateresiaddress: json["associateresiaddress"],
        associatepincode: json["associatepincode"],
        associatemobile: json["associatemobile"],
        associateemail: json["associateemail"],
        associatepan: json["associatepan"],
        associategst: json["associategst"],
        assciateadharfronturl: json["assciateadharfronturl"],
        associateadharbackurl: json["associateadharbackurl"],
        associatepanurl: json["associatepanurl"],
        associatepicurl: json["associatepicurl"],
        associatepassword: json["associatepassword"],
        associateactive: json["associateactive"],
        fromcooid: json["fromcooid"],
        fromcooname: json["fromcooname"],
        fromcoostateid: json["fromcoostateid"],
        tsmid: json["tsmid"],
        tsmname: json["tsmname"],
        supportexeid: json["supportexeid"],
        supportexename: json["supportexename"],
        franchiseeid: json["franchiseeid"],
        franchiseename: json["franchiseename"],
        stateid: json["stateid"],
        statename: json["statename"],
        clusterid: json["clusterid"],
        clustername: json["clustername"],
    );

    Map<String, dynamic> toJson() => {
        "associateid": associateid,
        "associatecoo": associatecoo,
        "associatestate": associatestate,
        "associatecluster": associatecluster,
        "associatetsm": associatetsm,
        "associatesupportexe": associatesupportexe,
        "associatefranchisee": associatefranchisee,
        "associatefullname": associatefullname,
        "associatefirmname": associatefirmname,
        "associateaddress": associateaddress,
        "associateresiaddress": associateresiaddress,
        "associatepincode": associatepincode,
        "associatemobile": associatemobile,
        "associateemail": associateemail,
        "associatepan": associatepan,
        "associategst": associategst,
        "assciateadharfronturl": assciateadharfronturl,
        "associateadharbackurl": associateadharbackurl,
        "associatepanurl": associatepanurl,
        "associatepicurl": associatepicurl,
        "associatepassword": associatepassword,
        "associateactive": associateactive,
        "fromcooid": fromcooid,
        "fromcooname": fromcooname,
        "fromcoostateid": fromcoostateid,
        "tsmid": tsmid,
        "tsmname": tsmname,
        "supportexeid": supportexeid,
        "supportexename": supportexename,
        "franchiseeid": franchiseeid,
        "franchiseename": franchiseename,
        "stateid": stateid,
        "statename": statename,
        "clusterid": clusterid,
        "clustername": clustername,
    };
}
