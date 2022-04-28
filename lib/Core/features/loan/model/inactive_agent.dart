import 'package:moni/Core/features/loan/model/agent.dart';

class InActiveAgent extends Agent{
  String firstName;
  String lastName;
  String avatar;


  InActiveAgent({
    required this.lastName,
    required this.firstName,
    required this.avatar,

  });

  factory InActiveAgent.fromJson(Map<String, dynamic> response) {
    final json = response['agent'];
    return InActiveAgent(
      lastName: json['last_name'],
      firstName: json['first_name'],
      avatar: 'assets/${_getImage(json['first_name'])}'

    );
  }

  static String _getImage(String firstName) {
    if(firstName.startsWith('B')) {
      return 'absko.png';
    }else if(firstName.startsWith('O')) {
      return 'mensa.png';
    }else if(firstName.startsWith('K')) {
      return 'rebecca.png';
    }else if(firstName.startsWith('J')) {
      return 'uche.png';
    }
    else{
      return 'anisa.png';
    }
  }

}