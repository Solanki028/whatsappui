import 'package:flutter/material.dart';

class ChatModel {
  final String name;
  final  IconData  icon;
  final bool isGroup;
  final String time;
  final String currentMessage;
  final String status;
  

  ChatModel({
    required this.name,
    required this.icon,
    required this.isGroup,
    required this.time,
    required this.currentMessage,
    required this.status,
  });
}
