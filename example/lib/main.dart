import 'package:flipper/flipper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flipper Example"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ContactCard(
                frontSide: LayoutBuilder(
                    builder: (p0, constraints) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: constraints.maxHeight*0.1
                          ),
                          const Center(
                            child: SizedBox(
                              height: 110,
                            ),
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
                          const Spacer(),
                          SizedBox(
                            width: constraints.maxWidth*0.42,
                            child: FittedBox(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 11,
                                  ),
                                  Text(
                                    "  chrisbinsunny",
                                    style: TextStyle(
                                      fontSize: 7,
                                      fontWeight: FontWeight.w200,
                                      letterSpacing: 1,
                                      height: 1.7,
                                      fontFamily: "Gilroy",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          SizedBox(
                            width: constraints.maxWidth*0.42,

                            child: FittedBox(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 11,
                                  ),
                                  Text(
                                    "  chrisbinsunny",
                                    style: TextStyle(
                                      fontSize: 7,
                                      fontWeight: FontWeight.w100,
                                      letterSpacing: 1,
                                      height: 1.7,
                                      fontFamily: "Gilroy",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          SizedBox(
                              width: constraints.maxWidth*0.42,

                              child: FittedBox(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 11,
                                    ),
                                    Text(
                                      "  chrisbinsunny",
                                      style: TextStyle(
                                        fontSize: 7,
                                        fontWeight: FontWeight.w100,
                                        letterSpacing: 1,
                                        height: 1.7,
                                        fontFamily: "Gilroy",
                                      ),
                                    ),
                                  ],
                                ),)),
                          const SizedBox(
                            height: 2,
                          ),
                          SizedBox(
                              width: constraints.maxWidth*0.64,

                              child: FittedBox(
                                child:
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                    Text(
                                      "  chrisbinsunny.github.io",
                                      style: TextStyle(
                                        fontSize: 7,
                                        fontWeight: FontWeight.w100,
                                        letterSpacing: 1,
                                        height: 1.7,
                                        fontFamily: "Gilroy",
                                      ),
                                    ),
                                  ],
                                ),))

                        ],
                      );}
                ),
                back: LayoutBuilder(

                  builder: (p0, constraints) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 150,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: constraints.maxWidth*0.65,
                          child: const FittedBox(
                            child: Text(" Chrisbin Sunny",
                              style: TextStyle(
                                  fontSize: 24,
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
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const FlutterLogo(
                              size: 20,
                            ),
                            Text(
                              " FlutterDev",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: null,
                                  fontFamily: "Gilroy",
                                  fontWeight: FontWeight.w500,
                                  foreground: Paint()..shader=const LinearGradient(
                                      colors: <Color>[Color(0xff5dc8f8), Color(0xff065a9d)],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter
                                  ).createShader(const Rect.fromLTWH(0.0, 0.0, 50.0, 20.0))
                              ),
                            )
                          ],
                        )
                      ],
                    );
                  },),
              ),
            )
          ],
        ),
      ),
    );
  }
}
