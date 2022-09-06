import 'package:dio/dio.dart';
import 'package:formation_flutter_posts_app/genderize/data/model/gender_model.dart';

class GenderRepository {
  Dio dio = Dio();

  Future<GenderModel> getGenderByName({required String name}) async {
    print(name);
    Response response = await dio.get('https://api.genderize.io/?name=$name');
    print(response.data);
    return GenderModel.fromMap(response.data);
  }
}


// https://api.genderize.io/?name=espoir