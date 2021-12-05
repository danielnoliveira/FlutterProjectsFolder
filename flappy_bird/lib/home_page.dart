import 'dart:async';

import 'package:flappy_bird/barriers.dart';
import 'package:flappy_bird/bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = 0;
  double velocity = 2;
  bool gameHasStarted = false;

  static double barrierXone = 2;
  static double barrierXtwo = barrierXone + 2;

  jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 50), (Timer t) {
      time += 0.04;
      height = -3.5 * time * time + velocity * time;
      setState(() {
        birdYaxis = initialHeight - height;
      });
      setState(() {
        if (barrierXone < -1.1) {
          barrierXone += 2.2;
        } else {
          barrierXone -= 0.05;
        }
      });

      setState(() {
        if (barrierXtwo < -1.1) {
          barrierXtwo += 4.2;
        } else {
          barrierXtwo -= 0.05;
        }
      });
      print(barrierXone);
      if (birdYaxis > 1) {
        gameHasStarted = false;
        birdYaxis = 0;
        t.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    if (gameHasStarted) {
                      jump();
                    } else {
                      startGame();
                    }
                  },
                  child: AnimatedContainer(
                    alignment: Alignment(0, birdYaxis),
                    duration: Duration(milliseconds: 0),
                    color: Colors.blue,
                    child: Bird(),
                  ),
                ),
                if (!gameHasStarted)
                  Container(
                    alignment: Alignment(0, -0.2),
                    child: Text(
                      'T A P  T O  P L A Y',
                      style: TextStyle(
                          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                AnimatedContainer(
                    alignment: Alignment(barrierXone, -1.1),
                    duration: Duration(seconds: 3),
                    child: Barrier(
                      size: 200.0,
                    )),
                AnimatedContainer(
                    alignment: Alignment(barrierXone, 1.1),
                    duration: Duration(seconds: 3),
                    child: Barrier(
                      size: 200.0,
                    )),
                AnimatedContainer(
                    alignment: Alignment(barrierXtwo, -1.1),
                    duration: Duration(seconds: 3),
                    child: Barrier(
                      size: 150.0,
                    )),
                AnimatedContainer(
                    alignment: Alignment(barrierXtwo, 1.1),
                    duration: Duration(seconds: 3),
                    child: Barrier(
                      size: 250.0,
                    )),
              ],
            ),
          ),
          Container(
            color: Colors.green,
            height: 15,
          ),
          Expanded(
              child: Container(
            color: Colors.brown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SCORE',
                      style: TextStyle(
                          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('0', style: TextStyle(color: Colors.white, fontSize: 35)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('BEST',
                        style: TextStyle(
                            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20,
                    ),
                    Text('0', style: TextStyle(color: Colors.white, fontSize: 35))
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
