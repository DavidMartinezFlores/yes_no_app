import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
  final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colors.secondary
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Text(style:TextStyle(color: Colors.white),"Hola!"),
          ),
        ),
        const SizedBox(height: 10),
        const _ImageBubble(),
        const SizedBox(height: 10)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network('https://yesno.wtf/assets/yes/5-64c2804cc48057b94fd0b3eaf323d92c.gif',scale: 1.0,)
      );
  }
}

