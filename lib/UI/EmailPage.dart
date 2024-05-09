import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  TextEditingController emailController = TextEditingController();
  String? emailId;
  TextEditingController passwordController = TextEditingController();
  String? password;
  TextEditingController referralController = TextEditingController();
  String? referralCode;
  bool obscure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: emailUI(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton(
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          onPressed: () {},
        ),
      ),
    );
  }

  emailUI() {
    return ListView(
      children: [
        SizedBox(
          height: 40,
        ),
        Center(
          child: Image.network(
              'https://play-lh.googleusercontent.com/Im3CE-kmZJmZMC8pkhpCj7tGznPI6LC1EjhaTJ3E6Cdh_mgW5VxF_joZK31XWwZPmkT5=w240-h480-rw'),
        ),
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text(
              "Let's Begin!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text(
              "Please enter your credentials to proceed",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 38),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Your Email",
            ),
            controller: emailController,
            maxLines: 1,
            cursorHeight: 25,
            style: TextStyle(fontSize: 20),
            onChanged: (val) {
              emailId = val.toString();
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 38),
          child: Container(
            width: 340,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Create Password",
                  suffixIcon: IconButton(
                    icon:
                        Icon(obscure ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                  )),
              obscureText: obscure,
              controller: passwordController,
              maxLines: 1,
              cursorHeight: 25,
              style: TextStyle(fontSize: 20),
              onChanged: (val) {
                password = val.toString();
              },
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 38),
          child: Container(
            width: 340,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Referral Code(Optional)",
              ),
              controller: referralController,
              maxLines: 1,
              cursorHeight: 25,
              style: TextStyle(fontSize: 20),
              onChanged: (val) {
                referralCode = val.toString();
              },
            ),
          ),
        ),
      ],
    );
  }
}
