import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test01/models/canteen.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Thank you for your order... :) \n"),
            const SizedBox(height: 25),
            const Text(
                "*Note: pease have your receipt until you get your order * \n"),
            const SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(25),
              child: Consumer<Canteen>(
                builder: (context, canteen, child) =>
                    Text(canteen.displayCartReceipt()),
              ),
            ),
            const SizedBox(height: 25),
            const Text("Thank you for your purchase... :) "),
          ],
        ),
      ),
    );
  }
}
