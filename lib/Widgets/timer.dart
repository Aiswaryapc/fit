import 'dart:async';
import 'dart:typed_data';
import 'package:fit/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'button.dart';
import 'package:audioplayers/audioplayers.dart';

class StopWatchTimerPage extends StatefulWidget {
  @override
  _StopWatchTimerPageState createState() => _StopWatchTimerPageState();
}

class _StopWatchTimerPageState extends State<StopWatchTimerPage> {
  static const countdownDuration = Duration(seconds: 46);
  Duration duration = Duration();
  AudioPlayer player = AudioPlayer();

  void play() async {
    String audioasset = "assets/audio/tone.mp3";
    ByteData bytes = await rootBundle.load(audioasset); //load sound from assets
    Uint8List soundbytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await player.playBytes(soundbytes);
    if (result == 1) {
      //play success
      print("Sound playing successful.");
    } else {
      print("Error while playing sound.");
    }
  }

  void playApplause() async {
    String audioasset1 = "assets/audio/applause.mp3";
    ByteData bytes1 =
        await rootBundle.load(audioasset1); //load sound from assets
    Uint8List soundbytes1 =
        bytes1.buffer.asUint8List(bytes1.offsetInBytes, bytes1.lengthInBytes);
    int result1 = await player.playBytes(soundbytes1);
    if (result1 == 1) {
      //play success
      print("Sound1 playing successful.");
    } else {
      print("Error while playing sound.");
    }
  }

  Timer? timer;
  int i = 0;
  final List<String> arm = [
    'Arm Circles',
    'Arm Circles',
    "Arm scissors",
    "Claps Over Head",
    "Overhead tricep Extension",
    "Shoulder Gators",
    "Chest Press Pulse",
    "Dynamic Chest"
  ];
  final List<String> img = [
    "assets/img/arm_circle.jpg",
    'assets/img/arm_circle.jpg',
    "assets/img/arm_scissors.jpg",
    "assets/img/claps_overhead.jpeg",
    "assets/img/overhead_tricep_extension.jpg",
    "assets/img/shoulder_gators.jpg",
    "assets/img/chest_press_pulse.jpg",
    "assets/img/dynamic_chest.jpg",
  ];
  bool countDown = true;
  bool flag = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (i >= 8) {
      
      
      stopTimer();
    }
    if (i < 8) {
      reset();
    }
  }

  void reset() {
    
    setState(() => duration = countdownDuration);
    startTimer();
  }

  void startTimer() {
    
    if (i >= 8) {
      stopTimer();
    }

    if (i < 8) {
      countDown = false;
      i = i + 1;
      if (flag) {
        period1();
      }
      if (flag == false) {
        play();
        addTime();
      }
    }
  }

  void period1() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
    flag = false;
  }

  void addTime() {
    final addSeconds = -1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        reset();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void stopTimer() {
    // if (resets) {
    //   reset();
    // }
    playApplause();
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [AppColors.bglight, AppColors.white])),
    child: Scaffold(
       backgroundColor: Colors.transparent,
      body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (i < 8)
                Column(
                  children: [
                    Text(
                      arm[i],
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColors.purple),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 400,
                      width: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(img[i]), fit: BoxFit.contain)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buildTime(),
                    SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              if (i >= 8)
              
                Column(
                  children: [
                    Container(
                      height: 400,
                      width: 380,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/img/success.jpg"),
                              fit: BoxFit.fitWidth)),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Congratulations!!!",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: AppColors.purple),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "You succesfully completed your arm workout",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.gold),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              // buildButtons()
            ],
          ),
    ),
  );

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds);
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      // buildTimeCard(time: hours, header:'HOURS'),
      // SizedBox(width: 8,),
      buildTimeCard(time: minutes, header: 'MINUTES'),
      SizedBox(
        width: 8,
      ),
      buildTimeCard(time: seconds, header: 'SECONDS'),
    ]);
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Text(
              time,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 50),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(header, style: TextStyle(color: Colors.black45)),
        ],
      );

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;
    return isRunning || isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                  text: 'STOP',
                  onClicked: () {
                    if (isRunning) {
                      // stopTimer(resets: false);
                    }
                  }),
              SizedBox(
                width: 12,
              ),
              ButtonWidget(text: "CANCEL", onClicked: stopTimer),
            ],
          )
        : ButtonWidget(
            text: "Start Timer!",
            color: Colors.black,
            backgroundColor: Colors.white,
            onClicked: () {
              startTimer();
            });
  }
}
