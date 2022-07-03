import 'package:app/model/categories.dart';
import 'package:app/provider/categories_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatgoryWidget extends StatelessWidget {
  const CatgoryWidget({Key? key, required this.provider, required this.index})
      : super(key: key);
  final CategoriesProvider provider;
  final int index;
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        title: Text(
          provider.categories[index].categoryname,
          style: const TextStyle(fontSize: 20),
        ),
        trailing: const Icon(Icons.card_travel),
      ),
    );
  }
}

class DeleteCategory extends StatelessWidget {
  DeleteCategory({Key? key, required this.provider, required this.index})
      : super(key: key);
  late CategoriesProvider provider;
  late int index;

  @override
  Widget build(BuildContext context) {
    late Category helper = provider.categories[index];
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Do you want to delete the ${helper.categoryname}?',
            maxLines: 2,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  child: Text('Delete it'),
                  onPressed: () async {
                    provider.removeCategory(helper);
                    provider.categories.removeAt(index);
                  },
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  child: Text('Return'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
