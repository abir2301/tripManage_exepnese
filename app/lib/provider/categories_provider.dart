import 'package:app/database/categories_operations.dart';
import 'package:app/model/categories.dart';
import 'package:flutter/cupertino.dart';

class CategoriesProvider extends ChangeNotifier {
  CategoryOperations categoryOperations = CategoryOperations();
  var categories = CategoryOperations().getAllCategories();

  void addCategory(Category category) {
    categoryOperations.insertCategory(category);
    print(categories);
    notifyListeners();
  }

  void removeCategory(Category category) {
    categoryOperations.deleteCategory(category);
    notifyListeners();
  }
}
