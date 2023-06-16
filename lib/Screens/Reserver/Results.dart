import 'package:flutter/material.dart';
import 'package:reserve_me/Size_config.dart';
class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getHeight(33),),
              Padding(
                padding:  EdgeInsets.only(left: getWidth(20)),
                child: Row(
                  children: [
                    Text("Search Results For : .....",
                    style: TextStyle(
                      fontSize: getHeight(17),
                      fontWeight: FontWeight.w600
                    ),

                    ),
                    SizedBox(width: getWidth(150),),
                    InkWell(
                      onTap: ()=>Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios),
                    )
                  ],
                ),
              ),
              SizedBox(height: getHeight(25),),
              SizedBox(

                height: getHeight(750),

                child:ListView.builder(
                scrollDirection: Axis.vertical,
    itemCount: 20,
    itemBuilder: (BuildContext context, int index) {
    return
        Padding(
          padding:  const EdgeInsets.all(8.0),
          child: Container(
            height: getHeight(120),
            width: getWidth(320),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(-1,1),
                  ),
                ],
              color: Colors.white,

              borderRadius: BorderRadius.circular(getHeight(18))
            ),
            child: Stack(
              children: [
                Positioned(
                    top:getHeight(40),
                    right: getWidth(19),
                    child: Text("89,99\$",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: getHeight(17)
                ),
                )),
                Positioned(
                    right: getWidth(19),
                    top: getHeight(80),
                    child: Row(children: [
                  const Icon(Icons.event_available,color: Colors.green,),
                      SizedBox(width: getWidth(5),
                      ),
                      const Text("Available",
                      style:
                        TextStyle(color: Colors.green,
                        fontWeight: FontWeight.w600
                        ),
                      )
                ],)),
                Positioned(
                  top: getHeight(15),
                  left: getWidth(32),
                  child: Text("Date of reservation : 17 july 2023",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: getHeight(14)
                  ),

                  ),
                ),
                Positioned(
                    left: getWidth(32),
                    top: getHeight(35),

                    child: Text("For more details tap in",
                style: TextStyle(color: Colors.black,
                fontSize: getHeight(14)),
                )),
                Positioned(
                    left: getWidth(32),
                    bottom: getHeight(15),
                    child: const Text("Location : Outside",
                style: TextStyle(
                fontWeight: FontWeight.w600

                ),

                ))
              ],
            ),
          ),
        );
        })
              )

            ],
          ),
        ),
      ),
    ));
  }
}
