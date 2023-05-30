import 'package:http/http.dart' ;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location = ''; //location name for the ui
  String time = ''; //the time in that location
  String flag = ''; //url to an asset flag icon
  String url = ''; // location url for api endpoint
  bool isDaytime=true;
  WorldTime({this.location='', this.flag='', this.url=''});

 Future<void> getTime() async {
   try{
     //make the request
   Response  response = await get( Uri.parse('https://worldtimeapi.org/api/timezone/$url'));  //  var response =  Uri.https('https://worldtimeapi.org/api/timezone/Europe/$url'); //.
   //   const String apiEndpoint ='https://worldtimeapi.org/api/timezone/Europe/London';
   //   final Uri urls = Uri.parse(apiEndpoint);
   //   final response = await get(urls);
     Map data = jsonDecode(response.body);


      //print(data);
     //get properties from data
     String datetime = data['datetime'];
     String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);
     //create DateTime object
     DateTime now = DateTime.parse(datetime);
     now = now.add(Duration(hours: int.parse(offset)));
     //set the time property
     //time=now.toString();
     isDaytime=  now.hour>6 && now.hour <8 ? true: false;
     time= DateFormat.jm().format(now);
   }
   catch(e){
     print('caught error: $e');
     time='could not get time data';
   }

  }
}





