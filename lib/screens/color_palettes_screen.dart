import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widgets_sample/constants.dart';
import 'package:widgets_sample/widgets/color_palletes/color_scheme_widget.dart';

// If screen content width is greater or equal to this value, the light and dark
// color schemes will be displayed in a column. Otherwise, they will
// be displayed in a row.
const double narrowScreenWidthThreshold = 400;

class ColorPalettesScreen extends StatelessWidget {
  const ColorPalettesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color selectedColor = Theme.of(context).primaryColor;
    ThemeData lightTheme = ThemeData(
      colorSchemeSeed: selectedColor,
      brightness: Brightness.light,
    );
    ThemeData darkTheme = ThemeData(
      colorSchemeSeed: selectedColor,
      brightness: Brightness.dark,
    );

    Widget schemeLabel(String brightness) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            brightness,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );

    Widget schemeView(ThemeData theme) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ColorSchemeWidget(colorScheme: theme.colorScheme),
        );

    Widget dynamicColorNotice() => RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: Theme.of(context).textTheme.bodySmall,
            children: [
              const TextSpan(
                text: 'To create color schemes based on a '
                    'platform\'s implementation of dynamic color, '
                    'use the ',
              ),
              TextSpan(
                  text: 'dynamic color',
                  style: const TextStyle(decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      final url = Uri.parse('https://pub.dev/packages/dynamic_color');
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    }),
              const TextSpan(text: ' package.')
            ],
          ),
        );

    return Expanded(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < narrowScreenWidthThreshold) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  dynamicColorNotice(),
                  colDivider,
                  schemeLabel('Light ColorScheme'),
                  schemeView(lightTheme),
                  colDivider,
                  colDivider,
                  schemeLabel('Dark ColorScheme'),
                  schemeView(darkTheme),
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    dynamicColorNotice(),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              schemeLabel('Light ColorScheme'),
                              schemeView(lightTheme),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              schemeLabel('Dark ColorScheme'),
                              schemeView(darkTheme),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
