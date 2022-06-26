class Category {
  late int categoryid;
  late String categoryname;
  Category({
    required this.categoryid,
    required this.categoryname,
  });
  Category.fromMap(Map map) {
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
