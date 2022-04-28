import 'package:moni/Core/features/loan/model/agent.dart';

class ActiveAgent extends Agent {
  String firstName;
  String lastName;
  int loanAmount;
  int daysToDue;

  ActiveAgent({
    required this.lastName,
    required this.firstName,
    required this.daysToDue,
    required this.loanAmount,
  });

  factory ActiveAgent.fromJson(Map<String, dynamic> response) {
    final json = response['agent'];
    return ActiveAgent(
      lastName: json['last_name'],
      firstName: json['first_name'],
      daysToDue: _getDaysToDueDate(json['recent_loan']['agent_loan']['loan_due_date']),
      loanAmount: json['recent_loan']['loan_amount'],
    );
  }

  static int _getDaysToDueDate(String date) {

    final dateTime = DateTime.parse(date);
    final dueDate = dateTime.difference(DateTime.now());
    return dueDate.inDays.abs();
  }
}
