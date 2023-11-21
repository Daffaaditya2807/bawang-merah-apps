import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class PageDetectPenyakit extends StatefulWidget {
  @override
  State<PageDetectPenyakit> createState() => _PageDetectPenyakitState();
}

class _PageDetectPenyakitState extends State<PageDetectPenyakit> {
  File? _image;
  final picker = ImagePicker();

//Image Picker function to get image from camera
  Future<void> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImageFromCamera();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hasil Deteksi",
          style: GoogleFonts.abel(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _image == null
                ? Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20)),
                  )
                : Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        image: DecorationImage(
                            image: FileImage(_image!), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20)),
                  ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Bawang Merah Terlihat Kurang Segar",
              style: GoogleFonts.abel(fontSize: 18),
            ),
            Divider(
              color: Colors.black,
            ),
            Text(
              "Penyebab Umum",
              style: GoogleFonts.abel(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Dapat Dikarenakan Kurang Atau Lebihnya Kelembapan Tanah, Cahaya Matahari, Suhu dan Ketersediaan Air",
              style: GoogleFonts.abel(),
            ),
          ],
        ),
      ),
    );
  }
}
