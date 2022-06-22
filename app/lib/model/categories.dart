class Categor {
  late int categoryid;
  late String categoryname;
  Categor({
    required this.categoryname,
  });
  Categor.fromMap(Map map) {
    categoryid = map['categoryId'];
    categoryname = map['categoryName'];
    print("frommap");
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'categoryName': categoryname,
    };
    print("to map ");
    return map;
  }
}
