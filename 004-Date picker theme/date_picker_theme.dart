import 'package:flutter/material.dart';

class DatePickersPage extends StatefulWidget {
  const DatePickersPage({super.key});

  @override
  DatePickersPageState createState() => DatePickersPageState();
}

class DatePickersPageState extends State<DatePickersPage> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      cancelText: 'Cancel', // !Cancel button text
      confirmText: 'Confirm Booking', // !Confirm button text
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      selectableDayPredicate: (DateTime date) {
        return date.weekday != 1 && date.weekday != 6;
      },
      builder: (BuildContext context, Widget? child) {
        //* Customize the date picker theme
        return Theme(
          data: ThemeData.light().copyWith(
            datePickerTheme: DatePickerThemeData(
              backgroundColor: Colors.white, // Dialog background color
              headerBackgroundColor: Colors.deepPurple, // Header background color
              headerForegroundColor: Colors.white, // Header text color
              dayBackgroundColor: WidgetStateProperty.resolveWith(
                (states) {
                  if (states.contains(WidgetState.selected)) {
                    return Colors.deepPurple.shade400; // Selected day background color
                  }
                  return Colors.deepPurple.withOpacity(0.01); // Days background color
                },
              ), // Days background color
              dayForegroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.white; // Selected day text color
                } else if (states.contains(WidgetState.disabled)) {
                  return Colors.grey; // Disabled day text color
                }
                return Colors.deepPurple; // Default days text color
              }),
              dayShape: WidgetStateProperty.resolveWith(
                (states) {
                  if (states.contains(WidgetState.selected)) {
                    return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ); // Selected day shape
                  }
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ); // Days shape
                },
              ),
              cancelButtonStyle: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.red), // Cancel button background color
                foregroundColor: WidgetStateProperty.all(Colors.white), // Cancel button text color
              ),
              confirmButtonStyle: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.deepPurple), // Confirm button background color
                foregroundColor: WidgetStateProperty.all(Colors.white), // Confirm button text color
              ),
            ),

            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.deepPurple), // !Text color of dates
            ),
            // colorScheme: ColorScheme.fromSeed(
            //   seedColor: Colors.deepPurple, // ! Color of the header and year selection
            //   secondary: Colors.deepPurple, // !Selected date background color
            //   primary: Colors.deepPurple, // !Selected date background color
            //   onPrimary: Colors.white, // !Selected date text color
            //   surface: Colors.black, // !Header and year selection background color
            //   onSurface: Colors.black, // !Dates text color
            // ),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
    if (pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Date Picker Theme'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              selectedDate == null ? 'No date selected!' : 'Selected date: ${selectedDate.toString().split(' ')[0]}',
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select date'),
            ),
          ],
        ),
      ),
    );
  }
}
