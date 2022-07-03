import 'package:app/database/categories_operations.dart';
import 'package:app/model/categories.dart';
import 'package:flutter/cupertino.dart';

import '../database/dbhelper.dart';

class CategoriesProvider extends ChangeNotifier {
  CategoryOperations categoryOperations = CategoryOperations();

  List<Category> categories = [];

  final dbhelper = DBhelper.instance;

  Future addCategory(Category category) async {
    categories.add(category);

    print("into insert new category ");
    final db = await dbhelper.database;
    db
        .insert('category', category.toMap())
        .then((value) => {print("category inserted suuscesfully ")});
    notifyListeners();
  }

  Future<void> getAllCategories() async {
    final db = await dbhelper.database;
    List<Map<String, dynamic>> allRows = await db.query('category');
    categories = allRows.map((categor) => Category.fromMap(categor)).toList();

    print("print all categories $categories");
    // notifyListeners();
  }

  //get all category list
  Future<List<Category>> getList() async {
    return await CategoryOperations().getAllCategories();
    //notifyListeners();
  }

  //add new category
  getListCategories() async {
    categories = await getList();
    notifyListeners();
  }

  // Future<void> addCategory(Category category) async {
  //   categories.add(category);

  //   categoryOperations.insertCategory(category);
  //   print(categories);
  //   notifyListeners();
  // }

// still
//update category
  void removeCategory(Category category) {
    categoryOperations.deleteCategory(category);
    notifyListeners();
  }

  void updateCatgory(Category category) {
    categoryOperations.updateCategory(category);
    notifyListeners();
  }
}
