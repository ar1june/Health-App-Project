import 'dart:async';
import 'package:flutter/material.dart';
import 'barrier.dart';
import 'bird.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  static double birdY = 0;
  double initialPos = birdY;
  double height = 0;
  double time = 0;
  double gravity = -4.9;
  double velocity = 3;
  double birdWidth = 0.1;
  double birdHeight = 0.1;

  bool gameHasStarted = false;

  static List<double> barrierX = [2, 2 + 1.5];
  static double barrierWidth = 0.5;
  List<List<double>> barrierHeight = [
    [0.6, 0.4],
    [0.4, 0.6],
  ];

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      height = gravity * time * time + velocity * time;

      setState(() {
        birdY = initialPos - height;
      });

      if (birdIsDead()) {
        timer.cancel();

        _showDialog();
      }

      time += 0.1;
    });
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      birdY = 0;
      gameHasStarted = false;
      time = 0;
      initialPos = birdY;
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.brown,
              title: Center(
                child: Text(
                  "G A M E O V E R",
                  style: TextStyle(color: Colors.white),
                ),
              ),
           actions: [
                  GestureDetector(
                    onTap: resetGame,
                    child: ClipRect(
                      
                      child: Container(
                        padding: EdgeInsets.all(7),
                        color: Colors.white,
                        child: Text(
                          'P L A Y  A G A I N',
                          style: TextStyle(color: Colors.brown),
                        ),
                      ),
                    ),
                  )
                ],
              );
        });
  }

  void jump() {
    setState(() {
      time = 0;
      initialPos = birdY;
    });
  }

  bool birdIsDead() {
    if (birdY < -1 || birdY > 1) {
      return true;
    }

    for (int i = 0; i < barrierX.length; i++) {
      if (barrierX[i] <= birdWidth &&
          barrierX[i] + barrierWidth >= -birdWidth &&
          (birdY <= -1 + barrierHeight[i][0] ||
              birdY + birdHeight >= 1 - barrierHeight[i][1])) {
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: gameHasStarted ? jump : startGame,
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 5,
                  child: Container(
                    
                color: Colors.blue,
                child: Center( 
                  child: Stack(
                    children: [
                      MyBird(
                        birdY: birdY,
                        birdHeight: birdHeight,
                        birdWidth: birdWidth,
                      ),
   //MyCoverScreen(gameHasStarted: gameHasStarted),
  

                      MyBarrier(
                        barrierX: barrierX[0],
                     barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight[0][0],
                   isThisBottomBarrier: false,
                   ),

 MyBarrier(
                        barrierX: barrierX[0],
                     barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight[0][1],
                   isThisBottomBarrier: true,
                   ),
                    MyBarrier(
                        barrierX: barrierX[1],
                     barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight[1][0],
                   isThisBottomBarrier: false,
                   ),
                    MyBarrier(
                        barrierX: barrierX[1],
                     barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight[1][1],
                   isThisBottomBarrier: true,
                   ),
                   
                   
                      Container(
                        alignment: Alignment(0, -0.5),
                        child: Text(gameHasStarted ? '' : 'T A P T O P L A Y',
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                      )
                    ],
                  ),
                ),
              )),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                  )),
            ],
          ),
        ));
  }
}
