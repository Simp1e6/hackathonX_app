import 'package:flutter/material.dart';

class SecondMap extends StatefulWidget {
  final String title;

  const SecondMap({super.key, required this.title});

  @override
  _SecondMapState createState() => _SecondMapState();
}

class _SecondMapState extends State<SecondMap> {
  
  double _scale = 1.0; // Default scale for image zoom

  void _zoomIn() {
    setState(() {
      _scale += 0.1;
    });
  }

  void _zoomOut() {
    setState(() {
      _scale = (_scale > _initialScale) ? _scale - 0.1 : _initialScale; // Minimum scale limit
    });
  }

  double _initialScale = 1.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initialScale = _scale;
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                      title: Text('Available Nearby Donations'),
                    ),
                    body: Center(
                      child: ListView(
                        padding: const EdgeInsets.all(16.0),
                        children: List.generate(5, (index) {
                          return Card(
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 500,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Food Name: Food ${index + 1}',
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Quantity Available: ${10 * (index + 1)}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Organization: Restaurant ${String.fromCharCode(65 + index)}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Address: ${index + 123} Main St, Springfield',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Contact: 123-456-78${90 + index}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Implement apply action
                                      },
                                      child: const Text('Apply'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              );
            },
            child: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

class FindFood {
  final String identity;

  FindFood({required this.identity});

}

// class DonationForm extends StatefulWidget {
//   const DonationForm({super.key});

//   @override
//   _DonationFormState createState() => _DonationFormState();
// }

// class _DonationFormState extends State<DonationForm> {
//   final _formKey = GlobalKey<FormState>();

//   // Controllers for form fields
//   final TextEditingController foodController = TextEditingController();
//   final TextEditingController quantityController = TextEditingController();
//   final TextEditingController orgNameController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController contactController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Form Title: Donation Form
//             const Text(
//               'Donation Form',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             // Food Name
//             TextFormField(
//               controller: foodController,
//               decoration: const InputDecoration(labelText: 'Food Name'),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Food Name is required';
//                 }
//                 return null;
//               },
//             ),
//             // Quantity
//             TextFormField(
//               controller: quantityController,
//               decoration: const InputDecoration(labelText: 'Quantity'),
//               keyboardType: TextInputType.number,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Quantity is required';
//                 }
//                 final quantity = int.tryParse(value);
//                 if (quantity == null || quantity <= 0) {
//                   return 'Enter a valid positive number for quantity';
//                 }
//                 return null;
//               },
//             ),
//             // Organization Name
//             TextFormField(
//               controller: orgNameController,
//               decoration: const InputDecoration(labelText: 'Organization Name'),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Organization Name is required';
//                 }
//                 return null;
//               },
//             ),
//             // Address
//             TextFormField(
//               controller: addressController,
//               decoration: const InputDecoration(labelText: 'Address'),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Address is required';
//                 }
//                 return null;
//               },
//             ),
//             // Contact Number
//             TextFormField(
//               controller: contactController,
//               decoration: const InputDecoration(labelText: 'Contact Number'),
//               keyboardType: TextInputType.phone,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Contact number is required';
//                 }
//                 final regExp = RegExp(r'^[0-9-]+$');
//                 if (!regExp.hasMatch(value)) {
//                   return 'Enter a valid contact number (numbers and hyphens only)';
//                 }
//                 return null;
//               },
//             ),
//             const SizedBox(height: 20),
//             // Submit Button
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   // Form is valid, keep the form open (no closing the sheet)
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                         content: Text('Form submitted successfully!')),
//                   );
//                 }
//               },
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }