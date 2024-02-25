import 'package:appnation_sc/core/extensions/context/context_extension.dart';
import 'package:appnation_sc/core/extensions/widget/widget_extension.dart';
import 'package:appnation_sc/data/models/dog_breed_model.dart';
import 'package:appnation_sc/presentation/home/bloc/home_bloc.dart';
import 'package:appnation_sc/presentation/home/bloc/home_state.dart';
import 'package:appnation_sc/presentation/home/widgets/custom_textfield_widget.dart';
import 'package:appnation_sc/presentation/home/widgets/dog_card_widget.dart';
import 'package:appnation_sc/presentation/home/widgets/no_result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state.filteredDogs.isNotEmpty
                    ? Expanded(
                        child: GridView.builder(
                          itemCount: state.filteredDogs.length,
                          shrinkWrap: false,
                          padding: EdgeInsets.only(bottom: context.height * 0.1),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (context, index) {
                            DogBreedModel dog = state.filteredDogs[index];
                            return DogCardWidget(dog: dog);
                          },
                        ).pOnly(left: 16, right: 16),
                      )
                    : const NoResultFoundWidget()
              ],
            ),
            floatingActionButton: const CustomTextFieldWidget());
      },
    );
  }
}
