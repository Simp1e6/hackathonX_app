import 'package:flutter/material.dart';

class Map extends StatelessWidget {
  final String title;

  const Map({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Text(
          'This is the $title',
          style: const TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true, // Allows the sheet to take up more space
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: FoodForm(), // Separate widget to handle the form
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class FoodForm extends StatefulWidget {
  @override
  _FoodFormState createState() => _FoodFormState();
}

class _FoodFormState extends State<FoodForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final TextEditingController foodController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController orgNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Food Name
            TextFormField(
              controller: foodController,
              decoration: const InputDecoration(labelText: 'Food Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Food Name is required';
                }
                return null;
              },
            ),
            // Quantity
            TextFormField(
              controller: quantityController,
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Quantity is required';
                }
                final quantity = int.tryParse(value);
                if (quantity == null || quantity <= 0) {
                  return 'Enter a valid positive number for quantity';
                }
                return null;
              },
            ),
            // Organization Name
            TextFormField(
              controller: orgNameController,
              decoration: const InputDecoration(labelText: 'Organization Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Organization Name is required';
                }
                return null;
              },
            ),
            // Address
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Address'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Address is required';
                }
                return null;
              },
            ),
            // Contact Number
            TextFormField(
              controller: contactController,
              decoration: const InputDecoration(labelText: 'Contact Number'),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Contact number is required';
                }
                final regExp = RegExp(r'^[0-9-]+$');
                if (!regExp.hasMatch(value)) {
                  return 'Enter a valid contact number (numbers and hyphens only)';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            // Submit Button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Form is valid, submit the form
                  Navigator.pop(context); // Close the bottom sheet
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
