import 'package:flippy/flippy.dart';
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
              controller: controller,
              //borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              front: const FrontWidget(),
              back: const BackWidget(),
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
    return LayoutBuilder(
        builder: (p0, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: constraints.maxHeight*0.1
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 33
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,

                  child: RichText(
                    text: const TextSpan(
                        text: "Chrisbin\n",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Color(0xff5dc8f8),
                            fontSize: 32,
                            fontFamily: "Gilroy",
                            letterSpacing: 1.5
                        ),
                        children: [
                          TextSpan(
                            text: "Sunny",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xff065a9d),
                                fontSize: 35,
                                height: 0.9,
                                letterSpacing: 0.5

                            ),
                          ),
                        ]
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

            ],
          );}
    );
  }
}

class BackWidget extends StatelessWidget {
  const BackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(

      builder: (p0, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: constraints.maxWidth*0.65,
              child: const FittedBox(
                child: Text(" Chrisbin Sunny",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            SizedBox(
              width: constraints.maxWidth*0.6,
              child: const FittedBox(
                child: Text("  App Developer | Speaker",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w200
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: constraints.maxWidth*0.55,
              child: const FittedBox(
                child: Text(
                  " (IND)  +91 83300 70512",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            SizedBox(
              width: constraints.maxWidth*0.65,
              child: const FittedBox(
                child: Text(
                  " chrisbinofficial@gmail.com",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
            ),
          ],
        );
      },);
  }
}
