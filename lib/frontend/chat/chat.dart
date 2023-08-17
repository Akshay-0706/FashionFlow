import 'package:fashionflow/size.dart';
import 'package:fashionflow/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';

import 'chat_card.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final box = GetStorage();

  late TextEditingController controller;
  late ScrollController scrollController;
  String message = "";

  int prompt = 0;

  List<Message> chats = [
    Message("Hello, how can I help you today?", DateTime.now(), false, true),
    // Message("assets/images/products_1/image-1.png", DateTime.now(), true, false),
  ];

  void addMessage(String message, bool isHuman) {
    setState(() {
      chats.add(Message(message, DateTime.now(), false, false));
      Future.delayed(
        const Duration(milliseconds: 2000),
        () => scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn),
      );
      if (isHuman) {
        if (prompt == 0) {
          Future.delayed(
            const Duration(milliseconds: 200),
            () => setState(() {
              chats.add(Message(
                  "Please wait, searching...", DateTime.now(), false, true));
            }),
          );
          Future.delayed(
            const Duration(milliseconds: 2000),
            () => setState(() {
              chats.add(Message(
                  "Here are the relevant images that you can refer to",
                  DateTime.now(),
                  false,
                  true));
              chats.add(Message("assets/images/search/image-3.png",
                  DateTime.now(), true, true));
              chats.add(Message("assets/images/search/image-4.png",
                  DateTime.now(), true, true));
              chats.add(Message("assets/images/search/image-5.png",
                  DateTime.now(), true, true));
            }),
          );
        } else {
          Future.delayed(
            const Duration(milliseconds: 200),
            () => setState(() {
              chats.add(Message(
                  "Please wait, searching...", DateTime.now(), false, true));
            }),
          );
          Future.delayed(
            const Duration(milliseconds: 2000),
            () => setState(() {
              chats.add(Message("Here are the different styles", DateTime.now(),
                  false, true));
              chats.add(Message(
                  "assets/images/ai/image-1.jpg", DateTime.now(), true, true));
              chats.add(Message("Style 1, you can use it as a flannel shirt",
                  DateTime.now(), false, true));
              chats.add(Message(
                  "assets/images/ai/image-2.jpg", DateTime.now(), true, true));
              chats.add(Message("Style 2, you can roll up the sleeves",
                  DateTime.now(), false, true));
              chats.add(Message(
                  "assets/images/ai/image-3.jpg", DateTime.now(), true, true));
              chats.add(Message("Style 3, you can wear a watch with it",
                  DateTime.now(), false, true));
            }),
          );
        }
      }
    });
  }

  @override
  void initState() {
    controller = TextEditingController();
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

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
                  child: const FaIcon(Icons.arrow_back_ios_new_rounded),
                ),
                const SizedBox(width: 20),
                Text(
                  "FlowBot",
                  style: TextStyle(
                    color: pallete.primaryDark,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            ChatList(
              chats: chats,
              pallete: pallete,
              scrollController: scrollController,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getWidth(10),
                  right: getWidth(10),
                  bottom: getWidth(10)),
              child: Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF32426B), width: 2),
                    borderRadius: BorderRadius.circular(getWidth(20)),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF32426B).withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: const Offset(5, 5))
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          maxLines: 3,
                          minLines: 1,
                          style: TextStyle(color: pallete.primaryDark),
                          onChanged: (value) {
                            message = value;
                            print(message);
                          },
                          cursorColor: pallete.primaryDark,
                          cursorRadius: const Radius.circular(8),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type a message",
                            counterText: "",
                            hintStyle: TextStyle(
                              color: pallete.primaryLight,
                              fontSize: getHeight(16),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: getWidth(10)),
                      GestureDetector(
                        onTap: () {
                          print(message);
                          if (message.isNotEmpty) {
                            addMessage(message, true);
                            if (prompt == 1) {
                              Future.delayed(
                                const Duration(milliseconds: 100),
                                () => setState(() {
                                  chats.add(
                                    Message(
                                      "assets/images/upload.jpg",
                                      DateTime.now(),
                                      true,
                                      false,
                                    ),
                                  );
                                }),
                              );
                            }
                            prompt++;
                            controller.text = "";
                          }
                        },
                        child: Icon(Icons.send_rounded,
                            color: pallete.primaryDark),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
