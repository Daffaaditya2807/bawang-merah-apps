import 'package:bawangmerah/component/list_colours.dart';
import 'package:bawangmerah/model/waktuPenyiraman.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageRemote extends StatefulWidget {
  @override
  State<PageRemote> createState() => _PageRemoteState();
}

class _PageRemoteState extends State<PageRemote> {
  List<String> nameMenu = ['Waktu\nPenyiraman', 'Lama\nPenyiraman'];
  TextEditingController _textController = TextEditingController();
  final CountDownController _controllerTime = CountDownController();
  int minute = 0;
  bool startimer = false;

  int selected = 0;
  bool light = true;
  List<IconData> nameIcons = [
    Icons.alarm,
    Icons.timer_outlined,
  ];

  List<TimePenyiraman> dataPenyiraman = [
    TimePenyiraman(waktu: "09.45 - 10.00", active: true),
    TimePenyiraman(waktu: "09.45 - 10.00", active: false),
    TimePenyiraman(waktu: "09.45 - 10.00", active: true),
    TimePenyiraman(waktu: "09.45 - 10.00", active: false),
    TimePenyiraman(waktu: "09.45 - 10.00", active: true),
    TimePenyiraman(waktu: "09.45 - 10.00", active: true)
  ];
  TimeOfDay selectedTimeStart = TimeOfDay.now();
  TimeOfDay selectedTimeEnd = TimeOfDay.now();

  Future<void> _showInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Atur Durasi'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                height: 50,
                child: TextField(
                  controller: _textController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Masukan Durasi",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Text("Menit")
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  int getTime = int.parse(_textController.text);
                  minute = getTime * 60;
                  print("waktu terpilih = ${minute.toString()}");
                });
                Navigator.of(context).pop();
              },
              child: Text('Terapkan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Atur Penyiraman\nAnda!",
                style: GoogleFonts.abel(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    height: 100,
                    child: Center(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selected = index;
                                    });
                                  },
                                  child: selected == index
                                      ? Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ColoursList.purple),
                                              color: ColoursList.purple,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Icon(
                                              nameIcons[index],
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ColoursList.purple),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Icon(
                                              nameIcons[index],
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${nameMenu[index]}",
                                  style: GoogleFonts.abel(),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: 2,
                        shrinkWrap: true,
                      ),
                    ),
                  ),
                ),
              ),
              selected == 0
                  ? Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Waktu Penyiraman",
                                style: GoogleFonts.abel(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              IconButton(
                                  onPressed: () async {
                                    final TimeOfDay? timeofDayStrt =
                                        await showTimePicker(
                                            context: context,
                                            helpText: "Tanggal Mulai",
                                            initialTime: selectedTimeStart,
                                            initialEntryMode:
                                                TimePickerEntryMode.input);
                                    if (timeofDayStrt != null) {
                                      setState(() {
                                        selectedTimeStart = timeofDayStrt;
                                      });
                                    }
                                    final TimeOfDay? timeofDayEnd =
                                        await showTimePicker(
                                            context: context,
                                            helpText: "Tanggal Berakhir",
                                            initialTime: selectedTimeEnd,
                                            initialEntryMode:
                                                TimePickerEntryMode.input);
                                    if (timeofDayEnd != null) {
                                      setState(() {
                                        selectedTimeEnd = timeofDayEnd;
                                      });
                                    }
                                    print(
                                        "Tanggal Mulai = ${selectedTimeStart.format(context)} Berakhir = ${selectedTimeEnd.format(context)}");
                                  },
                                  splashRadius: 15,
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                          ListView.builder(
                            itemBuilder: (context, index) {
                              final TimePenyiraman penyiraman =
                                  dataPenyiraman[index];
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${penyiraman.waktu}",
                                        style: GoogleFonts.abel(),
                                      ),
                                      Switch(
                                        // This bool value toggles the switch.
                                        value: penyiraman.active!,
                                        activeColor: ColoursList.grenn,
                                        onChanged: (bool value) {
                                          // This is called when the user toggles the switch.
                                          setState(() {
                                            light = value;
                                            penyiraman.active = value;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    color: Colors.black,
                                  )
                                ],
                              );
                            },
                            itemCount: dataPenyiraman.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                          )
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Lama Penyiraman",
                          style: GoogleFonts.abel(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${minute / 60} Menit",
                          style: GoogleFonts.abel(fontSize: 40),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    _showInputDialog(context);
                                  },
                                  child: Text("Atur Waktu")),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      startimer = true;
                                    });
                                    _controllerTime.restart(duration: minute);
                                  },
                                  child: Text("Mulai")),
                            )
                          ],
                        ),
                        minute != 0 && startimer == true
                            ? Column(
                                children: [
                                  CircularCountDownTimer(
                                    duration: minute,
                                    initialDuration: 0,
                                    controller: _controllerTime,
                                    width: 280,
                                    height: 310,
                                    ringColor: Colors.grey[300]!,
                                    ringGradient: null,
                                    fillColor: Colors.purpleAccent[100]!,
                                    fillGradient: null,
                                    backgroundColor: ColoursList.purple,
                                    backgroundGradient: null,
                                    strokeWidth: 5.0,
                                    strokeCap: StrokeCap.butt,
                                    textStyle: TextStyle(
                                        fontSize: 33.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textFormat: CountdownTextFormat.HH_MM_SS,
                                    isReverse: true,
                                    isReverseAnimation: false,
                                    isTimerTextShown: true,
                                    autoStart: false,
                                    onStart: () {
                                      debugPrint('Countdown Started');
                                      print(minute.toString());
                                    },
                                    onComplete: () {
                                      debugPrint('Countdown Ended');
                                      _controllerTime.reset();
                                    },
                                    onChange: (String timeStamp) {
                                      debugPrint(
                                          'Countdown Changed $timeStamp');
                                    },
                                    // timeFormatterFunction:
                                    //     (defaultFormatterFunction, duration) {
                                    //   if (duration.inSeconds == 0) {
                                    //     return "Start";
                                    //   } else {
                                    //     return Function.apply(
                                    //         defaultFormatterFunction, [duration]);
                                    //   }
                                    // },
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _controllerTime.isPaused
                                              ? _controllerTime.resume()
                                              : _controllerTime.pause();
                                        });
                                      },
                                      child: Text(_controllerTime.isPaused
                                          ? "Mulai"
                                          : "Pause")),
                                  SizedBox(
                                    height: 30,
                                  )
                                ],
                              )
                            : Container()
                      ],
                    ),
            ],
          ),
        ),
      )),
    );
  }
}
