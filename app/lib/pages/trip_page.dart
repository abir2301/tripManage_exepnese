import 'package:app/presentation/trip/add_new_trip.dart';
//import 'package:app/provider/trip_provider.dart';
import 'package:app/provider/trip_provider.dart' ;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripPage extends StatefulWidget {
  const TripPage({Key? key}) : super(key: key);

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  @override
  Widget build(BuildContext context) {
  TripProvider provider = Provider.of<TripProvider>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 20,
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => AddTrip(provider: provider)),
            // );
          },
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "New Trip ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
       // ignore: avoid_unnecessary_containers
        body: Center(
          child: Column(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                child: const Text('trip page '),
              ),
            ],
          ),
        ));
  }
}
