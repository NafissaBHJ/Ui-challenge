import 'package:flutter/material.dart';
import 'package:uichanllenge/screens/home/home_screen.dart';
import 'package:uichanllenge/screens/schedule/Schedule_screen.dart';
import 'package:uichanllenge/widgets/background_2_widget.dart';

import '../../models/event.dart';

class EventScreen extends StatefulWidget {
  EventScreen({super.key, required this.event});
  Event event;

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: AlignmentDirectional.topCenter, children: [
        Background2Widget(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.event.title,
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 10),
              child: Text(
                widget.event.description,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width - 50,
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Text("Feedback",
                        style: TextStyle(fontWeight: FontWeight.w900)),
                  ),
                  Column(
                    children: widget.event.rate
                        .map((e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: e.rate == 0
                                        ? Colors.red
                                        : e.rate == 1
                                            ? Colors.red[200]
                                            : e.rate == 2
                                                ? Colors.orange[400]
                                                : e.rate == 3
                                                    ? Colors.green[200]
                                                    : Colors.green,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, left: 12),
                                  child: Text(
                                    e.comment ?? "",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: ((context) => ScheduleScreen(
                                  event: widget.event,
                                ))))
                        .then((value) {
                      setState(() {
                        widget.event = widget.event;
                      });
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      fixedSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width - 50, 50))),
                  child: Text(
                    'View Schedule',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        )
      ]),
    );
  }
}
