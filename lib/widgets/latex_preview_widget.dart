import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class LateXPreviewWidget extends StatelessWidget {
  final String latex;
  const LateXPreviewWidget({
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
