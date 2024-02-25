import 'package:appnation_sc/core/constants/app_color.dart';
import 'package:appnation_sc/core/constants/app_strings.dart';
import 'package:appnation_sc/core/constants/app_text_style.dart';
import 'package:appnation_sc/core/extensions/context/context_extension.dart';
import 'package:appnation_sc/core/extensions/string/string_extension.dart';
import 'package:appnation_sc/core/extensions/widget/widget_extension.dart';
import 'package:appnation_sc/data/models/dog_breed_model.dart';
import 'package:appnation_sc/presentation/home/bloc/home_bloc.dart';
import 'package:appnation_sc/presentation/home/bloc/home_event.dart';
import 'package:appnation_sc/presentation/home/bloc/home_state.dart';
import 'package:appnation_sc/presentation/home/widgets/divider_widget.dart';
import 'package:appnation_sc/presentation/home/widgets/random_image_dailog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> customShowDialog(BuildContext context, DogBreedModel dog) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: AppColor.white,
          surfaceTintColor: AppColor.white,
          shape: RoundedRectangleBorder(borderRadius: context.border12Radius),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            height: context.height * 0.8,
            width: context.width,
            child: Column(
              children: [
                Container(
                  width: context.width,
                  height: context.height * 0.4,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: FileImage(dog.image!), fit: BoxFit.cover),
                    borderRadius: context.borderVerticalTop12Radius,
                    color: AppColor.white,
                  ),
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    maxRadius: 20,
                    backgroundColor: AppColor.white,
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ),
                ).pOnly(bottom: 10),
                Text(AppString.breed, style: AppTextStyle.blueDarkSemiBold20),
                const CustomDividerWidget(),
                Text(dog.name!.capitalizeEachWord(), style: AppTextStyle.blackMedium16)
                    .pOnly(bottom: 20),
                Text(AppString.subBreed, style: AppTextStyle.blueDarkSemiBold20),
                const CustomDividerWidget(),
                dog.subBreeds!.isEmpty
                    ? Text(AppString.noSubBreed, style: AppTextStyle.blackMedium16)
                    : SizedBox(
                        height: context.height * 0.15,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: dog.subBreeds!.length,
                          itemBuilder: (context, index) => Center(
                            child: Text(dog.subBreeds![index].capitalizeEachWord(),
                                style: AppTextStyle.blackMedium16),
                          ),
                        ),
                      ),
                const Spacer(),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColor.blueLight,
                    borderRadius: context.border8Radius,
                  ),
                  child: Center(
                    child: Text(
                      AppString.generate,
                      style: AppTextStyle.whiteMedium20,
                    ),
                  ),
                ).gestureDetector(
                  onTap: () {
                    context.read<HomeBloc>().add(SelectBreedEvent(breed: dog.name!));
                    context.read<HomeBloc>().add(FetchRandomBreedImageEvent(breed: dog.name!));
                    showRandomImageDialog(context);
                  },
                ).pOnly(bottom: 16),
              ],
            ),
          ),
        );
      },
    ),
  );
}
