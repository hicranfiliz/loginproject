import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loginproject/service/post_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final Dio _dio;
  //final _baseUrl = 'https://authv2.beta.name.tr/swagger/index.html';
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  Future<void> _addUserToService(PostModel postModel) async {
    try {
      final response = await _dio.post('posts', data: postModel.toJson());
      if (response.statusCode == HttpStatus.created) {
        print('Kullanici kaydedildi');
      } else {
        print('Kaydedilemedi.');
      }
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register Page'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'First Name'),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: _surnameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: _usernameController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Username'),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Age'),
            ),
            TextButton(
                onPressed: () {
                  if (_nameController.text.isNotEmpty &&
                      _surnameController.text.isNotEmpty &&
                      _usernameController.text.isNotEmpty &&
                      _ageController.text.isNotEmpty) {
                    final model = PostModel(
                        firstName: _nameController.text,
                        lastName: _surnameController.text,
                        userName: _usernameController.text,
                        age: _ageController.text);
                    _addUserToService(model);
                  }
                },
                child: const Text('Register'))
          ],
        ));
  }
}
