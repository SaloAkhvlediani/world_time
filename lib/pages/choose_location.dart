import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Choose_location extends StatefulWidget {
  const Choose_location({Key? key}) : super(key: key);

  @override
  State<Choose_location> createState() => _Choose_locationState();
}

class _Choose_locationState extends State<Choose_location> {
  //int counter = 1;
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async{
   WorldTime instance = locations[index];
   await instance.getTime();
   //navigate home screen
    Navigator.pop(context, {
      'location':instance.location,
      'flag' : instance.flag,
      'time': instance.time,
      'isDaytime':instance.isDaytime,
    });

  }
  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('choose  a location '),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child:  Card(
              child: ListTile(
               onTap: () {
                 //print(locations[index].location);
                 updateTime(index);

               },
              title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:  AssetImage('assets/${locations[index].flag}'),
                ),
            ),
              ),
            );

          }
      ),
      // TextButton(
      //     onPressed: () {
      //       setState(() {
      //         counter += 1;
      //       });
      //     },
         // child: Text('counter is $counter')),
      //Text('choose  a location screen'),
    );
  }
}
