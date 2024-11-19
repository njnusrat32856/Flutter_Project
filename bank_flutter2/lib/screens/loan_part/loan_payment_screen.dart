import 'package:bank2/models/loan.dart';
import 'package:bank2/services/loan_service.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:bank2/models/loan.dart';
import 'package:bank2/services/loan_service.dart';

class LoanPaymentScreen extends StatelessWidget {
  final int loanId;

  LoanPaymentScreen({required this.loanId});

  final LoanService _loanService = LoanService();
  final TextEditingController _paymentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _makePayment(BuildContext context, Loan loan) async {
    if (!_formKey.currentState!.validate()) return;

    final paymentAmount = double.parse(_paymentController.text);

    try {
      await _loanService.makeLoanPayment(loanId, paymentAmount);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment successful!')),
      );

      // Refresh the page by pushing it again
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoanPaymentScreen(loanId: loanId),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error making payment: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.outlined(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
        ),
        title: Text(
            'Loan Payment',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 16, 80, 98),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF105062), Color(0xFF20A0B4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder<Loan>(
          future: _loanService.getLoanById(loanId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(color: Colors.red, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Text(
                  'No loan details available',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              final loan = snapshot.data!;

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Loan Details Section in a Card
                    Card(
                      color: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Loan Details',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF105062),
                                  ),
                                ),
                                Icon(Icons.info, color: Color(0xFF20A0B4)),
                              ],
                            ),
                            Divider(color: Colors.grey),
                            Text(
                              'Loan Type: ${loan.loanType}',
                              style: TextStyle(fontSize: 16, color: Colors.black87),
                            ),
                            Text(
                              'Loan Amount: \$${loan.loanAmount.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 16, color: Colors.black87),
                            ),
                            Text(
                              'Balance Remaining: \$${loan.balanceRemaining.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 16, color: Colors.black87),
                            ),
                            Text(
                              'Interest Rate: ${loan.interestRate.toStringAsFixed(2)}%',
                              style: TextStyle(fontSize: 16, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24),

                    // Payment Form Section
                    Text(
                      'Make a Payment',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _paymentController,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.9),
                          labelText: 'Enter Payment Amount',
                          labelStyle: TextStyle(color: Color(0xFF105062)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a payment amount';
                          }
                          final payment = double.tryParse(value);
                          if (payment == null || payment <= 0) {
                            return 'Enter a valid payment amount';
                          }
                          if (payment > loan.balanceRemaining) {
                            return 'Payment exceeds remaining balance';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF20A0B4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        ),
                        onPressed: () => _makePayment(context, loan),
                        child: Text(
                          'Submit Payment',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),

    );
  }
}
