import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  // Sample user profile data
  final String userName = "John Doe";
  final String userProfileImage =
      "https://www.w3schools.com/w3images/avatar2.png"; // Replace with a valid URL

  // Sample transaction data
  final List<Map<String, String>> transactions = [
    {'date': '2024-12-07', 'description': 'Transfer to John Doe', 'amount': '-1,000 KHR'},
    {'date': '2024-12-05', 'description': 'Deposit from ATM', 'amount': '+5,000 KHR'},
    {'date': '2024-12-03', 'description': 'Bill Payment - Electricity', 'amount': '-2,000 KHR'},
    {'date': '2024-12-01', 'description': 'Transfer from Sarah', 'amount': '+3,500 KHR'},
    {'date': '2024-11-30', 'description': 'Transfer to Vendor', 'amount': '-10,000 KHR'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction History"),
        backgroundColor: Color(0xFF0066A1), // Primary ACLEDA Blue
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              leading: CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(userProfileImage), // Display user profile image
              ),
              title: Text(
                transaction['description']!,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Text(
                    transaction['date']!,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    userName, // Display user name next to the date
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    transaction['amount']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: transaction['amount']!.startsWith('-') ? Colors.red : Colors.green,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'By $userName', // Indicate who initiated the transaction
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TransactionsPage(),
  ));
}
