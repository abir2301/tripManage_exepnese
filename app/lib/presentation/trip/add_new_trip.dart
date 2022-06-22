// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:image_picker/image_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class NewTrip extends StatefulWidget {
  const NewTrip({Key? key}) : super(key: key);

  @override
  State<NewTrip> createState() => _NewTripState();
}

class _NewTripState extends State<NewTrip> {
  final format = DateFormat("yyyy-MM-dd");
  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  void takephoto(ImageSource source) async {
    // ignore: deprecated_member_use
    // ignore: non_constant_identifier_names
    final PickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = PickedFile!;
    });
  }

  @override
  Widget build(BuildContext context) {
    var Titlecontroller = TextEditingController();
    var descriptioncontroller = TextEditingController();
    var formkey = GlobalKey<FormState>();
    var datestartcontroler = TextEditingController();
    var dateFinishcontroller = TextEditingController();
    var personnamecontroler = TextEditingController();
    var depositamountcontroler = TextEditingController();
    late DateTime valur;
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text(' New Trip '),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
              padding:  const EdgeInsets.all(8),
              child: Form(
                key: formkey,
                child: Column(
                children: [
                  
                ],
              )),),
            ),
          )),
    );
  }
}
