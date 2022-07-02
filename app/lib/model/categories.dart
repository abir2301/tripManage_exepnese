class Category {
  late int categoryid;
  late String categoryname;
  Category({
    categoryid,
    required this.categoryname,
  }) {
    this.categoryid = categoryid;
  }
  Category.fromMap(Map map) {
    categoryid = map['categoryId'];
    categoryname = map['categoryName'];
    // ignore: avoid_print
    print("frommap");
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'categoryId': categoryid,
      'categoryName': categoryname,
    };
    // ignore: avoid_print
    print("to map ");
    return map;
  }

  @override
  String toString() {
    return "Category{ id :$categoryid , name :$categoryname}";
  }
}
