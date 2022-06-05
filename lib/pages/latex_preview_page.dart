import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/widgets.dart';

class LatexPreviewPage extends StatelessWidget {
  const LatexPreviewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    var lpc = Get.put(LatexPreviewController());
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return ListView(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      'Welcome to Cryptic',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      'Preview Math equations',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            lpc._latexController.value = const TextEditingValue(
                              text: r"""\(x{\degree}\)""",
                            );
                            lpc.updateUI();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)],
                            ),
                            child: Text(
                              "x°",
                              style: theme.textTheme.headline5,
                            ),
                          ),
                        ),
                        //Angle
                        InkWell(
                          onTap: () {
                            lpc.updateUI();
                            lpc._latexController.value = const TextEditingValue(
                              text: r"""\(x^{2}\)""",
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)],
                            ),
                            child: Text(
                              "x²",
                              style: theme.textTheme.headline5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        EditTextField(
                          label: 'Enter latex',
                          controller: lpc._latexController,
                          onChanged: (enteringValue) {
                            lpc.updateUI();
                          },
                        ),
                        if (lpc.ui.value >= 1)
                          LateXPreviewWidget(
                            latex: lpc._latexController.text,
                          )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class LatexPreviewController extends GetxController {
  final _latexController = TextEditingController();
  var latex = "".obs;
  var ui = 1.obs;
  updateUI() {
    ui.value = Random().nextInt(100);
  }
}
