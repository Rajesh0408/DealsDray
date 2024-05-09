import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPPage extends StatefulWidget {
  int? phoneno;
  OTPPage(this.phoneno, {super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  int? phoneno;
  int secondsRemaining = 120;
  bool enabledResend = false;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneno = widget.phoneno;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enabledResend = true;
        });
        timer.cancel();
      }
    });
  }

  String getFormattedTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    String remainingTime = getFormattedTime(secondsRemaining);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: UI(phoneno!, context, remainingTime),
    );
  }
}

UI(int phoneno, BuildContext context, String remainingTime) {
  return ListView(
    children: [
      SizedBox(
        height: 80,
      ),
      Row(
        children: [
          SizedBox(
            width: 40,
          ),
          SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQcObG8gMHDjlh4WWcfh62q5LbD0XyTg2Zm8DpJZ4sVQ&s")),
        ],
      ),
      SizedBox(
        height: 25,
      ),
      Row(
        children: [
          SizedBox(
            width: 40,
          ),
          Text(
            "OTP Verification",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      SizedBox(
        height: 25,
      ),
      Row(
        children: [
          SizedBox(
            width: 40,
          ),
          Expanded(
            child: Text(
              "We have sent a unique OTP number to your mobile number ${phoneno}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 25,
      ),
      otpTextField(context),
      SizedBox(
        height: 25,
      ),
      timer(remainingTime),
    ],
  );
}

timer(String remainingTime) {
  return Row(
    children: [
      SizedBox(
        width: 30,
      ),
      Text(
        "${remainingTime}",
        style: TextStyle(fontSize: 22),
      ),
      SizedBox(
        width: 170,
      ),
      TextButton(
          onPressed: () {},
          child: Text(
            "SEND AGAIN",
            style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
                decoration: TextDecoration.underline),
          ))
    ],
  );
}

otpTextField(BuildContext context) {
  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
          4,
          (index) => SizedBox(
                width: 50,
                height: 50,
                child: TextField(
                  controller: otpControllers[index],
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                    if (index == 3) {
                      var otp = otpControllers
                          .map((controller) => controller.text)
                          .join();
                      print(otp);
                    }
                  },
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(color: Colors.grey)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              )));
}
