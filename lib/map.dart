import 'package:flutter/material.dart';

class Map extends StatefulWidget {
  final String title;

  const Map({super.key, required this.title});

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  double _scale = 1.0; // Default scale for image zoom

  void _zoomIn() {
    setState(() {
      _scale += 0.1;
    });
  }

  void _zoomOut() {
    setState(() {
      _scale = (_scale > 0.2) ? _scale - 0.1 : 0.1; // Minimum scale limit
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the image from assets with scaling
            Expanded(
              child: Transform.scale(
                scale: _scale,
                child: Image.asset(
                  'assets/maps.png', // Ensure this file exists in the assets folder
                  fit: BoxFit.cover, // Make the image fit the screen
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Zoom In Button
          FloatingActionButton(
            heroTag: "zoomIn",
            onPressed: _zoomIn,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          // Zoom Out Button
          FloatingActionButton(
            heroTag: "zoomOut",
            onPressed: _zoomOut,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          // Add Button to open the form
          FloatingActionButton(
            heroTag: "addForm",
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: DonationForm(), // Separate widget to handle the form
                  );
                },
              );
            },
            child: const Icon(Icons.add_box),
          ),
        ],
      ),
    );
  }
}

class DonationForm extends StatefulWidget {
  const DonationForm({super.key});

  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
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
            // Form Title: Donation Form
            const Text(
              'Donation Form',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
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
                  // Form is valid, keep the form open (no closing the sheet)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Form submitted successfully!')),
                  );
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