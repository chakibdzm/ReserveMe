import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:reserve_me/Screens/Reserver/Reserve.dart';
import 'package:reserve_me/Size_config.dart';
import 'package:reserve_me/const.dart';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  bool _bool = true;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 600));

    _animation1 = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _bool = true;
        }
      });
    _animation2 = Tween<double>(begin: 0, end: .3).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animation3 = Tween<double>(begin: .9, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          brightness: Brightness.dark,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.menu_rounded,color: kprimary,size: getHeight(35),),
            splashColor: Colors.transparent,
            onPressed: () {
              if (_bool == true) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
              _bool = false;
            },
          ),
        ),
        body: Stack(
          children: [

            BackgroundImage(),

            CustomNavigationDrawer(),









    ],
        ),
      ),
    );
  }

  Widget CustomNavigationDrawer() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BackdropFilter(
      filter: ImageFilter.blur(
          sigmaY: _animation1.value, sigmaX: _animation1.value),
      child: Container(
        height: _bool ? 0 : height,
        width: _bool ? 0 : width,
        color: Colors.transparent,
        child: Center(
          child: Transform.scale(
            scale: _animation3.value,
            child: Container(
              width: width * .9,
              height: width * 1.3,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(_animation2.value),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 35,
                    child: Icon(
                      Icons.person_outline_rounded,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Column(
                    children: [
                      MyTile(Icons.history_outlined, 'My Reserves', () {
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(
                          msg: 'Button pressed',
                        );
                      }),
                      MyTile(Icons.info_outline_rounded, 'About', () {
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(
                          msg: 'Button pressed',
                        );
                      }),
                      MyTile(Icons.feedback_outlined, 'Feedback', () {
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(
                          msg: 'Button pressed',
                        );
                      }),
                      MyTile(Icons.find_in_page_outlined, 'Privacy Policy', () {
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(
                          msg: 'Button pressed',
                        );
                      }),
                    ],
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget BackgroundImage() {
    return Stack(
      children: [
        Positioned(top: getHeight(55),
          left: getWidth(15),child: Text("Welcome To ReserveMe",
          style: TextStyle(
              fontSize: getHeight(18),
              fontWeight: FontWeight.w700
          ),
        ),
        ),
        Positioned(
          bottom: 0,
          top: getHeight(150),
          child: Container(
            width: getWidth(397),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(getHeight(35)),
                    topLeft: Radius.circular(getHeight(35))),
                color: kprimary),
            child: Padding(
              padding:  EdgeInsets.only(top: getHeight(10)),
              child: GridView.count(
                  crossAxisSpacing: 10.0,
                  // Spacing between columns
                  mainAxisSpacing: 10.0,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  childAspectRatio: 1,
                  padding: EdgeInsets.symmetric(
                      horizontal: getWidth(20), vertical: getHeight(15)),
                  crossAxisCount: 2,
                  children: List.generate(10, (int index) {
                    return InkWell(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>const ReserveScreen() )),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(getHeight(18)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(getHeight(18)),
                          child: Stack(children: [
                            Image.asset(
                              "assets/illustrations/Happy-Birthday-Decoration-Transparent-Background.png",
                              fit: BoxFit.contain,
                            ),
                            Positioned.fill(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 4), // Set blur sigma values
                                child: Container(
                                  color: Colors.transparent, // Make the container transparent
                                ),
                              ),
                            ),
                            Center(child: Text("Birthday Parties",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: getHeight(20)
                              ),

                            ),)

                          ]),
                        ),
                      ),
                    );
                  })),
            ),
          ),
        ),
      ],
    );

  }
  Widget MyTile(
      IconData icon,
      String title,
      VoidCallback voidCallback,
      ) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.black.withOpacity(.08),
          leading: CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          onTap: voidCallback,
          title: Text(
            title,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          trailing: const Icon(
            Icons.arrow_right,
            color: Colors.black,
          ),
        ),
        divider()
      ],
    );
  }
  Widget divider() {
    return SizedBox(
      height: 5,
      width: MediaQuery.of(context).size.width,
    );
  }





}
