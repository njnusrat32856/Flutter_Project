import 'package:bank2/services/loan_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ApplyLoanScreen extends StatefulWidget {
  @override
  _ApplyLoanScreenState createState() => _ApplyLoanScreenState();
}

class _ApplyLoanScreenState extends State<ApplyLoanScreen> {
  final LoanService loanService = LoanService();
  final _formKey = GlobalKey<FormState>();

  // Input fields
  final TextEditingController _loanAmountController = TextEditingController();
  final TextEditingController _interestRateController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  String _loanPurpose = "Personal";

  // Additional fields
  String _startDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String? _endDate;

  bool _isSubmitting = false;

  Future<void> _submitLoanApplication() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      try {
        // Calculate end date
        final startDate = DateTime.parse(_startDate);
        final endDate = DateTime(
          startDate.year,
          startDate.month + int.parse(_durationController.text),
          startDate.day,
        );
        _endDate = DateFormat('yyyy-MM-dd').format(endDate);

        // Create loan data
        final loanData = {
          "loanType": _loanPurpose,
          "loanAmount": double.parse(_loanAmountController.text),
          "interestRate": double.parse(_interestRateController.text),
          "durationInMonths": int.parse(_durationController.text),
          "startDate": _startDate,
          "endDate": _endDate,
          "status": "Pending",
        };

        // Save loan
        await loanService.applyLoan(loanData);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Loan application submitted successfully!"),
          backgroundColor: Colors.green,
        ));

        // Reset form
        _loanAmountController.clear();
        _interestRateController.clear();
        _durationController.clear();
        setState(() {
          _loanPurpose = "Personal";
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed to submit loan application: $e"),
          backgroundColor: Colors.red,
        ));
      } finally {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Apply for Loan",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 16, 80, 98),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card for Loan Details
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Loan Details",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 16, 80, 98),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _loanAmountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Loan Amount",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.attach_money),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter loan amount";
                            }
                            if (double.tryParse(value) == null) {
                              return "Enter a valid number";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _interestRateController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Interest Rate (%)",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.percent),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter interest rate";
                            }
                            if (double.tryParse(value) == null) {
                              return "Enter a valid percentage";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _durationController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Duration (Months)",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.timer),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter duration in months";
                            }
                            if (int.tryParse(value) == null) {
                              return "Enter a valid number";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: _loanPurpose,
                          decoration: InputDecoration(
                            labelText: "Loan Purpose",
                            border: OutlineInputBorder(),
                          ),
                          items: ["Personal", "Business", "Education", "Medical", "Other"]
                              .map((purpose) => DropdownMenuItem(
                            value: purpose,
                            child: Text(purpose),
                          ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _loanPurpose = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // Button to Apply for Loan
                Center(
                  child: ElevatedButton(
                    onPressed: _isSubmitting ? null : _submitLoanApplication,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 16, 80, 98),
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: _isSubmitting
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                      "Apply",
                      style: TextStyle(
                          fontSize: 18,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Apply for Loan"),
//         backgroundColor: Color.fromARGB(255, 16, 80, 98),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Loan Details",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 16, 80, 98),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: _loanAmountController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     labelText: "Loan Amount",
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.attach_money),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Please enter loan amount";
//                     }
//                     if (double.tryParse(value) == null) {
//                       return "Enter a valid number";
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: _interestRateController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     labelText: "Interest Rate (%)",
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.percent),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Please enter interest rate";
//                     }
//                     if (double.tryParse(value) == null) {
//                       return "Enter a valid percentage";
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: _durationController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     labelText: "Duration (Months)",
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.timer),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Please enter duration in months";
//                     }
//                     if (int.tryParse(value) == null) {
//                       return "Enter a valid number";
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 DropdownButtonFormField<String>(
//                   value: _loanPurpose,
//                   decoration: InputDecoration(
//                     labelText: "Loan Purpose",
//                     border: OutlineInputBorder(),
//                   ),
//                   items: ["Personal", "Business", "Education", "Medical", "Other"]
//                       .map((purpose) => DropdownMenuItem(
//                     value: purpose,
//                     child: Text(purpose),
//                   ))
//                       .toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       _loanPurpose = value!;
//                     });
//                   },
//                 ),
//                 SizedBox(height: 30),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: _isSubmitting ? null : _submitLoanApplication,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color.fromARGB(255, 16, 80, 98),
//                       padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: _isSubmitting
//                         ? CircularProgressIndicator(color: Colors.white)
//                         : Text(
//                       "Apply",
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

