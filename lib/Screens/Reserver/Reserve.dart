

import 'package:flutter/material.dart';
import 'package:reserve_me/Screens/Reserver/Results.dart';
import 'package:reserve_me/Size_config.dart';
import 'package:reserve_me/const.dart';
import 'package:intl/intl.dart';
class ReserveScreen extends StatefulWidget {
  const ReserveScreen({Key? key}) : super(key: key);

  @override
  State<ReserveScreen> createState() => _ReserveScreenState();
}

class _ReserveScreenState extends State<ReserveScreen> {
  late DateTime selectedDate = DateTime.now();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }


  int selectedIndex = -1;
  int selectedIndexHour = -1;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(child: Scaffold(

      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getHeight(35),),
            Padding(
              padding:  EdgeInsets.only(left: getWidth(20)),
              child: Row(
                children: [
                  Text("Reserving For ....",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: getHeight(18)
                  ),
                  ),
                  SizedBox(width: getWidth(190),),
                  InkWell(
                    onTap: ()=>Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios),
                  )
                ],
              ),
            ),
            SizedBox(height: getHeight(20),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: double.infinity
                ),

                decoration: BoxDecoration(
                  color: kprimary,
                  borderRadius: BorderRadius.circular(getHeight(15))
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: getWidth(20),vertical: getHeight(10)),
                  child: const Text('description that contains what should the user chooses and be aware of and other stuff like lorem askit denver kool bef tgisdfj and you are too awary of fgcv clyn fgti gotpand ever body is sd',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                ),
              ),
            ),
            SizedBox(height: getHeight(20),),
            Padding(
              padding:  EdgeInsets.only(left: getWidth(20)),
              child: Text("Please Select the Following To Find You The Best :",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: getHeight(getHeight(16))
              ),
              ),
            ),

            SizedBox(height: getHeight(40),),
            Padding(
              padding:  EdgeInsets.only(left: getWidth(20)),
              child: Row(
                children: [
                  const Text("Select The Date :",
                  style: TextStyle(
                    fontWeight: FontWeight.w700
                  ),),
                  SizedBox(width: getWidth(20),),
                  Container(
                    height: getHeight(30),
                    width: getWidth(130),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: kprimary, width: 1.0),
                        color:Colors.white ),
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: getWidth(8),vertical: getHeight(4)),
                        child: Text(DateFormat('MMM d, y').format(selectedDate),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600
                        ),),
                      ),
                    ),
                  )
                ],
              )
            ),

            SizedBox(height: getHeight(35),),
            Padding(
              padding: EdgeInsets.only(left: getWidth(20)),
              child: const Text("Select The Number Of Persons :",
              style: TextStyle(
                fontWeight: FontWeight.w700

              ),
              ),
            ),
            SizedBox(height: getHeight(20),),
        Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
        child: SizedBox(
          height: getHeight(160),
          child: GridView.builder(

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              crossAxisCount: 4,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedIndex == index ? kprimary : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color:selectedIndex == index ?Colors.white  :kprimary ,width: 1.0 )
                  ),
                  child: Center(
                    child: Text(
                      '${index+1}',
                      style: TextStyle(
                        color: selectedIndex == index?Colors.white:Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        ),
            SizedBox(height: getHeight(35),),
            Padding(
              padding: EdgeInsets.only(left: getWidth(20)),
              child: const Text("Select The Number Of Hours :",
                style: TextStyle(
                    fontWeight: FontWeight.w700

                ),
              ),
            ),
            SizedBox(height: getHeight(20),),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
              child: SizedBox(
                height: getHeight(80),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    crossAxisCount: 3,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndexHour = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: selectedIndexHour == index ? kprimary : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color:selectedIndexHour == index ?Colors.white  :kprimary ,width: 1.0 )
                        ),
                        child: Center(
                          child: Text(
                            '${index+1}',
                            style: TextStyle(
                              color: selectedIndexHour == index?Colors.white:Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),



            const Spacer(),
            Center(
              child: InkWell(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=> const ResultScreen())),
                child: Container(
                  height: getHeight(70),
                  width: getWidth(220),
                  decoration: BoxDecoration(
                    color: kprimary,
                    borderRadius: BorderRadius.circular(getHeight(15))

                  ),
                  child: Center(
                    child: Text("Find it !",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: getHeight(17)
                    ),
                    ),
                  ),

                ),
              ),
            ),
            SizedBox(height: getHeight(35),)

          ],
        ),
      ),
    ));
  }
}
