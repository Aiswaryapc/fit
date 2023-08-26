import 'dart:async';
import 'dart:typed_data';
import 'package:fit/constants/colors.dart';
import 'package:fit/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Widgets/button.dart';
import 'package:audioplayers/audioplayers.dart';

class CheekTimerPage extends StatefulWidget {
  const CheekTimerPage({super.key});

  @override
  _CheekTimerPageState createState() => _CheekTimerPageState();
}

class _CheekTimerPageState extends State<CheekTimerPage> {
  static const countdownDuration = Duration(seconds: 31);
  Duration duration = const Duration();
  AudioPlayer player = AudioPlayer();

  void play() async {
    String audioasset = "assets/audio/tone.mp3";
    ByteData bytes = await rootBundle.load(audioasset);
    Uint8List soundbytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await player.playBytes(soundbytes);
    (result == 1)
        ? print("Sound playing successful.")
        : print("Error while playing sound.");
  }

  void pauseTimer() {
    if (timer != null) timer?.cancel();
    showDialog(
      context: context,
      builder: (_) => Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            alignment: FractionalOffset.center,
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [AppColors.bglight, AppColors.white])),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: FittedBox(
                  child: ButtonWidget(
                    text: 'Resume',
                    backgroundColor: AppColors.gold,
                    onClicked: () {
                      unpauseTimer();
                      Navigator.pop(context, true);
                    },
                  ),
                ),
              ),
            ),
          )),
    );
  }

  void unpauseTimer() {
    period1();
  }

  void playApplause() async {
    String audioasset1 = "assets/audio/applause.mp3";
    ByteData bytes1 =
        await rootBundle.load(audioasset1); //load sound from assets
    Uint8List soundbytes1 =
        bytes1.buffer.asUint8List(bytes1.offsetInBytes, bytes1.lengthInBytes);
    int result1 = await player.playBytes(soundbytes1);
    (result1 == 1)
        ? print("Applause sound playing successful.")
        : print("Error while playing sound.");
  }

  Timer? timer;
  int i = 0;
  final List<String> cheek = [
    'Cheek Firmer',
    'Cheek Firmer',
    'Neck Lift',
    "Puffy Cheeks",
    "Lion",
    "Eye Circles",
    "AEIOU",
    "Smile",
  ];
  final List<String> img = [
    "assets/img/cheekFirmer.jpeg",
    "assets/img/cheekFirmer.jpeg",
    'assets/img/neckLift.jpeg',
    "assets/img/puffyCheeks.jpeg",
    "assets/img/lion.jpeg",
    "assets/img/eyeCircles.jpeg",
    "assets/img/aeiou.jpeg",
    "assets/img/smile.jpeg",
  ];
  bool countDown = true;
  bool flag = true;
  bool skip = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    (i >= 8) ? stopTimer() : reset();
  }

  void reset() {
    setState(() => duration = countdownDuration);
    startTimer();
    skip = false;
  }

  void startTimer() {
    if (i >= 8) {
      stopTimer();
    } else {
      countDown = false;
      if (skip == false) i = i + 1;
      if (flag) {
        period1();
      } else {
        play();
        addTime();
      }
    }
  }

  void period1() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
    flag = false;
  }

  void addTime() {
    const addSeconds = -1;
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
                      cheek[i],
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColors.purple),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 400,
                      width: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(img[i]), fit: BoxFit.contain)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTime(),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: ButtonWidget(
                            text: 'Pause',
                            backgroundColor: AppColors.gold,
                            width: 100,
                            onClicked: () {
                              pauseTimer();
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        FittedBox(
                          child: ButtonWidget(
                            text: 'Skip',
                            backgroundColor: AppColors.gold,
                            width: 100,
                            onClicked: () {
                              i++;
                              skip = true;
                              reset();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              if (i >= 8)
                Column(
                  children: [
                    Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/img/success.jpg"),
                              fit: BoxFit.fitWidth)),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      "Congratulations!!!",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: AppColors.purple),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "You succesfully completed your cheek workout",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.gold),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ButtonWidget(
                      text: 'Home',
                      backgroundColor: AppColors.gold,
                      onClicked: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
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
      const SizedBox(
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
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Text(
              time,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 50),
            ),
          ),
          const SizedBox(
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
              const SizedBox(
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
