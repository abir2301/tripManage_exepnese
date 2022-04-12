import 'package:app/database/dbhelper.dart';

import '../model/categories.dart';

class CategoryOperations {
  late CategoryOperations categoryOperations;

  final dbhelper = DBhelper.instance;

  createCategory(Categor category) async {
    final db = await dbhelper.database;
    db.insert('category', category.toMap());
    print("category inserted suuscesfully ");
  }

  Future<List<Categor>> getAllCategories() async {
    print("we are in get all Categorie ");
    final db = await dbhelper.database;
    List<Map<String, dynamic>> allRows = await db.query('category');
    print("get alla rows is done ");
    List<Categor> categories =
        allRows.map((categor) => Categor.fromMap(categor)).toList();
    print("get all categories  ");
    return categories;
  }

  updateCategory(Categor category) async {
    final db = await dbhelper.database;
    db.update('category', category.toMap(),
        where: "categoryId=?", whereArgs: [category.categoryid]);
  }

  deleteCategory(Categor category) async {
    final db = await dbhelper.database;
    await db.delete('category',
        where: 'categoryId=?', whereArgs: [category.categoryid]);
  }
}
