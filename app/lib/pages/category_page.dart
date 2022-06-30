import 'dart:math';

import 'package:app/database/categories_operations.dart';
import 'package:app/shared/style/colors.dart';
import 'package:flutter/material.dart';

import '../provider/categories_provider.dart';
import 'package:provider/provider.dart';
import '../model/categories.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  CategoryOperations categoryOperations = CategoryOperations();

  var categoryController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String categoty = "";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoriesProvider>(context);
    final Future<List<Category>> categories = provider.categories;
    return (Padding(
        padding: const EdgeInsets.all(1),
        child: Column(children: [
          Column(
            children: [
              const SizedBox(),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: FutureBuilder(
                    initialData: categories,
                    future: categoryOperations.getAllCategories(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        print("error while get all categories  ");
                        return (const Center(
                          child: Text("there is no data yet "),
                        ));
                      }
                      Object? data = snapshot.data;
                      final List<Category> list = data as List<Category>;
                      if (snapshot.hasData) {
                        print("we are in get all categories ");
                        // ignore: unused_local_variable

                        return (ListView.separated(
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.all(2),
                            itemCount: list.length,
                            separatorBuilder: (BuildContext, index) {
                              return const Divider(height: 1);
                            },
                            // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                            itemBuilder: (BuildContext, index) {
                              return Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    // color: categoriesColors[
                                    //     Random().nextInt(categoriesColors.length)]
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      list[index].categoryname,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    trailing: const Icon(Icons.card_travel),
                                  ),
                                ),
                              );
                            }));
                      }
                      return (const Center(
                        child: Text('no data yet '),
                      ));
                      // ignore: curly_braces_in_flow_control_structures
                      // else(
                      // return( Text("there is no data ")));
                      // )
                    }),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
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
                                  categoty = value.toString();

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
                              final _category = new Category(
                                  categoryid: 10, categoryname: categoty);
                              categoryOperations.insertCategory(_category);
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
              child: const Text("add new category "),
            ),
          )
        ])));
  }
}
