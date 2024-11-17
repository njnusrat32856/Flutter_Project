import 'package:bank2/models/user.dart';

class Loan {
  final int id;
  final String loanType;
  final double loanAmount;
  final double interestRate;
  final double monthlyPayment;
  final int durationInMonths;
  final double balanceRemaining;
  final DateTime startDate;
  final DateTime endDate;
  final String status;
  final double paymentsMade;
  final User user;

  Loan({
    required this.id,
    required this.loanType,
    required this.loanAmount,
    required this.interestRate,
    required this.monthlyPayment,
    required this.durationInMonths,
    required this.balanceRemaining,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.paymentsMade,
    required this.user,
  });

  // Factory constructor to create a Loan from JSON
  factory Loan.fromJson(Map<String, dynamic> json) {
    return Loan(
      id: json['id'],
      loanType: json['loanType'],
      loanAmount: json['loanAmount'],
      interestRate: json['interestRate'],
      monthlyPayment: json['monthlyPayment'],
      durationInMonths: json['durationInMonths'],
      balanceRemaining: json['balanceRemaining'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      status: json['status'],
      paymentsMade: json['paymentsMade'],
      user: User.fromJson(json['user']),
    );
  }

  // Method to convert a Loan object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'loanType': loanType,
      'loanAmount': loanAmount,
      'interestRate': interestRate,
      'monthlyPayment': monthlyPayment,
      'durationInMonths': durationInMonths,
      'balanceRemaining': balanceRemaining,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'status': status,
      'paymentsMade': paymentsMade,
      'user': user.toJson(),
    };
  }
}