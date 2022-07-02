import 'package:app/database/categories_operations.dart';
import 'package:app/model/categories.dart';
import 'package:flutter/cupertino.dart';

class CategoriesProvider extends ChangeNotifier {
  CategoryOperations categoryOperations = CategoryOperations();
  late List<Category> categories = [];
  Future<List<Category>> getList() async {
    categories = CategoryOperations().getAllCategories() as List<Category>;
    return categories;
  }

  Future<void> addCategory(Category category) async {
    print("into add new category ");
    categoryOperations.insertCategory(category);

    print(categories);

    notifyListeners();
  }

  void removeCategory(Category category) {
    categoryOperations.deleteCategory(category);
    notifyListeners();
  }
}
