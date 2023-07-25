// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login/login_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Data {
  final int userId;
  final String date;
  final String notice;

  Data({required this.userId, required this.date, required this.notice});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userId: json['user_id'],
      date: json['date'],
      notice: json['notice'],
    );
  }
}

class Calendar extends StatelessWidget {
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

  Future<List<Data>> _fetchEvents() async {
    final url = Uri.parse('http://192.168.124.206:3000/api/users/events');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    final body = {
      'user_id': 25,
    };
    final jsonBody = json.encode(body);
    final response = await http.post(url, headers: headers, body: jsonBody);
    if (response.statusCode == 200) {
      //final responseData = json.decode(response.body);
      List<dynamic> data = jsonDecode(response.body)['data'];
      List<Data> dataList = [];
      for (var item in data) {
        dataList.add(Data.fromJson(item));
      }
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> _bookDate(DateTime date, String note) async {
    final url = Uri.parse('http://192.168.124.206:3000/api/users/event');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    final body = {
      'user_id': userId,
      'date': date.toString(),
      'notice': note,
    };
    final jsonBody = json.encode(body);
    final response = await http.post(url, headers: headers, body: jsonBody);
    if (response.statusCode == 200) {
      print('event added successfully');
      setState(() {
        _bookedDates[date] = note;
        print(_bookedDates);
      });
    } else {
      throw Exception('Failed to book date.');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchEvents().then((data) {
      setState(() {
        dataList = data;
        print('datalist');
        print(dataList);
      });
    });
  }

  List<Data> dataList = [];
  List<String> noticeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Table Calendar'),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 19, 19, 19),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Expanded(
              child: Container(
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     // opacity: 0.5,
                //     image: AssetImage(
                //       'images/.jpg',
                //     ),
                //     fit: BoxFit.cover,
                //   ),
                // ),
                color: Color.fromARGB(255, 255, 255, 255),
                // decoration: BoxDecoration(
                //   border: Border.all(
                //       color: Color.fromARGB(255, 255, 255, 255), width: 4.0),
                //   // borderRadius: BorderRadius.circular(12.0),
                // ),
                // margin: EdgeInsets.all(5.0),

                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 35.0),
                      child: TableCalendar(
                        firstDay: DateTime(1999),
                        lastDay: DateTime(2050),
                        focusedDay: _focusedDay,
                        calendarFormat: _calendarFormat,

                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextStyle: TextStyle(
                            color: Color.fromARGB(255, 4, 4, 4),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          leftChevronIcon: Icon(
                            Icons.arrow_back,
                            color: Color.fromARGB(255, 211, 211, 211),
                          ),
                          rightChevronIcon: Icon(
                            Icons.arrow_forward,
                            color: Color.fromARGB(255, 79, 78, 78),
                          ),
                        ),

                        daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                            color: Color.fromARGB(255, 39, 39, 39),
                            fontWeight: FontWeight.bold,
                          ),
                          weekendStyle: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        selectedDayPredicate: (day) =>
                            dataList.any((data) => data.date == day.toString()),
                        calendarStyle: CalendarStyle(
                          weekendTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 93, 94, 94),
                          ),
                          holidayTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 222, 28, 28),
                          ),
                          selectedTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                          todayDecoration: BoxDecoration(
                            color: Color.fromARGB(255, 37, 37, 37),
                            shape: BoxShape.circle,
                          ),
                          markersMaxCount: 4,
                          selectedDecoration: BoxDecoration(
                            color: Color.fromARGB(
                                131, 22, 73, 202), // Color for the selected day
                            shape: BoxShape.circle,
                          ),
                        ),

                        onDaySelected: (selectedDay, focusedDay) {
                          if (!_bookedDates.containsKey(selectedDay)) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('ADD BOOKING'),
                                content: TextField(
                                  decoration:
                                      InputDecoration(hintText: 'Add a note'),
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.isEmpty) {
                                        SnackBar(content: Text('value emt'));
                                      } else {
                                        _bookNote = value;
                                      }
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
                                      // ignore: unnecessary_null_comparison
                                      if (_bookNote == null ||
                                          _bookNote.isEmpty) {
                                        SnackBar(
                                            content: Text("Note is empty"));
                                      } else {
                                        await _bookDate(selectedDay, _bookNote);
                                      }

                                      await _fetchEvents().then((data) {
                                        setState(() {
                                          dataList = data;
                                          print('datalist');
                                          print(dataList);
                                        });
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text('Book'),
                                  ),
                                ],
                              ),
                            );
                          }
                          bool isDatePresent = dataList.any(
                              (data) => data.date == selectedDay.toString());

                          if (isDatePresent) {
                            ////////////////////////////////////////////////////////////////////
                            List<String> noticeList = dataList
                                .where((data) =>
                                    data.date ==
                                    selectedDay
                                        .toString()) //find note for selected day if have
                                .map((data) => data.notice)
                                .toList();
                            print(selectedDay);
                            print(noticeList);

                            ///////////////////////////////////////////////////////////

                            final originaldate =
                                DateTime.parse(selectedDay.toString());
                            final newFormat = DateFormat("yyyy/MM/dd");
                            final formatteddate =
                                newFormat.format(originaldate);

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  title:
                                      Text('                 $formatteddate'),
                                  children: <Widget>[
                                    Container(
                                      height: 200,
                                      width: 800,
                                      child: ListView.builder(
                                        itemCount: noticeList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                            title: Text(noticeList[index]),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                            // Do something if the selected date is present in the dataList
                            print('Selected date is present in the dataList');
                          } else {
                            // Do something if the selected date is not present in the dataList
                            print(
                                'Selected date is not present in the dataList');
                          }

                          // if (_bookedDates.containsKey(selectedDay)) {
                          //   final note = _bookedDates[selectedDay];
                          //   showDialog(
                          //     context: context,
                          //     builder: (context) => AlertDialog(
                          //       title: Text('Date already booked'),
                          //       content: Text(note!),
                          //       actions: [
                          //         TextButton(
                          //           onPressed: () async {
                          //             Navigator.pop(context);
                          //           },
                          //           child: Text('OK'),
                          //         ),
                          //       ],
                          //     ),
                          //   );
                          // }
                        },
                        eventLoader: (day) {
                          final events = dataList
                              .where((data) => data.date == day.toString())
                              .toList();
                          return events.map((data) => data.notice).toList();
                        },
                        // eventLoader: (day) {
                        //   final events = _bookedDates.entries
                        //       .where((entry) => entry.key.isAtSameMomentAs(day))
                        //       .toList();
                        //   return events.map((entry) => entry.value).toList();
                        // },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            width: 800,
            color: Color.fromARGB(255, 83, 82, 82),
            child: Center(
              child: Text(
                'Your Bookings',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final date = dataList[index].date;
                final note = dataList[index].notice;

                final originalDate = DateTime.parse(date);
                final newFormat = DateFormat("yyyy/MM/dd");
                final formattedDate = newFormat.format(originalDate);

                return Container(
                  child: ListTileTheme(
                    tileColor: Color.fromARGB(255, 0, 0, 0),
                    selectedColor: Color.fromARGB(255, 146, 44, 44),
                    child: ListTile(
                      isThreeLine: true,
                      trailing: Icon(Icons.arrow_forward,
                          color: Color.fromARGB(255, 3, 3, 3)),
                      leading: Icon(Icons.star,
                          color: Color.fromARGB(255, 233, 226, 21)),
                      title: Text(formattedDate,
                          style: TextStyle(
                              color: Color.fromARGB(255, 165, 165, 165),
                              fontWeight: FontWeight.bold)),
                      dense: true,
                      subtitle: Text(note,
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
