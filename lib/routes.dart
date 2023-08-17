import 'package:fashionflow/frontend/details/details.dart';
import 'package:fashionflow/frontend/search/search.dart';
import 'package:flutter/material.dart';
import 'frontend/splash/splash.dart';
import 'frontend/home/home.dart';


Map<String, WidgetBuilder> routes = {
  "/": (context) => const Splash(),
  "/home": (context) => const Home(),
  "/details": (context) => const Details(),
  // "/search": (context) => const Search(value: "Default"),
};
