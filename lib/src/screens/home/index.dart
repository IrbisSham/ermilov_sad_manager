// home screen contents
import 'package:ermilov_sad_manager/src/bloc/authentication/authentication_bloc_public.dart';
import 'package:ermilov_sad_manager/src/bloc/bloc_controller.dart';
import 'package:ermilov_sad_manager/src/config/image_constants.dart';
import 'package:ermilov_sad_manager/src/config/string_constants.dart';
import 'package:ermilov_sad_manager/src/utils/app_state_notifier.dart';
import 'package:ermilov_sad_manager/src/widgets/cache_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  // ignore: close_sinks
  final AuthenticationBloc authenticationBloc =
      AuthenticationBlocController().authenticationBloc;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    authenticationBloc.add(GetUserData());
    return PopScope(
        onPopInvoked: (bool isInvoked) => false,
        child: BlocBuilder<StateStreamable<AuthenticationState>, AuthenticationState>(
            bloc: authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              if (state is SetUserData) {
                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text(
                      APP_BAR_TITLE,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    actions: [
                      IconButton(
                          icon: const Icon(Icons.logout),
                          onPressed: () {
                            authenticationBloc.add(UserLogOut());
                          }),
                    ],
                  ),
                  body: const Center(
                    child: Text('/home'),
                  ),
                  drawer: Drawer(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        DrawerHeader(
                          decoration: BoxDecoration(
                            color: Theme.of(context).dividerColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white),
                                    child: CachedImage(
                                      imageUrl:
                                          state.currentUserData.data.avatar,
                                      fit: BoxFit.fitWidth,
                                      errorWidget: Image.network(
                                        AllImages().kDefaultImage,
                                      ),
                                      width: 80,
                                      height: 80,
                                      placeholder: const CircularProgressIndicator(), key: super.key,
                                    ),
                                  ),
                                  Switch(
                                    value:
                                        Provider.of<AppStateNotifier>(context)
                                            .isDarkMode,
                                    onChanged: (value) {
                                      Provider.of<AppStateNotifier>(context,
                                              listen: false)
                                          .updateTheme(value);
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          title: Text(
                              '${state.currentUserData.data.firstName} ${state.currentUserData.data.lastName}',
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                        ListTile(
                          title: Text(state.currentUserData.data.email,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                        ListTile(
                          title: Text(state.currentUserData.ad.company,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }));
  }
}
