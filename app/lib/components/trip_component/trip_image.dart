import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Widget inkwellbuttomsheet({required Function takephoto}) {
  return Container(
    color: Colors.grey[500],
    height: 100,

    // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "choose your trip image ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
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

// ignore: non_constant_identifier_names
Widget trip_image({context, required bool load, required File imageFile}) {
  return Stack(
    children: [
 SizedBox(
          height: 100,
          child: load == true
              ? Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(imageFile), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 80,
                )
              : Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                      'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 100,
                )),
      Positioned(
          bottom: 10,
          right: 10,
          child: InkWell(
            onTap: () => showModalBottomSheet(
                // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                context: context,
                builder: (Builder) =>
                    inkwellbuttomsheet(takephoto: () => {})),
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ))
    ],
  );
}
