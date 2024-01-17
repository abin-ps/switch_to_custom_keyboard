import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:switch_to_custom_keyboard/app_style.dart';
import 'package:switch_to_custom_keyboard/widgets/custom_keyboard.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showCustomKeyboard = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController arabicNameController = TextEditingController();

  late FocusNode arabicFocusNode;

  @override
  void initState() {
    super.initState();
    arabicFocusNode = FocusNode();

    arabicFocusNode.addListener(() {
      if (arabicFocusNode.hasFocus == false && showCustomKeyboard == false) {
        setState(() {
          showCustomKeyboard = false;
        });
      }
    });
  }

  @override
  void dispose() {
    arabicFocusNode.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const height20 = SizedBox(height: 20);
    return PopScope(
      onPopInvoked: (v) {
        setState(() {
          showCustomKeyboard = false;
        });
      },
      child: SafeArea(
          child: GestureDetector(
        onTap: () {
          setState(() {
            showCustomKeyboard = false;
          });
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text('Keyboard Switcher'),
            centerTitle: true,
          ),
          bottomSheet: BottomSheet(
              onClosing: () {},
              builder: (context) {
                SystemChannels.textInput.invokeMethod('TextInput.hide');
                return  CustomKeyboard(showKeyboard: showCustomKeyboard, controller: arabicNameController);
              }),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //name textfield
                      TextField(
                        keyboardType: TextInputType.none,
                          onTap: () {
                            setState(() {
                              showCustomKeyboard = false;
                            });
                          },
                          controller: nameController,
                          decoration: AppStyle().inputDecoration.copyWith(hintText: 'Name')),
                      height20,
                      //name arabic text field
                      TextField(
                          onTap: () {
                            print('taped');
                            FocusManager.instance.primaryFocus?.unfocus();
                            setState(() {
                              showCustomKeyboard = true;
                            });
                          },
                          controller: arabicNameController,
                          focusNode: arabicFocusNode,
                          decoration: AppStyle().inputDecoration.copyWith(hintText: 'Name Arabic')),
                      height20,
                    ],
                  ),
                ),
              ),
              //show custom keyboard
              // Align(alignment: Alignment.bottomCenter, child: CustomKeyboard(showKeyboard: showCustomKeyboard, controller: arabicNameController))
            ],
          ),
        ),
      )),
    );
  }
}
