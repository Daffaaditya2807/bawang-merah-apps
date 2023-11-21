import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../component/list_colours.dart';

class DetailTinggirAir extends StatelessWidget {
  static String routeName = '/tinggiair';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ketinggian Air",
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
                "50 Cm",
                style: GoogleFonts.abel(fontSize: 60),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Dalam Keadaan Normal",
                style: GoogleFonts.abel(),
              ),
              Text(
                "Ketinggian Normal: 50-60Cm",
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
