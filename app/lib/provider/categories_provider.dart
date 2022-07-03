import 'package:app/database/categories_operations.dart';
import 'package:app/model/categories.dart';
import 'package:flutter/cupertino.dart';

class CategoriesProvider extends ChangeNotifier {
  CategoryOperations categoryOperations = CategoryOperations();
  late List<Category> categories = [];
  void getList() async {
    categories = await CategoryOperations().getAllCategories();
    // notifyListeners();
    // return categories;
  }

  Future<void> addCategory(Category category) async {
    print("into add new category ");
    categoryOperations.insertCategory(category);
    getList();

    print(categories);
  }

  void removeCategory(Category category) {
    categoryOperations.deleteCategory(category);
    getList();
  }
}
