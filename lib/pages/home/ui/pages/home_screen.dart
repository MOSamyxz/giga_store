import 'package:e_commerce/core/widgets/custom_search_field.dart';
import 'package:e_commerce/core/widgets/custom_text_icon_button.dart';
import 'package:e_commerce/pages/home/cubit/home_cubit.dart';
import 'package:e_commerce/services/auth/user_auth/user_signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getUserData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetCurrentUserDataLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetCurrentUserDataSuccessState) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Home'),
                  actions: [
                    IconButton(
                        onPressed: () {
                          UserSignIn().signOut();
                        },
                        icon: const Icon(Icons.exit_to_app_outlined))
                  ],
                ),
                body: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: const CustomSearchField(
                        hintText: 'Search Anything',
                        prefix: FontAwesomeIcons.magnifyingGlass,
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Categories'),
                              CustomTextIconButton(
                                  onTap: () {},
                                  buttonText: 'View All',
                                  icon: FontAwesomeIcons.arrowRight)
                            ],
                          ),
                        ),
                        ListView(
                          children: [],
                        )
                      ],
                    ),
                  ],
                ));
          } else {
            return const Center(child: Text('Please sign in'));
          }
        },
      ),
    );
  }
}
