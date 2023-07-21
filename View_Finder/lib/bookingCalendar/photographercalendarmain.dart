// ignore_for_file: prefer_final_fields, prefer_const_constructors, use_build_context_synchronously, avoid_print, use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Table Calendar'),
        ),
        body: MyTableCalendar(),
      ),
    );
  }
}

class MyTableCalendar extends StatefulWidget {
  @override
  _MyTableCalendarState createState() => _MyTableCalendarState();
}

class _MyTableCalendarState extends State<MyTableCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  Map<DateTime, String> _bookedDates = {};
  String _bookNote = '';

  Future<void> _bookDate(DateTime date, String note) async {
    print(note);
    final url = Uri.parse('http://192.168.142.206:3000/api/users/event');

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    // Define the request body as a JSON-encoded string
    final body = {
      'date': date.toString(),
      'notice': note,
    };
    final jsonBody = json.encode(body);

    // Send the POST request to the API endpoint
    final response = await http.post(url, headers: headers, body: jsonBody);
    if (response.statusCode == 200) {
      print('event added successfully');
      setState(() {
        _bookedDates[date] = note;
      });
    } else {
      throw Exception('Failed to book date.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TableCalendar(
        firstDay: DateTime(1999),
        lastDay: DateTime(2050),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) => _bookedDates.containsKey(day),

        onDaySelected: (selectedDay, focusedDay) {
          if (!_bookedDates.containsKey(selectedDay)) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Book this date?'),
                content: TextField(
                  decoration: InputDecoration(hintText: 'Add a note'),
                  onChanged: (value) {
                    setState(() {
                      _bookNote = value;
                    });
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      await _bookDate(selectedDay, _bookNote);
                      Navigator.pop(context);
                    },
                    child: Text('Book'),
                  ),
                ],
              ),
            );
          }
          if (_bookedDates.containsKey(selectedDay)) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Day Already Booked'),
                content: Text("heeeeeeeeee"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
        ///////////////////////////////////////////////

        // add other properties as needed
      ),
    );
  }
}
