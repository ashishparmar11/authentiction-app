import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Home.dart';


enum LoginScreen{
  SHOW_MOBILE_ENTER_WIDGET,
  SHOW_OTP_FORM_WIDGET
}
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController  phoneController = TextEditingController();
  TextEditingController  otpController = TextEditingController();
  LoginScreen currentState = LoginScreen.SHOW_MOBILE_ENTER_WIDGET;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationID = "";

  void SignOutME() async{
    await _auth.signOut();
  }
  void signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async
  {

    try {
      final authCred = await _auth.signInWithCredential(phoneAuthCredential);

      if(authCred.user != null)
      {

        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Home()));
      }
    } on FirebaseAuthException catch (e) {

      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Some Error Occured. Try Again Later')));
    }
  }


  showMobilePhoneWidget(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(top: 200.0),
            child: Text('Please Enter your Phone Number',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          ),

          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: Text('You\'ll receive 6 digit code to verify next',
              style: TextStyle(fontSize: 12),),
          ),
          SizedBox(height: 7,),
          SizedBox(height: 20,),
          Center(
            child: TextField(

              controller: phoneController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: "Enter Your PhoneNumber"

              ),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () async {
            await _auth.verifyPhoneNumber(

                phoneNumber: "+91${phoneController.text}",
                verificationCompleted: (phoneAuthCredential) async {


                },
                verificationFailed: (verificationFailed) {
                  print(verificationFailed);
                },

                codeSent: (verificationID, resendingToken) async {
                  setState(() {
                    currentState = LoginScreen.SHOW_OTP_FORM_WIDGET;
                    this.verificationID = verificationID;
                  });
                },
                codeAutoRetrievalTimeout: (verificationID) async {

                }
            );
          }, child: Text("Get OTP")),
          SizedBox(height: 16,),
          Spacer()

        ],
      ),
    );
  }

      // crossAxisAlignment: CrossAxisAlignment.center,
      // children: [
      //   Spacer(),
      //
      //   Text("Please Enter Phone Number" , style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      //   Text("You'll receive 6 digit code to verify next" , style: TextStyle(fontSize: 12),),
      //


  showOtpFormWidget(context){
    return Center(
        child :Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 200.0),
              child: Text('Verify Phone',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            ),

            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Text('Code is Send to :-',
                style: TextStyle(fontSize: 12),),
            ),
            Container(
              child: Text("+91${phoneController.text}",
                style: TextStyle(fontSize: 12),),
            ),

            Text("ENTER YOUR OTP" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 7,),
            SizedBox(height: 20,),

            Center(
              child:       TextField(

                controller: otpController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(

                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    hintText: "Enter Your OTP",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Text('Didn\'t receive the code Resend Again',
                style: TextStyle(fontSize: 12),),
            ),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: () {

              AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otpController.text);
              signInWithPhoneAuthCred(phoneAuthCredential);
            }, child: Text("Verify And Continue")),
            SizedBox(height: 16,),
            Spacer()
          ],
        ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentState == LoginScreen.SHOW_MOBILE_ENTER_WIDGET ? showMobilePhoneWidget(context) : showOtpFormWidget(context),
    );
  }
}