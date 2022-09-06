import 'package:flutter/cupertino.dart';
import 'package:formation_flutter_posts_app/genderize/data/model/gender_model.dart';
import 'package:formation_flutter_posts_app/genderize/data/repositories/gender_repository.dart';

class GenderProvider extends ChangeNotifier {
  GenderModel? _gende;
  bool isLoading = false;
  GenderModel? get gender => _gende;

  GenderRepository _genderRepository = GenderRepository();

  findGender(String name) async {
    isLoading = true;
    notifyListeners();
    _gende = await _genderRepository.getGenderByName(name: name);
    isLoading = false;
    notifyListeners();
  }
}
