import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numberController = new TextEditingController();
  var messageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send SMS'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              margin: EdgeInsets.only(top: 80),
              child: TextField(
                controller: numberController,
                decoration: InputDecoration(labelText: 'Type number'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              margin: EdgeInsets.only(top: 30),
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(labelText: 'Type your message'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: ElevatedButton(
                  onPressed: () async {
                    SmsSender sender = new SmsSender();
                    var result = await sender.sendSms(new SmsMessage(
                        numberController.text, messageController.text));
                    print(result.date);
                  },
                  child: Text('Send message')),
            )
          ],
        ),
      ),
    );
  }
}
