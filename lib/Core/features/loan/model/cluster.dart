import 'package:moni/Core/features/loan/model/active_agent.dart';
import 'package:moni/Core/features/loan/model/inactive_agent.dart';

class Cluster {
  int purseBalance;
  int totalInterestEarned;
  int totalOwedByMembers;
  String name;
  double repaymentRate;
  List<ActiveAgent> activeAgents;
  List<InActiveAgent> inactiveAgents;

  int get rate => (repaymentRate * 100).toInt();

  String repaymentDay;

  Cluster({
    required this.name,
    required this.activeAgents,
    required this.repaymentRate,
    required this.purseBalance,
    required this.repaymentDay,
    required this.totalInterestEarned,
    required this.totalOwedByMembers,
    required this.inactiveAgents,
  });


  factory Cluster.fromJson(Map<String, dynamic> json) {
    return Cluster(
      name: json['cluster_name'],
      repaymentRate: json['cluster_repayment_rate'],
      purseBalance: json['cluster_purse_balance'],
      repaymentDay: json['cluster_repayment_day'],
      activeAgents: json['active_agents'].map<ActiveAgent>((json) => ActiveAgent.fromJson(json)).toList(),
      inactiveAgents: json['inactive_agents'].map<InActiveAgent>((json) => InActiveAgent.fromJson(json)).toList(),

      totalInterestEarned: json['total_interest_earned'],
      totalOwedByMembers: json['total_owed_by_members'],);
  }
}
