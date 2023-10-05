import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

class MessageFieldBox extends StatelessWidget {
  //final ValueChanged<String> onValue;

  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    final colors = Theme.of(context).colorScheme;
    final outLineInputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(40));

    final textController = TextEditingController();

    final focusNode = FocusNode();

    final inputDecoration = InputDecoration(
        hintText: 'End your msg with ?',
        focusedBorder: outLineInputBorder,
        enabledBorder: outLineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            chatProvider.sendMessage(textValue);
            //onValue(textValue);
            textController.clear();
          },
        ));

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        chatProvider.sendMessage(value);
        //onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
      // onChanged: (value) {
      //   print('changed: $value');
      // },
    );
  }
}
