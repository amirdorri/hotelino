import 'package:flutter/material.dart';
import 'package:hotelino/features/booking/booking_provider.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();

  void resetForm() {
    Future.delayed(Duration(milliseconds: 100), () {
      _formKey.currentState?.reset();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('فرم رزرو هتل', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Consumer<BookingProvider>(builder: (context, value, child) {

          },),
        ),
      ),
    );
  }
}
