import 'package:fashionflow/frontend/chat/chat.dart';
import 'package:fashionflow/frontend/details/details.dart';
import 'package:fashionflow/frontend/search/search.dart';
import 'package:fashionflow/frontend/superimpose/superimpose.dart';
import 'package:flutter/material.dart';
import 'frontend/splash/splash.dart';
import 'frontend/home/home.dart';


Map<String, WidgetBuilder> routes = {
  "/": (context) => const Splash(),
  "/home": (context) => const Home(),
  "/details": (context) => Details(),
  "/search": (context) => const Search(),
  "/chat": (context) => const Chat(),
  "/superimpose": (context) => const SuperImpose(),
};
