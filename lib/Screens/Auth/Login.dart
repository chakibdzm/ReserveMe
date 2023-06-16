import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reserve_me/Screens/Home/Home.dart';
import 'package:reserve_me/Size_config.dart';
import 'package:reserve_me/const.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            height: getHeight(350),
            width: getWidth(395),
            decoration: BoxDecoration(
              color: const Color(0xc7d37322),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(getHeight(32)),bottomLeft: Radius.circular(getHeight(32)))
            ),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ReserveMe',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getHeight(22),
                      fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height: getHeight(10),),
                SvgPicture.asset("assets/illustrations/table-svgrepo-com.svg",
                height: getHeight(80),
                  width: getWidth(90),
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(height: getHeight(20),),
          Center(child: Text('Sign In',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: getHeight(18)
          ),
          ),),
          SizedBox(height: getHeight(15),),
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
        child: TextFormField(
          controller: _emailController,

          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: getHeight(18),
            color: Colors.black,
          ),

          cursorColor: const Color(0xFF9DA3B6),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xc7d37322),
              ),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: getHeight(20),
                horizontal: getWidth(20)),
            prefixIconConstraints: const BoxConstraints(maxHeight: 25),

            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.none,
                  color: Color(0xc7d37322),
                )),
            fillColor:Colors.white,
            filled: true,
            hintText: 'Adresse e-mail ou numéro de téléphone portable',

            hintStyle: TextStyle(

              fontSize: getHeight(12),
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),

          ),
        ),
      ),
          SizedBox(height: getHeight(20),),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
            child: TextFormField(
              controller: _passwordController,
              obscureText: _obscureText,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: getHeight(18),
                color: Colors.black,
              ),

              cursorColor: const Color(0xFF9DA3B6),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0xc7d37322),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: getHeight(20),
                    horizontal: getWidth(20)),
                prefixIconConstraints: const BoxConstraints(maxHeight: 25),

                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:  BorderSide(
                      width: 1,
                      style: BorderStyle.none,
                      color: kprimary
                    )),
                fillColor:Colors.white,
                filled: true,
                hintText: 'password',

                hintStyle: TextStyle(

                  fontSize: getHeight(12),
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: getWidth(16)),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          })
                          ;
                        },
                        child:_obscureText?
                        const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined)

                    ),
                  )

              ),
            ),
          ),
          SizedBox(height: getHeight(35),),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: getWidth(45)),
            child: GestureDetector(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>const HomeScreen() )),
              child: Container(
                height: getHeight(70),
                decoration: BoxDecoration(
                  color:kprimary,
                  borderRadius: BorderRadius.circular(getHeight(15))
                ),
                child: Center(child: Text('Login',
                style: TextStyle(color: Colors.white,
                fontSize: getHeight(14),
                fontWeight: FontWeight.w500),
                ),),
              ),
            ),
          ),




        ],
      ),
      ),


    );
  }
}
