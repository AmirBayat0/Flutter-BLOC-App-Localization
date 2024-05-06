import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_localization/src/routes/routes_name.dart';
import 'package:flutter_bloc_localization/src/utils/change_language_bottom_sheet.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';
import '../../l10n/l10n.dart';
import '../components/button.dart';
import '../theme/app_theme.dart';
import '../bloc/localization_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.animateTop}) : super(key: key);

  final bool animateTop;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// FadeInUp and Down Animation applier function for applying on widgets
  Widget animateChanger(
      {required bool animateTop, required Widget child, required int delay}) {
    if (animateTop) {
      return FadeInUp(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    } else {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,

      /// AppBar
      appBar: _buildAppBar(context),

      /// Body
      body: _buildBody(l10n, context),
    );
  }

  /// Body
  Widget _buildBody(AppLocalizations l10n, BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: animateChanger(
              delay: 300,
              child: Assets.intro.image(),
              animateTop: widget.animateTop,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                animateChanger(
                  delay: 400,
                  animateTop: widget.animateTop,
                  child: Text(
                    l10n.onboardingTitle,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                animateChanger(
                  delay: 500,
                  animateTop: widget.animateTop,
                  child: Text(
                    l10n.onboardingSubTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 12.0),
                animateChanger(
                  delay: 600,
                  animateTop: widget.animateTop,
                  child: AppCustomButton.filled(
                    onPressed: () {
                      context.pushReplacement(
                        Routes.onboardingPath,
                        extra: true,
                      );
                    },
                    label: l10n.getStarted,
                  ),
                ),
                const SizedBox(height: 8.0),
                animateChanger(
                  delay: 700,
                  animateTop: widget.animateTop,
                  child: AppCustomButton.outlined(
                    onPressed: () {
                      context.pushReplacement(
                        Routes.onboardingPath,
                        extra: false,
                      );
                    },
                    label: l10n.haveAccount,
                  ),
                ),
              ],
            ),
          ),
          animateChanger(
            delay: 800,
            animateTop: widget.animateTop,
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    l10n.changeLanguage,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 100,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: OutlinedButton(
                        onPressed: () =>
                            AppUtils.showLanguageBottomSheet(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(8.0),
                          foregroundColor: AppColors.lightGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Row(
                          children: [
                            ClipOval(
                              child: BlocBuilder<LocalizationBloc,
                                  AppLocalizationState>(
                                builder: (context, state) {
                                  return state.selectedLanguage.image.image();
                                },
                              ),
                            ),
                            Expanded(
                              child: Icon(
                                Icons.arrow_drop_down_rounded,
                                color: AppColors.darkPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  /// AppBar
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: animateChanger(
        delay: 300,
        child: const Text("FrMOON"),
        animateTop: !widget.animateTop,
      ),
    );
  }
}
