import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:proyecto_final_pm/ui/general/colors.dart';

Widget divider3 = const SizedBox(height: 3);
Widget divider6 = const SizedBox(height: 6);
Widget divider10 = const SizedBox(height: 10);
Widget divider20 = const SizedBox(height: 20);
Widget divider30 = const SizedBox(height: 30);
Widget divider40 = const SizedBox(height: 40);

Widget divider3With = const SizedBox(width: 3);
Widget divider6With = const SizedBox(width: 6);
Widget divider10With = const SizedBox(width: 10);
Widget divider20With = const SizedBox(width: 20);

Widget loadingWidget() => Center(
      child: SizedBox(
        height: 20.0,
        width: 20.0,
        child: CircularProgressIndicator(
          color: kBrandPrimaryColor,
          strokeWidth: 2.2,
        ),
      ),
    );
