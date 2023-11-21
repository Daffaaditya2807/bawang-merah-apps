import 'package:bawangmerah/component/list_colours.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPhAir extends StatelessWidget {
  static String routeName = '/detailphair';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "pH Tanah Dan Air",
          style: GoogleFonts.abel(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "5,7",
                style: GoogleFonts.abel(fontSize: 60),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Dalam Keadaan Baik",
                style: GoogleFonts.abel(),
              ),
              Text(
                "pH Netral: 5,6-7",
                style: GoogleFonts.abel(color: ColoursList.grenn),
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Divider(
                  thickness: 0.5,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Pastikan pH Air dan Tanah Anda dalam kondisi Netral karena berpengaruh dalam Tanaman anda, jika pH turun anda dapat menambahkan volumen penyiraman dan juga pemupukan begitupun sebaliknya",
                  style: GoogleFonts.abel(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
