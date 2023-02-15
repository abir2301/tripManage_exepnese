// ignore_for_file: deprecated_member_use, sized_box_for_whitespace, must_be_immutable

import 'dart:io';

import 'package:app/provider/trip_provider.dart';
import 'package:app/shared/Utility.dart';
import 'package:app/shared/style/colors.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:provider/provider.dart';

import '../../model/trip.dart';

class AddTrip extends StatelessWidget {
  AddTrip({Key? key, required provider}) : super(key: key);
  late TripProvider provider;
  var Titlecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var datestartcontroler = TextEditingController();
  var dateFinishcontroller = TextEditingController();
  //var personnamecontroler = TextEditingController();
  var depositamountcontroler = TextEditingController();
  late String _curency = "dt ";
  late String dateStart;
  late String dateEnd;
  late DateTime valur;
  bool _load = false;
  late File _imageFile;
  final format = DateFormat("yyyy-MM-dd");

  late String imageString;
  Future takephoto(ImageSource source) async {
    // ignore: deprecated_member_use
    // ignore: non_constant_identifier_names
    try {
      final file = await ImagePicker().pickImage(source: source);
      if (file == null) return;
      final File temporyimage = File(file.path);
      // setState(() {
      //   this._imageFile = temporyimage;
      //   imageString = Utility.base64String(_imageFile!.readAsBytesSync());

      //   _load = true;
      // });
    } on PlatformException catch (e) {
      print("failed to pick image :$e");
    }
  }

  Widget inkwellbuttomsheet() {
    return Container(
      height: 80,

      // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            // ignore: prefer_const_constructors
            child: Text(
              "choose your trip image ",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  takephoto(ImageSource.camera);
                },
                icon: const Icon(Icons.camera),
                tooltip: "Camera",
              ),
              IconButton(
                onPressed: () {
                  takephoto(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
                tooltip: "Gallery",
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text(' New Trip '),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                              height: 150,
                              child: _load == true
                                  ? Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: FileImage(_imageFile),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      height: 80,
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: NetworkImage(
                                              "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      height: 100,
                                    )),
                          Positioned(
                              top: 10,
                              right: 20,
                              child: InkWell(
                                onTap: () => showModalBottomSheet(
                                    context: context,
                                    builder: (Builder) => inkwellbuttomsheet()),
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              )),
                          const Positioned(
                              top: 50,
                              left: 100,
                              child: Text("pick your journey image "))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          onSaved: (string) {},
                          onFieldSubmitted: (value) {},
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          decoration: InputDecoration(
                            labelText: "Trip title ",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return " Title  must not be empty   ";
                            }
                            return null;
                          },
                          controller: Titlecontroller,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          minLines: 1,
                          maxLines: 10,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          decoration: InputDecoration(
                            labelText: "Trip description  ",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          keyboardType: TextInputType.multiline,
                          onFieldSubmitted: (value) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return " description   must not be empty   ";
                            }
                            return null;
                          },
                          controller: descriptioncontroller,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: DateTimeField(
                                  controller: datestartcontroler,
                                  /* validator: (value) {
                                  if (value != null) {
                                    return " Date_start  Trip   must not be empty   ";
                                  }
                                  return null;
                                },*/
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.calendar_today,
                                      color: green(),
                                    ),
                                    labelText: "date_start",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                  format: format,
                                  onShowPicker: (context, currentValue) async {
                                    final date = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        initialDate:
                                            currentValue ?? DateTime.now(),
                                        lastDate: DateTime(2100));
                                    if (date != null) {
                                      dateStart = date.toString();
                                      print(" date_start est ${dateStart}");

                                      return date;
                                    }
                                  }),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(4),
                                child: Center(
                                  child: Text(
                                    "to",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: green()),
                                  ),
                                )),
                            Expanded(
                              child: DateTimeField(
                                  controller: dateFinishcontroller,
                                  /* validator: (value) {
                                  if (date_finish != null) {
                                    return " Date_finish  Trip   must not be empty   ";
                                  }
                                  return null;
                                },*/
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.calendar_today,
                                      color: green(),
                                    ),
                                    labelText: "date_finish",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                  format: format,
                                  onShowPicker: (context, currentValue) async {
                                    final date = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        initialDate: DateTime.now(),
                                        lastDate: DateTime(2100));
                                    if (date != null) {
                                      dateEnd = date.toString();
                                      print(" la date_finish est ${dateEnd}}");
                                      return date;
                                    }
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "trip total amount   ",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  keyboardType: TextInputType.number,
                                  onFieldSubmitted: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return " amount must be >0  ";
                                    }
                                    return null;
                                  },
                                  controller: depositamountcontroler,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Container(
                                    padding: const EdgeInsets.only(left: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border:
                                            Border.all(color: Colors.white54)),
                                    alignment: Alignment.center,
                                    // height: 50,
                                    // width: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          _curency,
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                        IconButton(
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color: white(),
                                            ),
                                            onPressed: () {
                                              showCurrencyPicker(
                                                context: context,
                                                showFlag: true,
                                                showSearchField: true,
                                                showCurrencyName: true,
                                                showCurrencyCode: true,
                                                onSelect:
                                                    (Currency currency) {},
                                                // onSelect: (Currency currency) {
                                                //  return currency ;
                                                // },
                                                favorite: ['SEK'],
                                              );
                                            })
                                      ],
                                    )),
                              ),
                            ],
                          )),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: pink(),
                                borderRadius: BorderRadius.circular(8)),
                            child: FlatButton(
                              minWidth: MediaQuery.of(context).size.width * 0.8,
                              color: pink(),
                              padding: const EdgeInsets.all(2),
                              child: const Text("Save Trip "),
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  var trip = Trip(
                                      id: 0,
                                      name: Titlecontroller.text,
                                      description: descriptioncontroller.text,
                                      curency: _curency,
                                      imageUrl: _imageFile,
                                      endDate: dateEnd,
                                      startDate: dateStart,
                                      totalAmount: depositamountcontroler.text);
                                  provider.insertTrip(trip);
                                }
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          )),
    );
  }
}
