import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:test01/models/canteen.dart';

class SendMail {
  void sendMailCard() async {
    final user = FirebaseAuth.instance.currentUser!;

    // creating sender and receiver for owner
    String recipientEmail = 'bishnu.bgb99@gmail.com';
    String username = 'nirajan.ngm99@gmail.com';
    String password = 'dbas izrs dsfi aley';
    String receipt = Canteen().displayCartReceipt();

    //

    final smtpServer = gmail(username, password);
// creating message
    final message = Message()
      ..from = Address(username, 'Jasmin Nasta Mail Service')
      ..recipients.add(recipientEmail)
      ..subject = 'Order Received... :o from ${user.email}\n *Card_Payment*'
      ..text =
          'Heads up!! Order received...  from ${user.email}\n \n$receipt\n';

    try {
      await send(message, smtpServer);
      if (kDebugMode) {
        print("message sent");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> sendMailCash() async {
    final user = FirebaseAuth.instance.currentUser!;

    // creating sender and receiver for owner
    String recipientEmail = 'bishnu.bgb99@gmail.com';
    String username = 'nirajan.ngm99@gmail.com';
    String password = 'dbas izrs dsfi aley';
    String receipt = Canteen().displayCartReceipt();

    final smtpServer = gmail(username, password);
// creating message
    final message = Message()
      ..from = Address(username, 'Jasmin Nasta Mail Service')
      ..recipients.add(recipientEmail)
      ..subject = 'Order Received... :o from ${user.email}\n *Cash_Payment*'
      ..text =
          'Heads up!! Order received...  from ${user.email}\n \n$receipt\n';

    try {
      await send(message, smtpServer);
      if (kDebugMode) {
        print("message sent");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> sendMailC() async {
    // creating sender and receiver for customer
    final user = FirebaseAuth.instance.currentUser!;

    String recipientEmail = user.email!;
    String username = 'nirajan.ngm99@gmail.com';
    String password = 'dbas izrs dsfi aley';
    String receipt = Canteen().displayCartReceipt();

    final smtpServer = gmail(username, password);
// creating message
    final message = Message()
      ..from = Address(username, 'Jasmin Nasta Mail Service')
      ..recipients.add(recipientEmail)
      ..subject = 'Thank you for ordering... :) '
      ..text =
          'Here is your receipt $receipt\n *Note: please have your receipt until you get your order*\n';

    try {
      await send(message, smtpServer);
      if (kDebugMode) {
        print("message sent");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
