import 'package:app/database/dbhelper.dart';

import '../model/trip.dart';

class TripOperation {
  late TripOperation tripOperation;
  final dbProvider = DBhelper.instance;

  Future<Trip> createnewtrip(Trip trip) async {
    final db = await dbProvider.database;
    final id = await db.insert('trip', trip.toMap());
    print("trip inserted suuscesfully ");
    print("Trip id ${trip.id} , $id ");
    return trip.copy(id: id);
  }

  Future<List<Trip>> getAlltrips() async {
    print("we are in get all trips ");
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('trip');
    print("get all  trip rows is done ");
    List<Trip> triplist = allRows.map((trip) => Trip.fromMap(trip)).toList();
    print("get all trips  ");
    return triplist;
  }

  updateTrip(Trip trip) async {
    final db = await dbProvider.database;
    db.update('trip', trip.toMap(),
        where: "tripId=?", whereArgs: [trip.id]);
  }

  deleteTrip(Trip trip) async {
    final db = await dbProvider.database;
    await db.delete('trip', where: 'tripId=?', whereArgs: [trip.id]);
  }

  sorttripsbyname() {}
  sorttripsbydate() {}
  serachtripbyname() {}
}
