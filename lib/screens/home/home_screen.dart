import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uichanllenge/screens/event/event_screen.dart';

import '../../models/event.dart';
import '../../widgets/background_widget.dart';
import '../schedule/Schedule_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: AlignmentDirectional.topCenter, children: [
      BackgroundWidget(),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0, right: 20),
            child: RichText(
                text: TextSpan(
                    text: 'CURRENT ',
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.black,
                        fontWeight: FontWeight.w900),
                    children: <TextSpan>[
                  TextSpan(text: "E", style: TextStyle(color: Colors.blue)),
                  TextSpan(text: "VENTS")
                ])),
          ),
          Stack(
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
                height: MediaQuery.of(context).size.height / 1.75,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/background5.png",
                  fit: BoxFit.fill,
                ),
              ),
              CurrentEventWidget()
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                      text: TextSpan(
                          text: 'UPCOMING ',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w900),
                          children: <TextSpan>[
                        TextSpan(
                            text: "E", style: TextStyle(color: Colors.blue)),
                        TextSpan(text: "VENTS")
                      ])),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Image.asset("assets/Arrow.png"),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: UpcomingEventsWidget(),
          ),
        ],
      ),
    ]));
  }
}

class CurrentEventWidget extends StatelessWidget {
  CurrentEventWidget({
    Key? key,
  }) : super(key: key);
  Event event = Event.currentEvent;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => EventScreen(
                  event: event,
                ))));
      }),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 50,
              bottom: 40,
            ),
            height: MediaQuery.of(context).size.height / 1.75,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/background4.png",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 30),
            child: Image.asset("assets/Globe.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180.0, left: 60.0),
            child: Text(
              event.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 230.0, left: 60.0),
            child: Text(event.description,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 350.0, left: 30),
            child: Image.asset("assets/Developers.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 390.0, left: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('+ 80',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                Padding(
                  padding: const EdgeInsets.only(right: 60.0),
                  child: Image.asset("assets/Pointer.png"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UpcomingEventsWidget extends StatelessWidget {
  UpcomingEventsWidget({
    Key? key,
  }) : super(key: key);
  List<Event> lv = Event.eventsList;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width - 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: lv.length,
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => EventScreen(
                          event: lv[index],
                        ))));
              },
              child: Container(
                height: 120,
                width: MediaQuery.of(context).size.width - 70,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/background5.png"),
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/Event_label_image.png"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 180,
                      child: Image.asset(
                        "assets/text.png",
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
              ),
            );
          })),
    );
    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Row(
    //     children: [
    //       InkWell(
    //         onTap: () {
    //           Navigator.of(context).push(
    //               MaterialPageRoute(builder: ((context) => EventScreen())));
    //         },
    //         child: Container(
    //           height: 120,
    //           width: MediaQuery.of(context).size.width - 50,
    //           padding: EdgeInsets.all(20),
    //           decoration: BoxDecoration(
    //               image: DecorationImage(
    //             fit: BoxFit.fill,
    //             image: AssetImage("assets/background5.png"),
    //           )),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Image.asset("assets/Event_label_image.png"),
    //               SizedBox(
    //                 width: MediaQuery.of(context).size.width - 160,
    //                 child: Image.asset(
    //                   "assets/text.png",
    //                   fit: BoxFit.fill,
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //       Container(
    //         height: 120,
    //         width: MediaQuery.of(context).size.width - 50,
    //         decoration: BoxDecoration(
    //             image: DecorationImage(
    //           fit: BoxFit.fill,
    //           image: AssetImage("assets/background5.png"),
    //         )),
    //       ),
    //     ],
    //   ),
    // );
  }
}
