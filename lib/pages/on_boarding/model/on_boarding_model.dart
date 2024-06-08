import 'package:e_commerce/core/constants/assets.dart';
import 'package:e_commerce/core/constants/strings.dart';

class OnBoardingModel {
  final String title;
  final String description;
  final String imagePath;

  OnBoardingModel(
      {required this.title,
      required this.description,
      required this.imagePath});
}

List<OnBoardingModel> onBoarding = [
  OnBoardingModel(
      title: AppStrings.onBoardingOneTitle,
      description: AppStrings.onBoardingOneDescreption,
      imagePath: AppAssets.onBoardingOne),
  OnBoardingModel(
      title: AppStrings.onBoardingTwoTitle,
      description: AppStrings.onBoardingTwoDescreption,
      imagePath: AppAssets.onBoardingTwo),
  OnBoardingModel(
      title: AppStrings.onBoardingThreeTitle,
      description: AppStrings.onBoardingThreeDescreption,
      imagePath: AppAssets.onBoardingThree),
];
