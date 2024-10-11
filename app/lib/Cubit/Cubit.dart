import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Network/Remote/Dio_Helper.dart';
import 'AppStates.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(InitialState());
  static AppCubit get(context) =>BlocProvider.of(context);

  Future<void> getAllDataFromAPI(String url ) async {
    try {
      Response response = await DioHelper.getApiData(
        url: url
      );
      print(response.data);  // Use the data as required
    } catch (error) {
      print(error.toString());
    }
  }
  Future<void> getSingleDataFromAPI(String url  , Map<String,dynamic> queryParameter) async {
    try {
      Response response = await DioHelper.getApiData(
          url: url,
          query: queryParameter
      );
      print(response.data);  // Use the data as required
    } catch (error) {
      print(error.toString());
    }
  }
  Future<void> sendDataToAPI(String url,Map<String, dynamic> data) async {
    try {
      Response response = await DioHelper.postData(
        url: url,
        data: data,
      );
      print(response.data);  // Process the response
    } catch (error) {
      print(error.toString());
    }
  }
  Future<void> deleteDataFromAPI(String url,Map<String, dynamic> data) async {
    try {
      Response response = await DioHelper.postData(
        url: url,
        data: data,
      );
      print(response.data);  // Process the response
    } catch (error) {
      print(error.toString());
    }
  }
}
