import 'package:fashionflow/frontend/home/components/body.dart';
import 'package:fashionflow/theme.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/chat");
          },
          backgroundColor: pallete.primaryDark,
          foregroundColor: pallete.background,
          child: const Center(
            child: Icon(Icons.chat_rounded),
          ),
        ),
      ),
      body: HomeBody(),
    );
  }
}
