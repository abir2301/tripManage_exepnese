import 'package:app/database/dbhelper.dart';

import '../model/categories.dart';

class CategoryOperations {
  late CategoryOperations categoryOperations;

  final dbhelper = DBhelper.instance;

  insertCategory(Category category) async {
    final db = await dbhelper.database;
    db.insert('category', category.toMap());
    print("category inserted suuscesfully ");
  }

  Future<List<Category>> getAllCategories() async {
    print("we are in get all Categorie ");
    final db = await dbhelper.database;
    List<Map<String, dynamic>> allRows = await db.query('category');
    print("get alla rows is done ");
    List<Category> categories =
        allRows.map((categor) => Category.fromMap(categor)).toList();
    print("get all categories  ");
    return categories;
  }

  updateCategory(Category category) async {
    final db = await dbhelper.database;
    db.update('category', category.toMap(),
        where: "categoryId=?", whereArgs: [category.categoryid]);
  }

  deleteCategory(Category category) async {
    final db = await dbhelper.database;
    await db.delete('category',
        where: 'categoryId=?', whereArgs: [category.categoryid]);
  }
}
