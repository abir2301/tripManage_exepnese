import 'package:app/provider/categories_provider.dart';
import 'package:flutter/material.dart';

import '../model/categories.dart';

// ignore: must_be_immutable
class CategoryDialog extends StatefulWidget {
  CategoryDialog(
      {Key? key,
      required this.skipFunction,
      required this.category,
      required this.provider})
      : super(key: key);

  late Category category;
  late CategoriesProvider provider;
  late Function skipFunction;

  @override
  State<CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var categoryController = TextEditingController();

  late String categoryName;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    categoryController.text = widget.category.categoryname;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    //  initialValue: category.categoryname,
                    decoration: InputDecoration(
                      labelText: "category title    ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    keyboardType: TextInputType.name,
                    controller: categoryController,
                    onSaved: (String) {},
                    validator: (String? value) {
                      categoryName = value.toString();

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
            onPressed: () => widget.skipFunction(),
            child: const Text('Cancel'),
          ),
          GestureDetector(
            child: TextButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  // ignore: unnecessary_new
                  widget.category.categoryname = categoryName;

                  //     categoryOperations.insertCategory(_category);
                  widget.provider.updateCatgory(widget.category);
                  categoryController.clear();

                  widget.skipFunction();
                }
              },
              child: const Text('SAVE'),
            ),
          ),
        ],
      ),
    );
  }
}
