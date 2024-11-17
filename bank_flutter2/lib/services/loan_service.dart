import 'dart:convert';

import 'package:bank2/models/loan.dart';
import 'package:bank2/services/auth_service.dart';
import 'package:http/http.dart' as http;

class LoanService{
  final String baseUrl = 'http://localhost:8881/api/loans';
  final AuthService userService = AuthService();

  Future<Map<String, String>> _getAuthHeaders() async {
    final token = await userService.getToken();
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
  }

  Future<List<Loan>> getAllLoans() async {
    final response = await http.get(Uri.parse('$baseUrl/'));

    print(response.statusCode);

    if (response.statusCode == 200) {
      final List<dynamic> loanData = json.decode(response.body);
      return loanData.map((json) => Loan.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  Future<void> applyLoan(Map<String, dynamic> loanData) async {
    final url = Uri.parse('$baseUrl/save');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(loanData),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Apply Loan successful: ${response.body}');
    } else {
      throw Exception('Failed to apply for loan: ${response.body}');
    }
  }

  // Future<Loan?> applyLoan() async {
  //   final url = Uri.parse('$baseUrl/save');
  //   final response = await http.post(url);
  //
  //   if (response.statusCode == 200) {
  //     print('Apply Loan successful: ${response.body}');
  //   } else {
  //     throw Exception('Failed to apply for loan: ${response.body}');
  //   }
  // }

  Future<void> deleteLoan(int id) async {
    final headers = await _getAuthHeaders();
    final response =
    await http.delete(Uri.parse('$baseUrl/delete/$id'), headers: headers);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete transaction');
    }
  }

}