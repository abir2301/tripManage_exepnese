import '../model/trip.dart';

// class TripOperation {
//   late TripOperation tripOperation;
//   final dbProvider = DatabaseFile.instance;

//   Future<Trip> createnewtrip(Trip trip) async {
//     final db = await dbProvider.database;
//     final id = await db.insert('trip', trip.toMap());
//     print("trip inserted suuscesfully ");
//     print("Trip id ${trip.tripId} , $id ");
//     return trip.copy(tripId: id);
//   }

//   Future<List<Trip>> getAlltrips() async {
//     print("we are in get all trips ");
//     final db = await dbProvider.database;
//     List<Map<String, dynamic>> allRows = await db.query('trip');
//     print("get all  trip rows is done ");
//     List<Trip> triplist = allRows.map((trip) => Trip.fromMap(trip)).toList();
//     print("get all trips  ");
//     return triplist;
//   }

//   updateTrip(Trip trip) async {
//     final db = await dbProvider.database;
//     db.update('trip', trip.toMap(),
//         where: "tripId=?", whereArgs: [trip.tripId]);
//   }

//   deleteTrip(Trip trip) async {
//     final db = await dbProvider.database;
//     await db.delete('trip', where: 'tripId=?', whereArgs: [trip.tripId]);
//   }

//   sorttripsbyname() {}
//   sorttripsbydate() {}
//   serachtripbyname() {}
// }
