import 'package:appnation_sc/core/constants/app_color.dart';
import 'package:appnation_sc/core/extensions/context/context_extension.dart';
import 'package:appnation_sc/core/extensions/widget/widget_extension.dart';
import 'package:appnation_sc/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showRandomImageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      final imageUrl = context.read<HomeBloc>().state.randomBreedImageUrl;
      return imageUrl != null
          ? SizedBox(
              width: context.width * 0.8,
              height: context.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: context.width * 0.7,
                    height: context.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: context.border12Radius,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrl),
                      ),
                    ),
                  ).pOnly(bottom: 16),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(
                      child: IconButton(
                          iconSize: 18,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close)),
                    ),
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator());
    },
  );
}
