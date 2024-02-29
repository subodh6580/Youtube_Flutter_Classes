// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:my_first_app/home_screen_page.dart';
import 'package:my_first_app/homepage.dart';

class OTPScreenPage extends StatefulWidget {
  @override
  State<OTPScreenPage> createState() => _OTPScreenPageState();
}

class _OTPScreenPageState extends State<OTPScreenPage> {
  TextEditingController otpController = TextEditingController();
  sendDataToServer(otpData) async {
    //print(otpData);
    final dio = Dio(); //DECLARE DIO INSTANCE FOR HTTP REQUEST

    try {
      final response = await dio.post(
        'https://nitsilchar.co.in/cinvonyosis_apiv1/login/validateotp',
        data: otpData,
      );
      if (response.statusCode == 200) {
        var snackBar = const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Login Success!!',
            ));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print(response.data);
        Navigator.push(
          context,
          //MaterialPageRoute(builder: (context) => const MyHomePage()
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      }
    } on DioException catch (e) {
      var snackBar = const SnackBar(
          content: Text(
        'OTP not matched!!',
        style: TextStyle(color: Colors.red),
      ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      if (e.response != null) {
      } else {
        print(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Text(
            'OTP Verification',
            style: TextStyle(fontSize: 40),
          ),
          const SizedBox(
            height: 50,
          ),
          OtpTextField(
            textStyle: const TextStyle(fontSize: 25, color: Colors.black),
            numberOfFields: 6,
            borderColor: Colors.black,
            showFieldAsBox: false,
            borderWidth: 4.0,
            onCodeChanged: (String code) {
              //handle validation or checks here if necessary
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              otpController.text = verificationCode;
              print("onSubmit $verificationCode");
              // _handleLogin();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 280,
            height: 60,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {
                  var otpData = {
                    "userotp1": otpController.text,
                    "email": "manager@gmail.com",
                  };
                  //print(otpData);
                  sendDataToServer(otpData);
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Not received change email?',
                style: TextStyle(color: Colors.black),
              ))
        ],
      )),
    ));
  }
}
