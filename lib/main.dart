import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  double fullsize = 0.1;
  bool isExpanded = false;
  double? round = 40;
  double? btnPosition = 0.10;

  void togglePosition() {
    setState(() {
      if(btnPosition == 0.90){
        btnPosition = 0.10;
      }else{
        btnPosition = 0.90;
      }


      if(round == 40){
        round = 0;
      }else{
        round = 40;
      }
      isExpanded = !isExpanded;
      fullsize = isExpanded ? 1.0 : 0.1;
    });
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.teal,
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: AlignmentDirectional.center,
                      color: Colors.teal[600],
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.60,
                      child: Text("Login Form"),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width,
                height: isExpanded ? MediaQuery.of(context).size.height * fullsize : 0,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(round as double),
                    bottomRight: Radius.circular(round as double),
                  ),
                ),
                child: Center(

                  child: Text(
                    "Registration sss",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),



              !isExpanded
                  ? AnimatedPositioned(
                duration: Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                top: MediaQuery.of(context).size.height * btnPosition!,
                left: 1,
                child: GestureDetector(
                  onTap: togglePosition,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Container(
                        child: Text("Login", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              )
                  : AnimatedPositioned(
                duration: Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                top: MediaQuery.of(context).size.height * btnPosition!,
                left: 1,
                child: GestureDetector(
                  onTap: togglePosition,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Container(
                        child: Text("Registration", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
