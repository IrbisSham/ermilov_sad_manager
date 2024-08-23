import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/authentication/authentication_bloc_public.dart';
import 'bloc/bloc_controller.dart';
import 'config/color_constants.dart';
import 'config/image_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthenticationBloc authenticationBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.secondaryAppColor,
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          bloc: authenticationBloc,
          listener: (BuildContext context, AuthenticationState state) {
            if (state is AppAutheticated) {
              Navigator.pushNamed(context, '/home');
            }
            if (state is AuthenticationStart) {
              Navigator.pushNamed(context, '/auth');
            }
            if (state is UserLogoutState) {
              Navigator.pushNamed(context, '/auth');
            }
          },
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              bloc: authenticationBloc,
              builder: (BuildContext context, AuthenticationState state) {
                return Center(child: Image.asset(AllImages().logo));
              }),
        ));
  }

  @override
  void initState() {
    authenticationBloc = AuthenticationBlocController().authenticationBloc;
    authenticationBloc.add(AppLoadedup());
    super.initState();
  }
}
