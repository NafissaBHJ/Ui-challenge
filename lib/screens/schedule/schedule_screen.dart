import 'package:flutter/material.dart';
import 'package:uichanllenge/models/event.dart';
import 'package:uichanllenge/widgets/background_3_widget.dart';

import '../rate/rate_screen.dart';

class ScheduleScreen extends StatefulWidget {
  ScheduleScreen({super.key, required this.event});
  Event event;
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Background3Widget(),
        Container(
          padding: EdgeInsets.only(top: 60, bottom: 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ScheduleAndDaysWidget(),
              ),
              Container(
                alignment: AlignmentDirectional.topStart,
                margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
                padding: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: widget.event.schedule!.length,
                    itemBuilder: ((context, index) {
                      return Row(
                        children: [
                          Container(
                            width: 80,
                            height: 60,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(widget.event.schedule![index].time,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900)),
                                Text(widget.event.schedule![index].date,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 140,
                            height: 50,
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: widget.event.schedule![index].type == 0
                                    ? Colors.blue[200]
                                    : widget.event.schedule![index].status == 0
                                        ? Colors.yellow[100]
                                        : Colors.red[200],
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(-3, 0),
                                    color:
                                        widget.event.schedule![index].type == 0
                                            ? Colors.blue
                                            : widget.event.schedule![index]
                                                        .status ==
                                                    0
                                                ? Colors.yellow
                                                : Colors.red,
                                  )
                                ]),
                            child: Text(widget.event.schedule![index].title,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w900)),
                          )
                        ],
                      );
                    })),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.red[200],
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          'Q&A',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => RateScreen(
                                  event: widget.event,
                                ))));
                      },
                      child: Container(
                        height: 50,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.yellow[200],
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text('FEEDBACK',
                                style: TextStyle(fontWeight: FontWeight.w900))),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                        'SUBSCRIBE',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}

class ScheduleAndDaysWidget extends StatelessWidget {
  const ScheduleAndDaysWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Schedule",
          style: TextStyle(
              fontSize: 36, color: Colors.black, fontWeight: FontWeight.w900),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'DAY 1',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.orange[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'DAY 2',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
