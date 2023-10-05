import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answeer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final yesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    //Message(text: "Hola amor!", fromWho: FromWho.me),
    //Message(text: "Ya regresaste del trabajo?", fromWho: FromWho.hers),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith("?")) {
      await herReplay();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReplay() async {
    final herMessage = await yesNoAnswer.getAnswer();
    messageList.add(herMessage);
  }

  void moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut);
  }
}
