import 'package:bank2/screens/bank_statement_screen.dart';
import 'package:bank2/screens/loan_part/apply_loan_screen.dart';
import 'package:bank2/screens/loan_part/view_loan_details_screen.dart';
import 'package:bank2/services/auth_service.dart';
import 'package:bank2/widgets/action_button.dart';
import 'package:bank2/widgets/time_option_button.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LoansOtherActivityScreen extends StatelessWidget {
  const LoansOtherActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 16, 80, 98),
          // leading: IconButton.outlined(
          //     onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
          title: Text(
            'Loan Activity',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton.outlined(onPressed: () {}, icon: Icon(Icons.more_horiz, color: Colors.white,)),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 239, 243, 245),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ActionButton(
                        icon: Icons.credit_card,
                        label: 'Loan Apply',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ApplyLoanScreen())
                          );
                        },
                      ),
                      ActionButton(
                        icon: Icons.info,
                        label: 'Loan Details',
                        onPressed: () {
                          // here should be loan details
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ViewLoanDetailsScreen())
                          );
                        },
                      ),
                      // ActionButton(
                      //   icon: Icons.payments,
                      //   label: 'Pay Loans',
                      //   onPressed: () {
                      //     // here should be loan payments
                      //     // Navigator.push(
                      //     //   context,
                      //     //   MaterialPageRoute(builder: (context) => WithdrawScreen()),
                      //     // );
                      //   },
                      // ),
                      ActionButton(
                        icon: Icons.apps_sharp,
                        label: 'More',
                        onPressed: () async {

                          final authService = AuthService();
                          final user = await authService.getUser();

                          if (user != null && user['id'] != null) {

                            int userId = user['id'];
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BankStatementScreen(userId: userId),
                              ),
                            );
                          } else {
                            // Handle the case where the user is null or userId is not available
                            print('User not found or invalid user data');
                          }
                          // Navigator.push(
                          //     context,
                          //     // MaterialPageRoute(builder: (context) => BankStatementScreen())
                          //     MaterialPageRoute(builder: (context) => BankStatementScreen(userId: 3))
                          // );
                        },
                      ),
                    ],
                  ),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       ActionButton(
                //         icon: Icons.account_balance,
                //         label: 'Deposit',
                //         onPressed: () {
                //           // Navigator.push(
                //           //     context,
                //           //     MaterialPageRoute(builder: (context) => DepositScreen())
                //           // );
                //         },
                //       ),
                //       ActionButton(
                //         icon: Icons.swap_horiz,
                //         label: 'Transfer',
                //         onPressed: () {
                //           // Navigator.push(
                //           //     context,
                //           //     MaterialPageRoute(builder: (context) => TransferScreen())
                //           // );
                //         },
                //       ),
                //       ActionButton(
                //         icon: Icons.attach_money,
                //         label: 'Withdraw',
                //         onPressed: () {
                //           // Navigator.push(
                //           //   context,
                //           //   MaterialPageRoute(builder: (context) => WithdrawScreen()),
                //           // );
                //         },
                //       ),
                //       ActionButton(
                //         icon: Icons.apps_sharp,
                //         label: 'More',
                //         onPressed: () async {
                //
                //           final authService = AuthService();
                //           final user = await authService.getUser();
                //
                //           if (user != null && user['id'] != null) {
                //
                //             int userId = user['id'];
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => BankStatementScreen(userId: userId),
                //               ),
                //             );
                //           } else {
                //             // Handle the case where the user is null or userId is not available
                //             print('User not found or invalid user data');
                //           }
                //           // Navigator.push(
                //           //     context,
                //           //     // MaterialPageRoute(builder: (context) => BankStatementScreen())
                //           //     MaterialPageRoute(builder: (context) => BankStatementScreen(userId: 3))
                //           // );
                //         },
                //       ),
                //     ],
                //   ),
                //   // child: Row(
                //   //     children: List.generate(
                //   //         3,
                //   //         (index) => Padding(
                //   //               padding: const EdgeInsets.all(8.0),
                //   //               child: Container(
                //   //                 width: 340,
                //   //                 height: 75,
                //   //                 decoration: BoxDecoration(
                //   //                     color: (index % 2 == 0)
                //   //                         ? Color.fromARGB(255, 16, 80, 98)
                //   //                         : Colors.black,
                //   //                     borderRadius: BorderRadius.circular(20)),
                //   //                 child: Padding(
                //   //                   padding: const EdgeInsets.all(8.0),
                //   //                   child: Row(
                //   //                     children: [
                //   //                       Text(
                //   //                         'Smartpay Cards',
                //   //                         style: TextStyle(
                //   //                             color: Colors.white,
                //   //                             fontSize: 16,
                //   //                             fontWeight: FontWeight.w600),
                //   //                       ),
                //   //                       Spacer(),
                //   //                       Text(
                //   //                         '**** 1999',
                //   //                         style: TextStyle(
                //   //                             color: Colors.white,
                //   //                             fontSize: 16,
                //   //                             fontWeight: FontWeight.w600),
                //   //                       ),
                //   //                       Padding(
                //   //                         padding:
                //   //                             const EdgeInsets.only(left: 12.0),
                //   //                         child: Row(
                //   //                           mainAxisAlignment:
                //   //                               MainAxisAlignment.start,
                //   //                           children: [
                //   //                             CircleAvatar(
                //   //                               radius: 15,
                //   //                               backgroundColor: Colors.white
                //   //                                   .withOpacity(0.8),
                //   //                             ),
                //   //                             Transform.translate(
                //   //                               offset: Offset(-10, 0),
                //   //                               child: CircleAvatar(
                //   //                                 radius: 15,
                //   //                                 backgroundColor: Colors.white
                //   //                                     .withOpacity(0.8),
                //   //                               ),
                //   //                             )
                //   //                           ],
                //   //                         ),
                //   //                       )
                //   //                     ],
                //   //                   ),
                //   //                 ),
                //   //               ),
                //   //             )
                //   //     )
                //   // ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Total Loans',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '\$19432.00',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TimeOptionsRow(),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: LineChart(LineChartData(
                            gridData: FlGridData(show: false),
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    const tiles = [
                                      'S',
                                      'M',
                                      'T',
                                      'W',
                                      'T',
                                      'F'
                                    ];
                                    final index = value.toInt();
                                    if (index > 0 && index < tiles.length) {
                                      return Text(
                                        tiles[index],
                                        style: TextStyle(color: Colors.grey),
                                      );
                                    }
                                    return Text("");
                                  },
                                  reservedSize: 22,
                                  interval: 1,
                                ),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                            lineBarsData: [
                              LineChartBarData(
                                  spots: [
                                    FlSpot(0, 2),
                                    FlSpot(1, 1),
                                    FlSpot(2, 4),
                                    FlSpot(4, 3),
                                    FlSpot(5, 4),
                                    FlSpot(6, 6),
                                  ],
                                  isCurved: true,
                                  color: Colors.teal,
                                  barWidth: 3,
                                  dotData: FlDotData(show: false),
                                  belowBarData: BarAreaData(
                                      show: true,
                                      color: Colors.teal.withOpacity(0.07)))
                            ])),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transactios",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "All Data",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.teal,
                        )
                      ],
                    )
                  ],
                ),
                Column(
                    children: List.generate(
                        3,
                        (index) => ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 239, 243, 245),
                                child: Icon(
                                  Icons.payment_rounded,
                                  color: Colors.blue,
                                ),
                              ),
                              title: Text(
                                'Deposit',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text("Added Money"),
                              trailing: Text(
                                "+\$1000.00",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                            )
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}
