import 'package:flutter/material.dart';
import 'package:azimout/widgets/intro/data.dart';
import 'dart:io';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.white : Colors.white30,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A2E),
      body: Container(
        height: MediaQuery.of(context).size.height - 100,
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              slideIndex = index;
            });
          },
          children: <Widget>[
            SlideTile(
              imagePath: mySLides[0].getImageAssetPath(),
              desc: mySLides[0].getDesc(),
              button: 'null',
              index: 1,
            ),
            SlideTile(
              imagePath: mySLides[1].getImageAssetPath(),
              desc: mySLides[1].getDesc(),
              button: 'null',
              index: 2,
            ),
            SlideTile(
              imagePath: mySLides[2].getImageAssetPath(),
              desc: mySLides[2].getDesc(),
              button: "Enter in the game",
              index: 3,
            )
          ],
        ),
      ),
      bottomSheet: slideIndex != 3
          ? Container(
              color: Color(0xFF1A1A2E),
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Color(0xFF1A1A2E),
                    child: Row(
                      children: [
                        for (int i = 0; i < 3; i++)
                          i == slideIndex
                              ? _buildPageIndicator(true)
                              : _buildPageIndicator(false),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : InkWell(),
    );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath, desc, button;
  int index;

  SlideTile({this.imagePath, this.desc, this.button, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment(-3.5, 0),
            child: Text(
              '0$index.',
              style: TextStyle(
                  fontSize: 200,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF474757)),
            ),
          ),
          Image.asset(imagePath),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 20,
          ),
          Text(desc,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white)),
          SizedBox(
            height: 20,
          ),
          button != 'null'
              ? ElevatedButton(
                  child: Text(button, style: TextStyle(fontSize: 15)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF0F3460)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, '/Register'))
              : Text('')
        ],
      ),
    );
  }
}
