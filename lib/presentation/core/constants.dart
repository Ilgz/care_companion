import 'package:cash_manager/domain/intro/intro_item.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static const articlePage = "/article";
  static const introPage = "/intro";
}

class AppColorConstants {
  static const lightScaffoldBackgroundColor = Colors.white;
  static const darkScaffoldBackgroundColor = Color(0xFF1C7549);
  static const lightPrimaryColor = Color(0xff74D25D);
  static const darkPrimaryColor = Colors.green;
}

class AppConstants {
  static const isDark = "is_dark";
  static const locale = "locale";
}

List<IntroItem> introItems = [
  IntroItem(
      "Simplify your childcare routine",
      "With our app, you can keep track of your child's schedule, receive personalized advice, and much more.",
      "1"),
  IntroItem(
      "Get customized recommendations for your child",
      "Our app provides you with personalized advice based on your child's age, preferences, and needs.",
      "2"),
  IntroItem(
      "Play and learn with your child",
      "Our app provides you with fun and engaging game ideas that you can play with your child.",
      "3"),
  IntroItem(
      "Keep in touch with your child's caregiver",
      "Our app allows you to stay connected with your child's caregiver throughout the day.",
      "4"),
];
