import 'package:flutter/material.dart';
import 'package:uichanllenge/widgets/background_4_widget.dart';

import '../../models/event.dart';

int ratecolor = 0;

class RateScreen extends StatefulWidget {
  RateScreen({super.key, required this.event});
  Event event;
  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  var name = TextEditingController();
  var rate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Background4Widget(),
          Container(
            padding: EdgeInsets.only(top: 90),
            child: Column(
              children: [
                RichText(
                    text: TextSpan(
                        text: 'FEEDBACK ',
                        style: TextStyle(
                            fontSize: 36,
                            color: Colors.black,
                            fontWeight: FontWeight.w900),
                        children: <TextSpan>[
                      TextSpan(text: "F", style: TextStyle(color: Colors.blue)),
                      TextSpan(text: "ROM")
                    ])),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 30,
                  width: 100,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    'Anonymous',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, bottom: 10),
                            child: Text('NAME / Email'),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: TextField(
                          controller: name,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, bottom: 30, top: 30),
                            child: Text('Rate your experience'),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RateWidget(
                            color: Colors.red,
                            id: 0,
                          ),
                          RateWidget(
                            color: Colors.red[200]!,
                            id: 1,
                          ),
                          RateWidget(
                            color: Colors.orange[300]!,
                            id: 2,
                          ),
                          RateWidget(
                            color: Colors.green[200]!,
                            id: 3,
                          ),
                          RateWidget(
                            color: Colors.green,
                            id: 4,
                          )
                        ],
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, bottom: 10, top: 10),
                            child: Text('MORE DETAILS'),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: TextField(
                          controller: rate,
                          maxLines: 10,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: InkWell(
                          onTap: () {
                            submit();
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 50,
                            width: 90,
                            margin: EdgeInsets.only(top: 30, right: 40),
                            decoration: BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void submit() {
    Rating rating = Rating(
      user: name.text,
      rate: ratecolor,
      comment: rate.text,
    );
    widget.event.rate.add(rating);
  }
}

class RateWidget extends StatefulWidget {
  RateWidget({Key? key, required this.color, required this.id})
      : super(key: key);
  Color color;
  int id;

  @override
  State<RateWidget> createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {
  bool on = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          on = !on;
          ratecolor = widget.id;
        });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.color,
            boxShadow: [
              BoxShadow(
                  color: on == true ? widget.color : Colors.transparent,
                  blurRadius: on == true ? 3 : 0,
                  spreadRadius: on == true ? 3 : 0)
            ]),
      ),
    );
  }
}
