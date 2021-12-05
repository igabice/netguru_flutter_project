import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/app/s.dart';
import 'package:flutter_app/feature/main/main_cubit.dart';
import 'package:flutter_app/injection/injection.dart';
import 'package:flutter_app/widget/custom_loading/custom_loading.dart';
import 'package:flutter_app/values/app_theme.dart';

class MainScreenRoute extends MaterialPageRoute<bool> {
  MainScreenRoute() : super(builder: (_) => MainScreen());
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainCubit? mainCubit;
  bool isLoading = false;
  bool toggle = false;

  @override
  void initState() {
    mainCubit = getIt.get<MainCubit>();
    mainCubit?.fetchListItems(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (context) => mainCubit!,
      child: BlocConsumer<MainCubit, MainState>(
        listener: (BuildContext context, state) {
          setState(() {
            isLoading = state is Loading;
          });
        },
        builder: (BuildContext context, state) => Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).appName, key: Key('appName'),),
            backgroundColor: context.primaryColor(),
          ),
          body: Center(
            child: Stack(
              children: [
                state is Loading ? CustomLoading() : SizedBox(),
                state is Error ? Text(state.error.toString()) : SizedBox(),
                if (state is Fetched)
                  ListView(
                      children: state.list.map(
                    (s) {
                      if (state.list.indexOf(s) % 2 == 0) {
                        s = 'I dont like even numbers';
                      }
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          color: Colors.green,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/splash_image.png',
                                    height: 50,
                                  ),
                                  Text(s),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList()),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              toggle = !toggle;
              mainCubit?.fetchListItems(toggle);
            },
            child: Icon(Icons.refresh),),
        ),
      ),
    );
  }
}
