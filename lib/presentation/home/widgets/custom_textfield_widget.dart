import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appnation_sc/presentation/home/bloc/home_bloc.dart';
import 'package:appnation_sc/presentation/home/bloc/home_event.dart';
import 'package:appnation_sc/presentation/home/bloc/home_state.dart';
import 'package:appnation_sc/core/constants/app_color.dart';
import 'package:appnation_sc/core/constants/app_strings.dart';
import 'package:appnation_sc/core/constants/app_text_style.dart';
import 'package:appnation_sc/core/extensions/context/context_extension.dart';
import 'package:appnation_sc/core/extensions/widget/widget_extension.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget({super.key});

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      context.read<HomeBloc>().add(UpdateTextFieldStatusEvent(status: 1));
    } else {
      context.read<HomeBloc>().add(UpdateTextFieldStatusEvent(status: 0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.textFieldStatus) {
          case 0:
            state.textFieldHeight = 60.0;
            break;
          case 1:
            state.textFieldHeight = 120.0;
            state.textFieldWidth = context.width;
            break;
          case 2:
            state.textFieldHeight = context.height;
            state.textFieldWidth = context.width;

            break;
        }
        return SizedBox(
          width: context.width * 0.935,
          child: GestureDetector(
            onTap: () {
              _focusNode.requestFocus();
            },
            onVerticalDragUpdate: (details) {
              if (details.delta.dy < 0 && state.textFieldStatus != 2) {
                context.read<HomeBloc>().add(UpdateTextFieldStatusEvent(status: 2));
              } else if (details.delta.dy > 0 && state.textFieldStatus == 2) {
                context.read<HomeBloc>().add(UpdateTextFieldStatusEvent(status: 1));
              }
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  color: AppColor.white,
                  height: state.textFieldHeight,
                  width: state.textFieldWidth,
                  child: TextField(
                    focusNode: _focusNode,
                    onChanged: (query) {
                      context.read<HomeBloc>().add(FilterBreedsEvent(query: query));
                    },
                    maxLines: 200,
                    style: AppTextStyle.blackMedium16,
                    decoration: InputDecoration(
                      hintText: AppString.search,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColor.greyLight),
                        borderRadius: context.border8Radius,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ).pOnly(top: 15),
        );
      },
    );
  }
}
