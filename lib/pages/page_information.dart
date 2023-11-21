import 'package:bawangmerah/component/list_colours.dart';
import 'package:bawangmerah/pages/detail/detail_kelembapan.dart';
import 'package:bawangmerah/pages/detail/detail_ph_air.dart';
import 'package:bawangmerah/pages/detail/detail_tinggi_air.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PageInformation extends StatelessWidget {
  static String routeName = '/pageinformation';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "INFORMASI KEBUN",
                style: GoogleFonts.abel(color: Colors.black, fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Nganjuk")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "35°C",
                            style: GoogleFonts.abel(fontSize: 40),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kemarin: 41°C",
                                style: GoogleFonts.abel(),
                              ),
                              Text("Rata-rata: 37°C", style: GoogleFonts.abel())
                            ],
                          ),
                          Image.asset("assets/clouds.png")
                        ],
                      )
                    ],
                  ),
                ),
              ),
              boxInformation(
                title: "pH Air",
                titleValue: "5,7",
                condition: "Baik",
                informationTitle: "pH Netral: 5,6-7",
                onIconButtonPressed: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    //argument dobawah ni bos
                    settings: RouteSettings(name: DetailPhAir.routeName),
                    screen: DetailPhAir(),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
              boxInformation(
                title: "Kelembapan",
                titleValue: "65%",
                condition: "Normal",
                informationTitle: "Kelembapan",
                value: "Netral : 50%-70%",
                onIconButtonPressed: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    //argument dobawah ni bos
                    settings: RouteSettings(name: DetailKelembapan.routeName),
                    screen: DetailKelembapan(),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
              boxInformation(
                title: "Ketinggian Air",
                titleValue: "50",
                condition: "Normal",
                informationTitle: "50-60 Cm",
                onIconButtonPressed: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    //argument dobawah ni bos
                    settings: RouteSettings(name: DetailTinggirAir.routeName),
                    screen: DetailTinggirAir(),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "RIWAYAT PENYIRAMAN",
                style: GoogleFonts.abel(color: Colors.black, fontSize: 24),
              ),
              BoxHistory(date: "Rabu , 15 November 2023", time: "09:00 -09:45"),
              BoxHistory(date: "Rabu , 15 November 2023", time: "09:00 -09:45"),
              BoxHistory(date: "Rabu , 15 November 2023", time: "09:00 -09:45"),
              BoxHistory(date: "Rabu , 15 November 2023", time: "09:00 -09:45"),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget boxInformation(
      {String? title,
      String? titleValue,
      String? condition,
      Function()? onIconButtonPressed,
      String? informationTitle,
      String? value}) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${title}",
                  style: GoogleFonts.abel(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${titleValue}",
                      style: GoogleFonts.abel(fontSize: 40),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${condition}",
                          style: GoogleFonts.abel(fontSize: 18),
                        ),
                        Text("${informationTitle}",
                            style: GoogleFonts.abel(
                                color: ColoursList.grenn,
                                fontWeight: FontWeight.bold)),
                        value != null
                            ? Text("${value}",
                                style: GoogleFonts.abel(
                                    color: ColoursList.grenn,
                                    fontWeight: FontWeight.bold))
                            : Text("")
                      ],
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(360),
                          color: Colors.green.shade200),
                      child: IconButton(
                          onPressed: onIconButtonPressed,
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 15,
                            color: ColoursList.grenn,
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget BoxHistory({String? date, String? time}) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${date}",
                  style: GoogleFonts.abel(),
                ),
                Text(
                  "${time}",
                  style: GoogleFonts.abel(
                      color: ColoursList.grenn, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
