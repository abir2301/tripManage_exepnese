import 'package:app/model/categories.dart';
import 'package:flutter/cupertino.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Category> categories = [
    Category(categoryid: 0, categoryname: "transport "),
  ];
  void addCategory(Category category) {
    categories.add(category);
    notifyListeners();
  }

  void removeCategory(Category category) {
    categories.remove(category);
    notifyListeners();
  }
}
