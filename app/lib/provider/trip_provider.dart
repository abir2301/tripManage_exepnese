import 'package:app/database/trip_operations.dart';
import 'package:flutter/cupertino.dart';

import '../database/dbhelper.dart';
import '../model/trip.dart';

class TripProvider extends ChangeNotifier {
  late List<Trip> tripList;
  TripOperation tripOperation = TripOperation();
  final dbhelper = DBhelper.instance;

  Future insertTrip(Trip trip) async {
    tripList.add(trip);
    tripOperation.createnewtrip(trip);
    notifyListeners();
  }

  Future getAllTrips() async {
  tripList =  await tripOperation.getAlltrips();
  notifyListeners();
  }
}
