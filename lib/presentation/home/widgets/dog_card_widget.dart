// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:appnation_sc/core/constants/app_color.dart';
import 'package:appnation_sc/core/extensions/context/context_extension.dart';
import 'package:appnation_sc/core/extensions/string/string_extension.dart';
import 'package:appnation_sc/core/extensions/widget/widget_extension.dart';
import 'package:appnation_sc/data/models/dog_breed_model.dart';
import 'package:appnation_sc/presentation/home/widgets/dog_alert_dialog_widget.dart';
import 'package:flutter/material.dart';

class DogCardWidget extends StatelessWidget {
  const DogCardWidget({
    super.key,
    required this.dog,
  });

  final DogBreedModel dog;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
          image: DecorationImage(image: FileImage(dog.image!), fit: BoxFit.cover),
          color: AppColor.white,
          borderRadius: context.border8Radius),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: IntrinsicWidth(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              height: context.height * 0.03,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.24),
                  borderRadius: context.borderBottomLeft8TopRight16Radius),
              child: Center(
                  child: Text(
                dog.name!.capitalizeEachWord(),
                style: const TextStyle(fontSize: 16, color: AppColor.white),
              )),
            ),
          ),
        ),
      ),
    ).gestureDetector(
      onTap: () async {
        FocusScope.of(context).unfocus();
        await Future.delayed(const Duration(milliseconds: 100));
        customShowDialog(context, dog);
      },
    );
  }
}
