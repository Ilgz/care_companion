import 'package:cash_manager/application/intro/intro_cubit.dart';
import 'package:cash_manager/presentation/core/router.dart';
import 'package:cash_manager/presentation/intro/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<IntroCubit, IntroState>(
      listener: (context, state) {
        if(state.isFirstTime){
          goToIntroPage(context);
        }else{
          goToArticleOverviewPage(context);
        }
      },
      child: const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
