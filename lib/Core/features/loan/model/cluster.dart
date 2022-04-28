class Cluster {
  int purseBalance;
  int totalInterestEarned;
  int totalOwedByMembers;
  String name;
  double repaymentRate;

  String repaymentDay;

  Cluster({
    required this.name,
    required this.repaymentRate,
    required this.purseBalance,
    required this.repaymentDay,
    required this.totalInterestEarned,
    required this.totalOwedByMembers,
  });


  factory Cluster.fromJson(Map<String, dynamic> json) {
    return Cluster(
      name: json['cluster_name'],
      repaymentRate: json['cluster_repayment_rate'],
      purseBalance: json['cluster_purse_balance'],
      repaymentDay: json['cluster_repayment_day'],
      totalInterestEarned: json['total_interest_earned'],
      totalOwedByMembers: json['total_owed_by_members'],);
  }
}
