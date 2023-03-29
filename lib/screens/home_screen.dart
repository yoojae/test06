import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;

  void onTick(Timer timer){
    if(totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros +1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds -1;
      });
    }
    setState(() {
      totalSeconds = totalSeconds -1;
    });
  }

  void onStartPressed(){
    timer = Timer.periodic(const Duration(seconds: 1), onTick);

    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();

    setState(() {
      isRunning = false;
    });
  }

  void onStopPressed() {
    timer.cancel();
    setState(() {
      totalSeconds = twentyFiveMinutes;
      totalPomodoros = 0;
      isRunning = false;
    });
  }


  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,

                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning? onPausePressed : onStartPressed,
                    icon: Icon(isRunning
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  IconButton(
                      onPressed: onStopPressed,
                      iconSize: 50,
                      color: Theme.of(context).cardColor,
                      icon: Icon(Icons.restart_alt),
                  ),
                ],
              ),
          ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('POMODORS', style: TextStyle(
                          color: Color(0xFF232B55),
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ), ),
                        Text('$totalPomodoros', style: TextStyle(
                            color: Color(0xFF232B55),
                            fontSize: 55,
                            fontWeight: FontWeight.w600
                        ),),
                      ],
                    ),
          ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
