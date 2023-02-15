import 'dart:io';

import 'package:app/model/person_trip.dart';
import 'package:app/model/place.dart';

class Trip {
  late int id;
  late String name;
  late File imageUrl;
  late String description;
  late String totalAmount;
  late String restAmount = totalAmount;
  late String curency;
  late String startDate;
  late String endDate;
  late List<PersonTrip> personTrip = [];

  // ignore: non_constant_identifier_names
  late List<Place> PlaceToVisit = [];

  Trip({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
    required this.totalAmount,
    required this.curency,
  }) {
    restAmount = totalAmount;
  }
  void addPerson(PersonTrip _personTrip) {
    personTrip.add(_personTrip);
  }

  void addPlaceTovisit(Place place) {
    PlaceToVisit.add(place);
  }

  Trip copy(
      {int? id,
      String? name,
      String? description,
      String? startDate,
      String? endDate,
      File? imageUrl,
      String? totalAmount,
      String? curency}) {
    return Trip(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        imageUrl: imageUrl ?? this.imageUrl,
        totalAmount: totalAmount ?? this.totalAmount,
        curency: curency ?? this.curency);
  }

  int? getid() {
    return id;
  }

  // get from data base
  Trip.fromMap(dynamic obj) {
    id = obj['tripId'];
    name = obj['tripName'];
    description = obj['tripDescription'];
    startDate = obj['trip_Date_Start'];
    endDate = obj['trip_date_finich'];
    imageUrl = obj['trip_Image'] as File;
    totalAmount = obj['totalAmount'];
    curency = obj['curency'];
  }
  //insert into data base
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'tripName': name,
      'tripDescription': description,
      'trip_Date_Start': startDate,
      'trip_date_finich': endDate,
      'trip_Image': imageUrl.path,
      'totalEmount': totalAmount,
      'curency': curency,
    };
    return map;
  }
}
