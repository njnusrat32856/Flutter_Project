import 'package:bank2/models/loan.dart';
import 'package:bank2/screens/loan_part/loan_payment_screen.dart';
import 'package:bank2/services/loan_service.dart';
import 'package:flutter/material.dart';

class ViewLoanDetailsScreen extends StatefulWidget {
  const ViewLoanDetailsScreen({super.key});

  @override
  State<ViewLoanDetailsScreen> createState() => _ViewLoanDetailsScreenState();
}

class _ViewLoanDetailsScreenState extends State<ViewLoanDetailsScreen> {
  final LoanService loanService = LoanService();
  late Future<List<Loan>> _loans;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loans = loanService.getAllLoans();
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
          "Loan Details",
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
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 16, 80, 98), Color.fromARGB(255, 32, 160, 180)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder<List<Loan>>(
                  future: _loans,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator(),);
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: hasError ${snapshot.error}", style: TextStyle(color: Colors.white),),);
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text("No Loans Found", style: TextStyle(color: Colors.white),),);
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final loan = snapshot.data![index];

                            return _buildLoanCard(loan);
                          }
                      );
                    }
                  }
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLoanCard(Loan loan) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Padding(
          padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Loan Type and Amount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  loan.loanType,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$${loan.loanAmount.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Interest Rate and Monthly Payment
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Interest Rate: ${loan.interestRate.toStringAsFixed(2)}%",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                Text(
                  "Monthly Payment: \$${loan.monthlyPayment.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Duration and Balance Remaining
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Duration: ${loan.durationInMonths} months",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                Text(
                  "Balance: \$${loan.balanceRemaining.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Start Date and End Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Start Date: ${_formatDate(loan.startDate)}",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                Text(
                  "End Date: ${_formatDate(loan.endDate)}",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Payments Made
            Text(
              "Payments Made: ${loan.paymentsMade.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),

            // Payment Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 16, 80, 98),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoanPaymentScreen(loanId: loan.id),
                    ),
                  );
                },
                child: Text(
                    "Make Payment",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
