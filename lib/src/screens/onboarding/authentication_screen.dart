import 'package:ermilov_sad_manager/src/bloc/authentication/authentication_bloc_public.dart';
import 'package:ermilov_sad_manager/src/bloc/bloc_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login_screen.dart';
import 'signup_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool showLoginForm = false;
  // ignore: close_sinks
  late AuthenticationBloc authenticationBloc;
  @override
  Widget build(BuildContext context) {
    void showError(String error) async {
      await Fluttertoast.showToast(
          msg: error,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return Scaffold(
        body: WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        bloc: authenticationBloc,
        listener: (context, state) {
          if (state is AuthenticationFailure) {
            showError(state.message);
          }
        },
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            bloc: authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              return SafeArea(
                child: Stack(
                  children: [
                    Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Center(
                              child: Text(
                            showLoginForm ? 'LOGIN' : 'SIGN UP',
                            style: Theme.of(context).textTheme.displayMedium,
                          )),
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: showLoginForm
                                ? LoginForm(
                                    authenticationBloc: authenticationBloc,
                                    state: state,
                                  )
                                : SignUpForm(
                                    authenticationBloc: authenticationBloc,
                                    state: state,
                                  ),
                          ),
                          showLoginForm
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        height: 38,
                                      ),
                                      const Text('Already have an account?'),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      ElevatedButton(
                                          child: Text(
                                            'Login',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              showLoginForm = true;
                                            });
                                          })
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ),
                    !showLoginForm
                        ? const SizedBox()
                        : Positioned(
                            left: 6,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 32,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  showLoginForm = false;
                                });
                              },
                            ),
                          )
                  ],
                ),
              );
            }),
      ),
    ));
  }

  @override
  void initState() {
    authenticationBloc = AuthenticationBlocController().authenticationBloc;
    super.initState();
  }
}
