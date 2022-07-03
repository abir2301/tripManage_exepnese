import 'dart:math';

import 'package:app/database/categories_operations.dart';
import 'package:app/shared/style/colors.dart';
import 'package:flutter/material.dart';

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
  var provider;
  CategoriesProvider getProvider(BuildContext context){
    return   Provider.of<CategoriesProvider>(context);
  }
  @override
  void initState() {
    super.initState();
    //provider = Provider.of<CategoriesProvider>(context);
    getProvider(context);
    
    //refrech();
  }

  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<CategoriesProvider>(context);
    late List<Category> categories = [];
    late String categotyValue;
    // ignore: unused_element

    // final Future<List<Category>> categories = provider.categories;
    return (Scaffold(
      body: FutureBuilder(
          // initialData: categories,
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
            if (snapshot.hasData)
             {
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
                        child: GestureDetector(
                          // onTap: () => {provider.removeCategory(_category)},
                          child: ListTile(
                            title: Text(
                              list[index].categoryname,
                              style: const TextStyle(fontSize: 20),
                            ),
                            trailing: const Icon(Icons.card_travel),
                          ),
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
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // ignore: unnecessary_new

                        _category = new Category(
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
    ));
  }
}
