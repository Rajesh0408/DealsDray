import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  int index = 0;
  TextEditingController controller = TextEditingController();
  int? phoneno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_new),
        ),
        body: body());
  }

  body() {
    return Column(
      children: [
        Center(
          child: Image.network(
              'https://play-lh.googleusercontent.com/Im3CE-kmZJmZMC8pkhpCj7tGznPI6LC1EjhaTJ3E6Cdh_mgW5VxF_joZK31XWwZPmkT5=w240-h480-rw'),
        ),
        ToggleSwitch(
          // initialLabelIndex: 0,
          cornerRadius: 50,
          minWidth: 100,
          activeBgColor: [Colors.red],
          labels: ["Phone", "Email"],
          onToggle: (ind) {

          },
        ),
        if (index==0) phoneUI()
      ],
    );
  }

  phoneUI() {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            SizedBox(
              width: 60,
            ),
            Text(
              "Glad to see you!",
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
              width: 60,
            ),
            Text(
              "Please provide your phone number",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 300,
          height: 100,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Phone",
            ),
            controller: controller,
            keyboardType: TextInputType.number,
            maxLines: 1,
            cursorHeight: 25,
            style: TextStyle(fontSize: 20),
            onChanged: (val) {
              phoneno = int.parse(val);
            },
          ),
        ),
        MaterialButton(onPressed: () {},
        height: 60,
        minWidth: 300,
        color: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15,),),
        child: Text("SEND CODE",style:TextStyle(fontSize: 20,color: Colors.white),),)
      ],
    );
  }

}
