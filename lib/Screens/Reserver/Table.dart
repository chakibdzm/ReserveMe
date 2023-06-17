import 'package:flutter/material.dart';
import 'package:reserve_me/Size_config.dart';
import 'package:reserve_me/const.dart';
class TableScreen extends StatefulWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {


  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              const Icon(Icons.warning,color: Colors.red,),
              SizedBox(width: getWidth(5),),
              const Text('Caution'),
            ],
          ),
          content: const Text('After Reservation Payment you won\'t be able to cancel it so be sure before doing any thing ,for any issue contact us.',),
          actions: [
            InkWell(
              child: Container(
                  height: getHeight(40),
                  width: getWidth(70),
                  decoration: BoxDecoration(
                    color: kprimary,
                    borderRadius: BorderRadius.circular(getHeight(15))
                  ),


                  child: Center(child: Text('OK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getHeight(15),
                    fontWeight: FontWeight.w600
                  ),
                  ))),
              onTap: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              SizedBox(height: getHeight(35),),
              Row(
                children: [
                  Text("TABLE N°17",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: getHeight(17)
                  ),),
                  const Spacer(),
                  InkWell(
                    onTap: ()=>Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new),
                  )
                ],
              ),
              SizedBox(height: getHeight(20),),

              Container(
                height: getHeight(480),
                width: getWidth(392),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(getHeight(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(-1,1),
                    ),
                  ],

                ),
                child: Padding(
                  padding:  EdgeInsets.all(getHeight(15)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on,size: getHeight(22),color: kprimary,),
                        SizedBox(width: getWidth(5),),
                        Text("Placement of Table :",
                        style: TextStyle(
                          fontSize: getHeight(15),
                          fontWeight: FontWeight.w500
                        ),
                        ),
                      ],
                    ),
                    SizedBox(height: getHeight(15),),
                    Row(
                      children: [
                        Icon(Icons.calendar_month,size: getHeight(22),color: kprimary,),
                        SizedBox(width: getWidth(5),),
                        Text("Date :",
                          style: TextStyle(
                              fontSize: getHeight(15),
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getHeight(15),),
                    Row(
                      children: [
                        Icon(Icons.hourglass_bottom,size: getHeight(22),color: kprimary,),
                        SizedBox(width: getWidth(5),),
                        Text("Hours Available :",
                          style: TextStyle(
                              fontSize: getHeight(15),
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: getHeight(15),),

                  ],),
                ),
              ),
              const Spacer(),
              Center(child: InkWell(
                onTap: ()=>showAlertDialog(context),
                child: Container(
                  height: getHeight(65),
                  width: getWidth(200),
                  decoration: BoxDecoration(
                    color: kprimary,
                    borderRadius: BorderRadius.circular(getHeight(15))
                  ),
                  child: Center(
                    child: Text("Reserve It",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: getHeight(16)
                      ),
                    ),
                  ),
                ),
              )
                ,),
              SizedBox(height: getHeight(40),),


            ],
          ),
        ),
      ),
    );
  }
}
