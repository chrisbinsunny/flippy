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

  FlipperController controller= FlipperController(
    dragAxis: DragAxis.horizontal,
  );


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
              padding: EdgeInsets.zero,
              height: 210,
              showShadow: true
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                IconButton(
                    onPressed: (){
                      controller.flipLeft();

                    },
                    icon: const Icon(
                      Icons.arrow_circle_left_outlined,
                      color: Colors.red,
                      size: 30,
                    )
                ),
                IconButton(
                    onPressed: (){
                      controller.flipRight();
                    },
                    icon: const Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.red,
                      size: 30,
                    )
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: (){
                      controller.flipDown();
                    },
                    icon: const Icon(
                      Icons.arrow_circle_down_outlined,
                      color: Colors.red,
                      size: 30,
                    )
                ),
                IconButton(
                    onPressed: (){
                      controller.flipUp();

                    },
                    icon: const Icon(
                      Icons.arrow_circle_up_outlined,
                      color: Colors.red,
                      size: 30,
                    )
                )
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
    return Column(
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
          decoration: BoxDecoration(
              color: const Color(0xffe0b056),
              borderRadius: BorderRadius.circular(8)
          ),
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
        Row(
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
      ],
    );
  }
}
