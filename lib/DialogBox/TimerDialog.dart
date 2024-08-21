import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_app/Constent/Colors.dart';

class TimerDialog extends StatefulWidget {
  final List options;
  final String selectedOption;
  final void Function(Duration) onOptionSelected;

  TimerDialog({
    required this.options,
    required this.selectedOption,
    required this.onOptionSelected,
  });

  @override
  _TimerDialogState createState() => _TimerDialogState();
}

class _TimerDialogState extends State<TimerDialog> {
  var _selectedOption;
  var _selectedOptionString;

  @override
  void initState() {
    _selectedOption = widget.selectedOption;
    _selectedOptionString = widget.selectedOption;
    if (_selectedOptionString == 'Off') {
      setState(() {
        _selectedOption = const Duration(hours: 99999);
        _selectedOptionString = 'Off';
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      backgroundColor: black.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
      ),
      children: [
        ClipRRect(
          borderRadius:
              BorderRadius.circular(20), // Adjust the radius as needed
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
            child: Container(
              height: 445,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: white.withOpacity(0.3)),
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: List<Widget>.generate(
                            widget.options.length,
                            (int index) {
                              return Padding(
                                padding: EdgeInsets.zero,
                                child: RadioListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  title: Text(
                                    widget.options[index].toString(),
                                    style: TextStyle(color: white),
                                  ),
                                  activeColor: white,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  visualDensity: VisualDensity.compact,
                                  value: widget.options[index].toString(),
                                  groupValue: _selectedOptionString,
                                  onChanged: (value) {
                                    setState(() {
                                      if (value == 'Off') {
                                        _selectedOption =
                                            const Duration(hours: 99999);
                                      } else if (value == '5 minutes') {
                                        _selectedOption =
                                            const Duration(minutes: 1);
                                      } else if (value == '10 minutes') {
                                        _selectedOption =
                                            const Duration(minutes: 5);
                                      } else if (value == '15 minutes') {
                                        _selectedOption =
                                            const Duration(minutes: 15);
                                      } else if (value == '30 minutes') {
                                        _selectedOption =
                                            const Duration(minutes: 30);
                                      } else if (value == '1 hours') {
                                        _selectedOption =
                                            const Duration(hours: 1);
                                      } else if (value == '2 hours') {
                                        _selectedOption =
                                            const Duration(hours: 2);
                                      } else if (value == '3 hours') {
                                        _selectedOption =
                                            const Duration(hours: 3);
                                      }
                                      _selectedOptionString = value;

                                      print(
                                          '------selectTime-----> $_selectedOption');
                                    }); // Close the dialog
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              widget.onOptionSelected(Duration.zero);
                              storage.write('time', '');
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              height: 55,
                              color: black.withOpacity(0.3),
                              child: Center(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: white, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.onOptionSelected(_selectedOption);
                                storage.write(
                                    'time', _selectedOptionString.toString());
                                Navigator.of(context).pop();
                              });
                            },
                            child: Container(
                              height: 55,
                              color: black.withOpacity(0.3),
                              child: Center(
                                child: Text(
                                  'Save',
                                  style: TextStyle(color: white, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
