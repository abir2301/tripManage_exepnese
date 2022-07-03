import 'dart:math';

import 'package:app/model/categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/categories_operations.dart';
import '../provider/categories_provider.dart';

class CategoriesTest extends StatefulWidget {
  CategoriesTest({Key? key}) : super(key: key);

  @override
  State<CategoriesTest> createState() => _CategoriesTestState();
}

class _CategoriesTestState extends State<CategoriesTest> {
  late CategoriesProvider provider;
  var categoryController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String categotyValue;
  late Category _category;

  late List<Category> categories = [];

  CategoriesProvider getProvider(BuildContext context) {
    return Provider.of<CategoriesProvider>(context);
  }

  CategoryOperations categoryOperations = CategoryOperations();

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    print("didmount");
    super.didChangeDependencies();
    provider = getProvider(context);
    //provider.categories = await categoryOperations.getAllCategories();
    categories = await provider.categories;
    print("didmount222");
    print(" printed categories $categories");
  }

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<CategoriesProvider>(
        create: (_) => CategoriesProvider(),
        builder: (context, _) {
          return Scaffold(
            body: categories.isNotEmpty
                ? Consumer<CategoriesProvider>(
                    builder: (context, value, child) {
                    return ListView.separated(
                      itemCount: categories.length,
                      separatorBuilder: (BuildContext, index) {
                        return const Divider(height: 1);
                      },
                      itemBuilder: (BuildContext, index) {
                        return Padding(
                          padding: const EdgeInsets.all(3),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              // color: categoriesColors[
                              //     Random().nextInt(categoriesColors.length)]
                            ),
                            child: GestureDetector(
                              // onTap: () => {provider.removeCategory(_category)},
                              child: ListTile(
                                title: Text(
                                  categories[index].categoryname,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                trailing: const Icon(Icons.card_travel),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  })
                : const Center(
                    child: Text('no categorie yet try to  create new one ')),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => Container(
                  height: 100,
                  child: AlertDialog(
                    scrollable: true,
                    // contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    title: const Text('new category '),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.18,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Form(
                              key: formKey,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "category title    ",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                keyboardType: TextInputType.name,
                                controller: categoryController,
                                onSaved: (String) {},
                                validator: (String? value) {
                                  categotyValue = value.toString();

                                  if (value!.isEmpty) {
                                    return ("value should not be empty ");
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      GestureDetector(
                        child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              // ignore: unnecessary_new

                              _category = Category(
                                  categoryid: Random().nextInt(1000000),
                                  categoryname: categotyValue);
                              //     categoryOperations.insertCategory(_category);
                              provider.addCategory(_category);

                              Navigator.pop(context, 'OK');
                            }
                          },
                          child: const Text('SAVE'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              label: const Text("add new category "),
              icon: const Icon(Icons.add),
            ),
          );
        },
      );
}
