import 'package:flutter/material.dart';

class Background2Widget extends StatelessWidget {
  const Background2Widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/background.png",
          fit: BoxFit.cover,
          scale: 0.3,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 15),
                    child: Image.asset(
                      "assets/Lampe.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Image.asset(
                      "assets/Maqam_el_chahid.png",
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2, right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    "assets/Arrow.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: [
              Image.asset(
                "assets/background2.png",
                fit: BoxFit.fill,
                scale: 0.3,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  "assets/background3.png",
                  fit: BoxFit.cover,
                  scale: 0.3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Image.asset(
                  "assets/text.png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
