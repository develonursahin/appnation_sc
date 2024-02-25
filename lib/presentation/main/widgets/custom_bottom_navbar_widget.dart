import 'package:appnation_sc/core/assets/assets.dart';
import 'package:appnation_sc/core/constants/app_color.dart';
import 'package:appnation_sc/core/constants/app_strings.dart';
import 'package:appnation_sc/core/constants/app_text_style.dart';
import 'package:appnation_sc/core/extensions/string/string_extension.dart';
import 'package:appnation_sc/presentation/main/bloc/main_bloc.dart';
import 'package:appnation_sc/presentation/main/bloc/main_event.dart';
import 'package:appnation_sc/presentation/main/bloc/main_state.dart';
import 'package:appnation_sc/presentation/main/widgets/custom_paint_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavBarWidget extends StatelessWidget {
  const CustomBottomNavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      return SizedBox(
        height: 100,
        child: CustomPaint(
          painter: TrapezoidPainter(),
          child: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Assets.instance.icon.home.toColorSvg(
                        color: state.selectedIndex == 0 ? AppColor.blueDark : AppColor.black,
                      ),
                      onPressed: () {
                        context.read<MainBloc>().add(MainChangePageEvent(0));
                      },
                    ),
                    Expanded(
                        child: Text(AppString.home,
                            style: state.selectedIndex == 0
                                ? AppTextStyle.blueDarkMedium16
                                : AppTextStyle.blackMedium16))
                  ],
                ),
                const VerticalDivider(width: 1),
                Column(
                  children: [
                    IconButton(
                      icon: Assets.instance.icon.settings.toColorSvg(
                        color: state.selectedIndex == 1 ? AppColor.blueDark : AppColor.black,
                      ),
                      onPressed: () {
                        context.read<MainBloc>().add(MainChangePageEvent(1));
                      },
                    ),
                    Expanded(
                        child: Text(AppString.settings,
                            style: state.selectedIndex == 1
                                ? AppTextStyle.blueDarkMedium16
                                : AppTextStyle.blackMedium16))
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
