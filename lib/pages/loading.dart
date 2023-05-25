import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //String time='loading';
  void setupWorldTime() async {
    WorldTime instance=WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
   await instance.getTime();
   Navigator.pushReplacementNamed((context), '/home', arguments: {
     'location':instance.location,
     'flag' : instance.location,
     'time': instance.time,
     'isDaytime':instance.isDaytime,

   });

   // print(instance.time);
    // setState(() {
    //   time=instance.time;
    // });
  }
  // void getdata() async {
  //
  //   // ბიექტი ვერ დავაბრუნე
  //   Response response = await
  //   http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));
  //   print(response.body);
  //   Map data = jsonDecode(response.body) ;
  //   print(data);
  //   print(data['title']);
  //
  //   //simulate network request fro a username
  //   // String username = await Future.delayed(Duration(seconds: 3), () {
  //   //   //print('olalal');
  //   //   return 'olalal';
  //   // });
  //   //
  //   // String bio = await Future.delayed(Duration(seconds: 2), () {
  //   //   //print('lcm, kajckasc, kac');
  //   //   return 'lcm, kajckasc, kac';
  //   // });
  //   // //print('statment');
  //   // print('$username -$bio');

  @override
  void initState() {
    super.initState();
    //print('initstate function ran');
    //getTime();
    setupWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
       child:SpinKitCubeGrid(
         color: Colors.white,
         size: 80.0,
       ),
      ),

      // Padding(
      //   padding: EdgeInsets.all(50.0),
      //   child: Text('loading'),   //Text(time),
      // ),
      //Text('Loading screen'),
    );
  }
}
