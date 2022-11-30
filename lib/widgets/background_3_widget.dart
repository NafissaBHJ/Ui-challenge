import 'package:flutter/material.dart';

class Background3Widget extends StatelessWidget {
  const Background3Widget({
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
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 20),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Image.asset(
                      "assets/Lampe.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 3),
                        child: Image.asset(
                          "assets/Star.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Image.asset(
                        "assets/Arrow.png",
                        fit: BoxFit.cover,
                      ),
                    ],
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
