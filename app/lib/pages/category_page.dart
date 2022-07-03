import 'dart:math';

import 'package:app/database/categories_operations.dart';
import 'package:app/shared/style/colors.dart';
import 'package:flutter/material.dart';

import '../components/categoryWidget.dart';
import '../provider/categories_provider.dart';
import 'package:provider/provider.dart';
import '../model/categories.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  CategoryOperations categoryOperations = CategoryOperations();

  var categoryController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late Category _category;

  CategoriesProvider getProvider(BuildContext context) {
    return Provider.of<CategoriesProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<CategoriesProvider>(context);
    // _provider.categories = _provider.getList() as List<Category>;
    late String categotyValue;
    // ignore: unused_element

    // final Future<List<Category>> categories = provider.categories;
    return (Scaffold(
      body: FutureBuilder(
          // initialData: categories,
          future: Provider.of<CategoriesProvider>(context, listen: true)
              .getAllCategories(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : Consumer<CategoriesProvider>(
                  child: const Center(
                    child: Text('no data yet'),
                  ),
                  builder: (context, categoriesProvider, child) =>
                      categoriesProvider.categories.isEmpty
                          ? const Center(
                              child: Text('no data yet'),
                            )
                          : ListView.separated(
                              scrollDirection: Axis.vertical,
                              padding: const EdgeInsets.all(2),
                              itemCount: categoriesProvider.categories.length,
                              separatorBuilder: (BuildContext, index) {
                                return const Divider(height: 1);
                              },
                              // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                              itemBuilder: (BuildContext, index) => Dismissible(
                                  key: ValueKey(categoriesProvider
                                      .categories[index].categoryid),
                                  background: DeleteCategory(
                                    provider: categoriesProvider,
                                    index: index,
                                  ),
                                  // secondaryBackground: const editCategory(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: CatgoryWidget(
                                        provider: categoriesProvider,
                                        index: index),
                                  ))))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        // ignore: unnecessary_new

                        _category = Category(
                            categoryid: Random().nextInt(1000000),
                            categoryname: categotyValue);
                        //     categoryOperations.insertCategory(_category);
                        await _provider.addCategory(_category);

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
    ));
  }
}
