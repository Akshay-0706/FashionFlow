import 'package:fashionflow/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SuperImpose extends StatelessWidget {
  const SuperImpose({super.key});

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const FaIcon(Icons.arrow_back_ios_new_rounded)),
                const SizedBox(width: 20),
                Text(
                  "Change your photos",
                  style: TextStyle(
                    color: pallete.primaryDark,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
