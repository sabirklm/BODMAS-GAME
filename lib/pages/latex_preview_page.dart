import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class LatexPreviewPage extends StatefulWidget {
  const LatexPreviewPage({
    Key? key,
  }) : super(key: key);

  @override
  _LatexPreviewPageState createState() => _LatexPreviewPageState();
}

class _LatexPreviewPageState extends State<LatexPreviewPage> {
  final _latexController = TextEditingController();
  String latex = "";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
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
                TextField(
                  label: 'Enter latex',
                  controller: _latexController,
                  onChanged: (enteringValue) {
                    setState(
                      () {},
                    );
                  },
                ),
                LateX(
                  latex: _latexController.text,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LateX extends StatelessWidget {
  final String latex;
  const LateX({
    Key? key,
    required this.latex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * 0.3,
      child: TeXView(
        child: TeXViewColumn(
          children: [
            TeXViewDocument(
              latex,
              style: TeXViewStyle(
                padding: TeXViewPadding.all((width * 0.001).toInt()),
                width: width.toInt(),
                textAlign: TeXViewTextAlign.Center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const TextField({
    Key? key,
    required this.label,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
          ),
          TextFormField(
            controller: controller,
            onChanged: onChanged,
            maxLines: 2,
            decoration: const InputDecoration(),
          ),
        ],
      ),
    );
  }
}
