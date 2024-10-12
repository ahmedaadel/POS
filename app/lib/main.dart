import 'package:app/Cubit/AppStates.dart';
import 'package:app/Cubit/Cubit.dart';
import 'package:app/Modules/MenuItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Network/Remote/Dio_Helper.dart';

void main() {
  DioHelper.initDio();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(BlocProvider(
    create: (context)=> AppCubit(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ItemsScreen(),
    );
  }
}

class MyApiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cub = AppCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text('API Integration'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      cub.getAllDataFromAPI("sizes");
                    },
                    child: Text('Get Data from API'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Map<String, dynamic> data = {"name":"مقاولات"};
                      cub.sendDataToAPI("industry", data);
                    },
                    child: Text('Send Data to API'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
