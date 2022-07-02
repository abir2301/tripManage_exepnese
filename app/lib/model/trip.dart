import 'package:app/model/person_trip.dart';
import 'package:app/model/place.dart';

class Trip {
  late int id;
  late String name;
  late String imageUrl;
  late String description;
  late int totalAmount;
  late int restAmount = totalAmount;
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
    required this.totalAmount,
   
    required this.curency,
  });
  void addPerson(PersonTrip _personTrip) {
    personTrip.add(_personTrip);
  }

  void addPlaceTovisit(Place place) {
    PlaceToVisit.add(place);
  }
}
