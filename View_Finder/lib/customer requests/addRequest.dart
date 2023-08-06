import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/login_page.dart';

class MyRequestForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyRequestForm> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _contact1Controller = TextEditingController();
  final TextEditingController _contact2Controller = TextEditingController();
  final TextEditingController _wantDateController = TextEditingController();

  Future<void> _submitData() async {
    final url = Uri.parse('http://192.168.184.206:3000/api/users/req');
    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          'user_id': userId,
          'title': _titleController.text,
          'category': _categoryController.text,
          'description': _descriptionController.text,
          'location': _locationController.text,
          'contact1': int.parse(_contact1Controller.text),
          'contact2': int.parse(_contact2Controller.text),
          'want_date': _wantDateController.text,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        print('Data sent successfully!');
        // Do something after successful data submission
      } else {
        print('Error sending data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error sending data: $error');
    }
  }

  @override
  void dispose() {
    _userIdController.dispose();
    _titleController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _contact1Controller.dispose();
    _contact2Controller.dispose();
    _wantDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Request is'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Choose Category'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    labelText: 'Describe What you want to Request'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Your Location'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _contact1Controller,
                decoration: InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _contact2Controller,
                decoration: InputDecoration(labelText: 'Whatsapp'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _wantDateController,
                decoration: InputDecoration(labelText: 'Want Date'),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(51, 50, 50,
                          1)), // Set the background color of the button
                ),
                onPressed: _submitData,
                child: Text('Add Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
