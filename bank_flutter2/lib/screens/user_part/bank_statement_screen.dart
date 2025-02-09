import 'package:bank2/models/transaction.dart';
import 'package:bank2/services/transaction_service.dart';
import 'package:flutter/material.dart';

class BankStatementScreen extends StatefulWidget {
  final int userId;
  // const BankStatementScreen({super.key});
  const BankStatementScreen({super.key, required this.userId});

  @override
  State<BankStatementScreen> createState() => _BankStatementScreenState();
}

class _BankStatementScreenState extends State<BankStatementScreen> {
  late Future<List<Transaction>> transactions;
  // late Future<List<Map<String, dynamic>>> transactions;
  final TransactionService transactionService = TransactionService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // transactions = TransactionService().getAllTransactions();
    transactions = transactionService.getTransactionsByUserId(widget.userId);
    print(transactions);
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
            "Bank Statement",
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
            Text(
              "Recent Transactions",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Transaction>>(
                future: transactions,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    print("Error in FutureBuilder: ${snapshot.error}");
                    return Center(child: Text("Error: ${snapshot.error}", style: TextStyle(color: Colors.white)));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("No transactions found", style: TextStyle(color: Colors.white)));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final transaction = snapshot.data![index];
                        
                        return _buildTransactionCard(transaction);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionCard(Transaction transaction) {
    return Card(
      color: Colors.white.withOpacity(0.99),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(
          _getIconForTransactionType(transaction.transactionType),
          color: _getColorForTransactionType(transaction.transactionType),
        ),
        title: Text(
          transaction.description ?? 'No description',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          transaction.transactionDate ?? 'No date',
          style: TextStyle(color: Colors.grey[600]),
        ),
        trailing: Text(
          "\$${transaction.amount.toStringAsFixed(2)}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _getColorForTransactionType(transaction.transactionType),
          ),
        ),
      ),
    );
  }

  IconData _getIconForTransactionType(String? type) {
    switch (type) {
      case 'DEPOSIT':
        return Icons.arrow_downward;
      case 'WITHDRAW':
        return Icons.arrow_upward;
      case 'FUND_TRANSFER':
        return Icons.swap_horiz;
      default:
        return Icons.help_outline;
    }
  }

  Color _getColorForTransactionType(String? type) {
    switch (type) {
      case 'DEPOSIT':
        return Colors.green;
      case 'WITHDRAW':
        return Colors.red;
      case 'FUND_TRANSFER':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

}
