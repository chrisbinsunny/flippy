import 'package:flippy/flippy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flippy Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late FlipperController controller;

  @override
  void initState() {
    controller= FlipperController(
      dragAxis: DragAxis.both,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flippy Example"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DragFlipper(
                front: const FrontWidget(),
                back: const BackWidget(),
              controller: controller,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff9b96ee),
                  Color(0xff5f5eda),
                ]
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              height: 210,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: (){
                  controller.flipLeft();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 33,
                ),),
                FloatingActionButton(
                  onPressed: (){
                    controller.flipRight();
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 33,
                  ),),
                FloatingActionButton(
                  onPressed: (){
                    controller.flipDown();
                  },
                  child: const Icon(
                    Icons.arrow_downward_outlined,
                    color: Colors.white,
                    size: 33,
                  ),),
                FloatingActionButton(
                  onPressed: (){
                    controller.flipUp();
                  },
                  child: const Icon(
                    Icons.arrow_upward_outlined,
                    color: Colors.white,
                    size: 33,
                  ),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}


class FrontWidget extends StatelessWidget {
  const FrontWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "PLATINUM",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white
                ),
              ),
              Text(
                "MOCKUP BANK",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 70,
                height: 43,
                decoration: BoxDecoration(
                  color: const Color(0xffe0b056),
                  borderRadius: BorderRadius.circular(8)
                ),
              ),
              const Text(
                "CREDIT CARD",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "0603",
                style: TextStyle(
                    fontSize: 27,
                    color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "9020",
                style: TextStyle(
                    fontSize: 27,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),Text(
                "0714",
                style: TextStyle(
                    fontSize: 27,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),Text(
                "1234",
                style: TextStyle(
                    fontSize: 27,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "JANE DOE",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    "VALID THRU 05/28",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                    ),
                  ),
                ],
              ),

              const RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.wifi,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BackWidget extends StatelessWidget {
  const BackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: double.infinity,
          height: 43,
          decoration: const BoxDecoration(
              color: Color(0xff1f1e1e),
          ),
        ),
        Container(
          width: 180,
          height: 37,
          alignment: Alignment.centerRight,
          decoration: const BoxDecoration(
            color: Colors.white70,
          ),
          child: const Text(
            "0210  ",
            style: TextStyle(
              fontSize: 18
            ),
          )
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
            style: TextStyle(
                fontSize: 13,
                color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [

              Text(
                "MOCKUP BANK",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold

                ),
              ),
              Text(
                "CREDIT CARD",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
