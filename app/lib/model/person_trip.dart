import 'package:app/model/expense.dart';

class PersonTrip {
  late String name;
  late List<Expence> tripExpenses = [];
  PersonTrip({
    required this.name,
    List<String>? tripExpenses,
  }) {
    tripExpenses = tripExpenses;
  }
  void addExpence(Expence _expence) {
    tripExpenses.add(_expence);
  }
}
