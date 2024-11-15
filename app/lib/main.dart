import 'package:app/cubit/app_states.dart';
import 'package:app/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'network/Remote/dio_helper.dart';
import 'module/receipt_page.dart';

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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'POS',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ReceiptPage(),
      ),
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
