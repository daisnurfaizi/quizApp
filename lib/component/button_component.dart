import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent(this.startQuiz, this.text, {Key? key})
      : super(key: key);

  final String text;
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: SizedBox(
        height: 30,
        child: OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Icons.play_arrow),
          label: Text(text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
