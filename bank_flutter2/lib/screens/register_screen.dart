import 'dart:convert';

import 'package:bank2/screens/login_screen.dart';
import 'package:date_field/date_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController mobileNo = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController nid = TextEditingController();

  // final TextEditingController accountType = TextEditingController();
  final DateTimeFieldPickerPlatform dob = DateTimeFieldPickerPlatform.material;

  String? selectedGender;
  String? selectedAccountType;
  DateTime? selectedDOB;
  bool isLoading = false;

  // Image Part
  XFile? selectedImage;
  Uint8List? webImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    if (kIsWeb) {
      var pickedImage = await ImagePickerWeb.getImageAsBytes();
      if (pickedImage != null) {
        setState(() {
          webImage = pickedImage;
        });
      }
    } else {
      final XFile? pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          selectedImage = pickedImage;
        });
      }
    }
  }

  // Future<bool> submitRegistration() async {
  //   final user = {
  //     'gender': selectedGender ?? 'Other',
  //     'firstName': firstName.text,
  //     'lastName': lastName.text,
  //     'email': email.text,
  //     'password': password.text,
  //     'mobileNo': mobileNo.text,
  //     'address': address.text,
  //     'nid': nid.text,
  //     'dob': selectedDOB != null ? selectedDOB!.toIso8601String() : ''
  //   };
  //
  //   var uri = Uri.parse('http://localhost:8881/register');
  //   var request = http.MultipartRequest('POST', uri);
  //
  //
  //   request.files.add(
  //     http.MultipartFile.fromString(
  //       'user',
  //       jsonEncode(user),
  //       contentType: MediaType('application', 'json'),
  //     ),
  //   );
  //
  //   if (kIsWeb && webImage != null) {
  //     request.files.add(http.MultipartFile.fromBytes(
  //       'image',
  //       webImage!,
  //       filename: 'upload.jpg',
  //       contentType: MediaType('image', 'jpeg'),
  //     ));
  //   } else if (selectedImage != null) {
  //     request.files.add(await http.MultipartFile.fromPath(
  //       'image',
  //       selectedImage!.path,
  //     ));
  //   }
  //
  //
  //   try {
  //     var response = await request.send();
  //     if (response.statusCode == 200) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Registration successful!')),
  //       );
  //       print('Registration successful');
  //       return true;
  //     } else {
  //       print('Failed to register. Status code: ${response.statusCode}');
  //       return false;
  //     }
  //   } catch (e) {
  //     print('Error occurred while submitting: $e');
  //     return false;
  //   }
  // }

  final _formKey = GlobalKey<FormState>();

  void _register() async {
    if (_formKey.currentState!.validate()) {
      final user = {
        'firstName': firstName.text,
        'lastName': lastName.text,
        'email': email.text,
        'password': password.text,
        'mobileNo': mobileNo.text,
        'address': address.text,
        'nid': nid.text,
        'gender': selectedGender ?? 'Other',
        'dob': selectedDOB != null ? selectedDOB!.toIso8601String() : '',
        'accountType': selectedAccountType ?? 'Savings'
      };

      setState(() {
        isLoading = true;
      });
      final response = await _sendDataToBackend(user);

      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 201 || response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else {
        print("Registration failed with status: ${response.statusCode}");
      }
    }
  }

  // Future<bool> _register() async {
  //
  //   final user = {
  //     'gender': selectedGender ?? 'Other',
  //     'firstName': firstName.text,
  //     'lastName': lastName.text,
  //     'email': email.text,
  //     'password': password.text,
  //     'mobileNo': mobileNo.text,
  //     'address': address.text,
  //     'nid': nid.text,
  //
  //     'dob': selectedDOB != null ? selectedDOB!.toIso8601String() : '',
  //     'accountType': selectedAccountType ?? 'Savings'
  //   };
  //
  //   var uri = Uri.parse('http://localhost:8881/register');
  //   var request = http.MultipartRequest('POST', uri);
  //
  //
  //   request.files.add(
  //     http.MultipartFile.fromString(
  //       'user',
  //       jsonEncode(user),
  //       contentType: MediaType('application', 'json'),
  //     ),
  //   );
  //
  //   if (kIsWeb && webImage != null) {
  //     request.files.add(http.MultipartFile.fromBytes(
  //       'image',
  //       webImage!,
  //       filename: 'upload.jpg',
  //       contentType: MediaType('image', 'jpeg'),
  //     ));
  //   } else if (selectedImage != null) {
  //     request.files.add(await http.MultipartFile.fromPath(
  //       'image',
  //       selectedImage!.path,
  //     ));
  //   }
  //
  //
  //   try {
  //     var response = await request.send();
  //     if (response.statusCode == 200) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Registration successful!')),
  //       );
  //       print('Registration successful');
  //       return true;
  //     } else {
  //       print('Failed to register. Status code: ${response.statusCode}');
  //       return false;
  //     }
  //   } catch (e) {
  //     print('Error occurred while submitting: $e');
  //     return false;
  //   }
  //
  //
  //   // if (_formKey.currentState!.validate()) {
  //   //   String uFirstName = firstName.text;
  //   //   String uLastName = lastName.text;
  //   //   String uEmail = email.text;
  //   //   String uPassword = password.text;
  //   //   String uMobileNo = mobileNo.text;
  //   //   String uAddress = address.text;
  //   //   String uNid = nid.text;
  //   //   String uGender = selectedGender ?? 'Other';
  //   //   String uDob = selectedDOB != null ? selectedDOB!.toIso8601String() : '';
  //   //
  //   //   String uAccountType = selectedAccountType ?? 'Savings';
  //   //
  //   //
  //   //   final response = await _sendDataToBackend(uFirstName, uLastName, uEmail,
  //   //       uPassword, uMobileNo, uAddress, uNid, uGender, uDob, uAccountType);
  //   //
  //   //   if (response.statusCode == 201 || response.statusCode == 200) {
  //   //     print('Registration successful!');
  //   //   } else if (response.statusCode == 409) {
  //   //     print('User already exists!');
  //   //   } else {
  //   //     print('Registration failed with status: ${response.statusCode}');
  //   //   }
  //   // }
  // }

  // Future<bool> submitRegister() async {
  //
  //   final user {
  //     'firstName': firstName.text,
  //     'lastName': lastName.text
  //   };
  //
  //   return
  // }

  Future<http.Response> _sendDataToBackend(Map<String, String> user) async {
    const String url = 'http://localhost:8881/register';
    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.files.add(
      http.MultipartFile.fromString(
        'user',
        jsonEncode(user),
        contentType: MediaType('application', 'json'),
      ),
    );

    if (kIsWeb && webImage != null) {
      request.files.add(http.MultipartFile.fromBytes(
        'image',
        webImage!,
        filename: 'upload.jpg',
        contentType: MediaType('image', 'jpeg'),
      ));
    } else if (selectedImage != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        selectedImage!.path,
      ));
    }

    final response = await request.send();
    return await http.Response.fromStream(response);
  }

  // Future<http.Response> _sendDataToBackend(
  //     String firstName,
  //     String lastName,
  //     String email,
  //     String password,
  //     String mobileNo,
  //     String address,
  //     String nid,
  //     String gender,
  //     String dob,
  //     String accountType
  //
  //     ) async {
  //   const String url = 'http://localhost:8881/register';
  //   final response = await http.post(
  //     Uri.parse(url),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({
  //       'firstName': firstName,
  //       'lastName': lastName,
  //       'email': email,
  //       'password': password,
  //       'mobileNo': mobileNo,
  //       'address': address,
  //       'nid': nid,
  //       'gender': gender,
  //       'dob': dob,
  //       'accountType': accountType
  //     }),
  //   );
  //   return response;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMS Bank Ltd.',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 16, 80, 98),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 16, 80, 98),
              Color.fromARGB(255, 32, 160, 180),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Image.file(file),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.image),
                    label: const Text('Upload Profile Picture'),
                    onPressed: pickImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  // CircleAvatar(
                  //   radius: 40,
                  //   backgroundColor: Colors.white,
                  //   child: Icon(
                  //     Icons.person_add,
                  //     color: Color.fromARGB(255, 16, 80, 98),
                  //     size: 50,
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  _buildTextField('First Name', firstName, Icons.person),
                  SizedBox(height: 20),
                  _buildTextField('Last Name', lastName, Icons.person),
                  SizedBox(height: 20),
                  _buildTextField('Email', email, Icons.email),
                  SizedBox(height: 20),
                  _buildPasswordField('Password', password, Icons.password),
                  SizedBox(height: 20),
                  _buildTextField('Mobile Number', mobileNo, Icons.phone),
                  SizedBox(height: 20),
                  _buildTextField(
                      'Address', address, Icons.maps_home_work_rounded),
                  SizedBox(height: 20),
                  _buildTextField('National ID', nid, Icons.privacy_tip),
                  SizedBox(height: 20),
                  DateTimeFormField(
                    decoration: InputDecoration(
                      labelText: 'Date of Birth',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      labelStyle: TextStyle(color: Colors.white70),
                      prefixIcon:
                          Icon(Icons.calendar_today, color: Colors.white70),
                    ),
                    style: TextStyle(color: Colors.white),
                    mode: DateTimeFieldPickerMode.date,
                    pickerPlatform: dob,
                    onChanged: (DateTime? value) {
                      setState(() {
                        selectedDOB = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  _buildGenderSelection(),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedAccountType,
                    decoration: InputDecoration(
                      labelText: 'Account Type',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      labelStyle: TextStyle(color: Colors.white70),
                      prefixIcon:
                          Icon(Icons.account_balance, color: Colors.white70),
                    ),
                    style: TextStyle(color: Colors.white),
                    items:
                        ['Savings Account', 'Current Account', 'Fixed Deposit']
                            .map((type) => DropdownMenuItem(
                                  value: type,
                                  child: Text(
                                    type,
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    // style: TextStyle(color: Colors.white, backgroundColor: Colors.teal[900]),
                                  ),
                                ))
                            .toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedAccountType = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _register,
                    // onPressed: () async {
                    //   bool isRegistered = await _register();
                    //   if (isRegistered) {
                    //     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    //   } else {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       const SnackBar(content: Text('Registration failed. Please try again.')),
                    //     );
                    //   }
                    // },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 40.0),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: GoogleFonts.lato().fontFamily,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color.fromARGB(255, 16, 80, 98),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(
                    endIndent: 8,
                    indent: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'Back to Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        labelStyle: TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildPasswordField(
      String label, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        labelStyle: TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildGenderSelection() {
    return Row(
      children: [
        Text('Gender:', style: TextStyle(color: Colors.white70)),
        Expanded(
          child: Row(
            children: [
              Radio<String>(
                value: 'Male',
                groupValue: selectedGender,
                onChanged: (String? value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
                activeColor: Colors.white,
              ),
              Text('Male', style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Radio<String>(
                value: 'Female',
                groupValue: selectedGender,
                onChanged: (String? value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
                activeColor: Colors.white,
              ),
              Text('Female', style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Radio<String>(
                value: 'Other',
                groupValue: selectedGender,
                onChanged: (String? value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
                activeColor: Colors.white,
              ),
              Text('Other', style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ],
    );
  }
}

