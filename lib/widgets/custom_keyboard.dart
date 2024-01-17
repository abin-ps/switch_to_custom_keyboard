import 'package:flutter/material.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

class CustomKeyboard extends StatelessWidget {
  const CustomKeyboard({
    super.key,
    required this.showKeyboard,
    required this.controller,
  });

  final bool showKeyboard;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return showKeyboard?
        // ? AnimatedPadding(
        //     padding: MediaQuery.of(context).viewInsets,
        //     duration: const Duration(milliseconds: 300),
        //     curve: Curves.easeInOut,
            // child: 
            ColoredBox(
              color: Theme.of(context).primaryColor.withOpacity(.8),
              child: VirtualKeyboard(
                fontSize: 20,
                textColor: Colors.white,
                textController: controller,
                type: VirtualKeyboardType.Alphanumeric,
                defaultLayouts: const [VirtualKeyboardDefaultLayouts.Arabic],
              ),
            )
            // ,
          // )
        : const SizedBox();
  }
}
