import 'package:flutter/material.dart';
import 'package:formation_flutter_posts_app/genderize/data/model/gender_model.dart';
import 'package:formation_flutter_posts_app/genderize/logic/gender_provider.dart';
import 'package:formation_flutter_posts_app/shared/service_locator.dart';
import 'package:provider/provider.dart';

class GenderPage extends StatefulWidget {
  GenderPage({Key? key}) : super(key: key);

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  late TextEditingController _nameController;

  @override
  void initState() {
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Form(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        focusNode: FocusNode(),
                        controller: _nameController,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        minLines: 1,
                        maxLines: 1,
                        decoration: InputDecoration(
                          filled: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          hintText: 'Enter your name Ex: Vigny',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.purple,
                          ),
                          fillColor: const Color.fromRGBO(249, 249, 249, 0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.purple),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFDDDDDD)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFDDDDDD)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (_nameController.text.isNotEmpty) {
                          getIt<GenderProvider>()
                              .findGender(_nameController.text);
                        }
                      },
                      icon: const Icon(Icons.search),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Consumer<GenderProvider>(
                builder: (context, genderProvider, child) {
                  GenderModel? gender = genderProvider.gender;

                  if (genderProvider.isLoading == true) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (gender == null) {
                    return const Center(
                      child: Text("Enter your name "),
                    );
                  } else {
                    return Column(
                      children: [
                        Card(
                          child: ListTile(
                            title: const Text("Name"),
                            subtitle: Text(
                              gender.name,
                            ),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: const Text("gender"),
                            subtitle: Text(
                              gender.gender,
                            ),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: const Text("Probability"),
                            subtitle: Text(
                              "${(gender.probability * 100)}%",
                            ),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: const Text("Count"),
                            subtitle: Text(
                              gender.count.toString(),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
