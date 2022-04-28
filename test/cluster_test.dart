import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moni/Core/features/loan/model/cluster.dart';
import 'package:moni/Core/features/repository/loan_repository.dart';
import 'package:moni/Core/routes/api_routes.dart';

import 'cluster_test.mocks.dart';

const response = '''
{"success":true,"message":"cluster agents retrieved successfully",
"data":{"cluster_purse_balance":21200,"total_interest_earned":1200,
"total_owed_by_members":0,"overdue_agents":[],"cluster_name":"Moni Dreambig Cluster",
"cluster_repayment_rate":0.6,"cluster_repayment_day":"Sunday","due_agents":[],
"active_agents":[{"id":"f74c60d3-d0f6-4ba5-89d0-46e72f06dba3","user_id":"89a2c384-6aa0-4ffc-86e7-78d279760d8f",
"agent_id":"adc7d3d1-5627-410a-bee9-32546b860881","cluster_id":"d7907c25-0882-4d7a-a433-71d88c19c250",
"status_id":1,"accepted_at":"2022-03-01 17:40:37","created_at":"2022-03-01 18:39:51",
"agent":{"id":"adc7d3d1-5627-410a-bee9-32546b860881","user_id":"89a2c384-6aa0-4ffc-86e7-78d279760d8f",
"moni_id":null,"eligible_loan_id":"ae043ff0-7c1f-4625-9c4f-e62e8eb3b872","first_name":"Christy",
"middle_name":null,"last_name":"iana ","nickname":"nnana ","birth_date":"2004-02-26 00:00:00",
"gender":"female","business_name":"thank ","marital_status":"single","education":"hnd","house_address":"thwhjk",
"shop_address":"ghjjkklx dgu","lga":"Ika South","city":"dghhj","state":"Delta","country":null,"phone_number":"07017548728",
"email_address":"Test@gmail.com","bvn":"12345678903","has_credit_history":0,"verified":1,"referral_link":"2W4SRTQr2e0u","media_url":null,
"channel":"Mobile","agent_repayment_rate":100,"bvn_verified_after":1,"loan_enabled":1,"status_id":1,
"eligible_loan_modified_at":"2022-03-01 17:55:10","created_at":"2022-03-01 18:39:51","modified_at":"2022-03-01 19:00:51",
"cap_agent_loan":1,"loan_count":1,"recent_loan":{"id":"20fc29b5-437d-41c3-af00-11f7d5381aea","agent_id":"adc7d3d1-5627-410a-bee9-32546b860881",
"cluster_id":"d7907c25-0882-4d7a-a433-71d88c19c250","agent_loan_id":"a2d12999-ceee-4d56-9dfd-d3a4086f593d","loan_amount":100000,
"created_at":"2022-03-01 18:55:45","agent_loan":{"id":"a2d12999-ceee-4d56-9dfd-d3a4086f593d","agent_id":"adc7d3d1-5627-410a-bee9-32546b860881",
"agent_credit_score_id":"052fadda-df1a-48d2-818d-fed73b9f9c07","loan_id":"ae043ff0-7c1f-4625-9c4f-e62e8eb3b872",
"agent_card_id":"e2da5d75-dc2d-4101-9585-f9e68288dda8","interest_type":"percentage",
"interest_value":1.25,"loan_duration_type":"day","loan_duration":5,"loan_due_date":"2022-03-05 23:59:59",
"days_past_due":null,"loan_amount":100000,"loan_amount_due":101250,"loan_interest_due":1250,"loan_payment_date":null,
"loan_payment_rate":null,"loan_amount_paid":0,"penalty_outstanding":0,"penalty_paid":0,"principal_paid":0,"principal_outstanding":100000,
"interest_paid":0,"interest_outstanding":1250,"penalty_amount":0,"loan_status":{"id":1,"name":"active","label":"Active",
"description":"Active item","created_at":"2022-02-27 05:32:24","modified_at":"2022-02-27 05:32:24"},"is_max":1,"status_id":1,"accept_terms":1,
"created_at":"2022-03-01 18:55:45","modified_at":"2022-03-01 18:55:45","status":{"id":1,"name":"active","label":"Active","description":"Active item",
"created_at":"2022-02-27 05:32:24","modified_at":"2022-02-27 05:32:24"}}},"suspended":false}}],
"inactive_agents":[{"id":"00e3e23f-3987-4230-95d7-58efbb7dcaf5","user_id":"2b43b350-3b49-484e-a603-6d125c1408c7",
"agent_id":"2d19af41-7878-439b-8bd9-4c635db78725","cluster_id":"d7907c25-0882-4d7a-a433-71d88c19c250","status_id":1,
"accepted_at":"2022-02-27 11:29:18","created_at":"2022-02-27 12:20:00","agent":{"id":"2d19af41-7878-439b-8bd9-4c635db78725",
"user_id":"2b43b350-3b49-484e-a603-6d125c1408c7","moni_id":null,"eligible_loan_id":"ae043ff0-7c1f-4625-9c4f-e62e8eb3b872",
"first_name":"Benedicta","middle_name":null,"last_name":"Ulinfoh ","nickname":"benedicta ","birth_date":"1993-11-10 00:00:00",
"gender":"female","business_name":"Beniemania ","marital_status":"single","education":"graduate",
"house_address":"my house ","shop_address":"Third roundabout ","lga":"Ikeja","city":"my city ","state":"Lagos","country":null,
"phone_number":"08098406814","email_address":"Mzbenie@gmail.com","bvn":"22145204738","has_credit_history":1,
"verified":1,"referral_link":"UQ8mPrSUVU7Z","media_url":null,"channel":"Mobile","agent_repayment_rate":100,
"bvn_verified_after":1,"loan_enabled":1,"status_id":1,"eligible_loan_modified_at":"2022-02-27 13:34:47","created_at":"2022-02-27 12:20:00",
"modified_at":"2022-02-27 14:51:14","cap_agent_loan":1,"loan_count":2,"recent_loan":{"id":"8c3374bc-d508-4e77-a181-c96febfb9379",
"agent_id":"2d19af41-7878-439b-8bd9-4c635db78725","cluster_id":"d7907c25-0882-4d7a-a433-71d88c19c250",
"agent_loan_id":"da16b509-d955-4ae4-922c-3b5d23b34405","loan_amount":100000,"created_at":"2022-02-28 14:33:19",
"agent_loan":{"id":"da16b509-d955-4ae4-922c-3b5d23b34405","agent_id":"2d19af41-7878-439b-8bd9-4c635db78725",
"agent_credit_score_id":"6a18973c-f07e-4c60-bb69-4096ce11599a",
"loan_id":"ae043ff0-7c1f-4625-9c4f-e62e8eb3b872","agent_card_id":"38da9b87-835e-4a1d-848a-2489a13b76c2",
"interest_type":"percentage","interest_value":1.4,"loan_duration_type":"day","loan_duration":6,"loan_due_date":"2022-03-05 23:59:59","days_past_due":0,"loan_amount":100000,"loan_amount_due":101400,"loan_interest_due":1400,"loan_payment_date":"2022-02-28 14:40:22","loan_payment_rate":100,"loan_amount_paid":101400,"penalty_outstanding":0,"penalty_paid":0,"principal_paid":0,"principal_outstanding":100000,"interest_paid":0,"interest_outstanding":1400,"penalty_amount":0,"loan_status":{"id":20,"name":"repaid","label":"Repaid","description":"Repaid item","created_at":"2022-02-27 05:32:24",
"modified_at":"2022-02-27 05:32:24"},"is_max":1,"status_id":4,"accept_terms":1,"created_at":"2022-02-28 14:33:19","modified_at":"2022-02-28 14:40:22","status":{"id":4,"name":"completed","label":"Completed","description":"Completed item",
"created_at":"2022-02-27 05:32:24","modified_at":"2022-02-27 05:32:24"}}},"suspended":false}},{"id":"52c89129-b953-491d-a1c8-12b630b9838a","user_id":"ca2299a2-a090-4333-a4b4-8e4a91252912","agent_id":"58055ae8-771b-44de-9fb8-03661fdcd2f7","cluster_id":"d7907c25-0882-4d7a-a433-71d88c19c250","status_id":1,"accepted_at":"2022-02-28 12:33:07","created_at":"2022-02-28 13:01:34","agent":{"id":"58055ae8-771b-44de-9fb8-03661fdcd2f7","user_id":"ca2299a2-a090-4333-a4b4-8e4a91252912","moni_id":null,"eligible_loan_id":null,"first_name":"Oluwaleke","middle_name":null,"last_name":"Ojo","nickname":"Fixer","birth_date":null,"gender":"female","business_name":null,"marital_status":null,"education":null,"house_address":null,"shop_address":"Ojodu berger","lga":null,"city":null,"state":null,"country":null,"phone_number":"08067710761","email_address":"Ojopera@gmail.com","bvn":null,"has_credit_history":0,"verified":0,"referral_link":"OS8eiLFIwXkP","media_url":null,"channel":"Mobile","agent_repayment_rate":100,"bvn_verified_after":0,"loan_enabled":1,"status_id":1,"eligible_loan_modified_at":null,"created_at":"2022-02-28 13:01:34","modified_at":"2022-02-28 13:01:34","cap_agent_loan":0,"loan_count":0,"recent_loan":null,"suspended":false}},{"id":"7ad28a74-a492-4394-a053-656ed80e4c5a","user_id":"b73a5aff-c540-4ec0-8f7d-8be93fa153b6","agent_id":"d908766e-de40-4ac8-9ed9-73815bd5aa44","cluster_id":"d7907c25-0882-4d7a-a433-71d88c19c250","status_id":1,"accepted_at":"2022-03-01 14:08:44","created_at":"2022-03-01 12:54:50","agent":{"id":"d908766e-de40-4ac8-9ed9-73815bd5aa44","user_id":"b73a5aff-c540-4ec0-8f7d-8be93fa153b6","moni_id":null,"eligible_loan_id":"ae043ff0-7c1f-4625-9c4f-e62e8eb3b872","first_name":"Rich","middle_name":null,"last_name":"billion","nickname":"khaleesi","birth_date":"1993-11-10 00:00:00","gender":"female","business_name":"Tesla ","marital_status":"single","education":"graduate","house_address":"my house ","shop_address":"Westeros ","lga":"Ikeja","city":"in ogudu","state":"Lagos","country":null,"phone_number":"08012345678","email_address":"Benedicta@rank.africa","bvn":"12345678902","has_credit_history":1,"verified":1,"referral_link":"mDtmzksRyQTt","media_url":null,"channel":"Mobile","agent_repayment_rate":100,"bvn_verified_after":1,"loan_enabled":1,"status_id":1,"eligible_loan_modified_at":"2022-03-01 14:22:22","created_at":"2022-03-01 12:54:50",
"modified_at":"2022-03-01 18:42:31","cap_agent_loan":1,"loan_count":1,"recent_loan":{"id":"4daff718-aaad-4049-9b5d-351bed438a2a","agent_id":"d908766e-de40-4ac8-9ed9-73815bd5aa44","cluster_id":"d7907c25-0882-4d7a-a433-71d88c19c250","agent_loan_id":"991b1343-5500-4fbe-9b80-d9da8608fd98","loan_amount":100000,"created_at":"2022-03-01 18:01:24","agent_loan":{"id":"991b1343-5500-4fbe-9b80-d9da8608fd98","agent_id":"d908766e-de40-4ac8-9ed9-73815bd5aa44","agent_credit_score_id":"7591ff69-7bbf-48ce-9da6-9c19be34ff81","loan_id":"ae043ff0-7c1f-4625-9c4f-e62e8eb3b872","agent_card_id":"c7576e1e-88d8-4360-a713-81ee4b9e42aa","interest_type":"percentage","interest_value":1.25,"loan_duration_type":"day","loan_duration":5,"loan_due_date":"2022-02-27 23:59:59","days_past_due":0,"loan_amount":100000,"loan_amount_due":101750,"loan_interest_due":1250,"loan_payment_date":"2022-03-01 18:31:00","loan_payment_rate":100,"loan_amount_paid":101750,"penalty_outstanding":500,"penalty_paid":0,"principal_paid":0,"principal_outstanding":100000,"interest_paid":0,"interest_outstanding":1250,"penalty_amount":500,"loan_status":{"id":20,"name":"repaid","label":"Repaid","description":"Repaid item","created_at":"2022-02-27 05:32:24","modified_at":"2022-02-27 05:32:24"},"is_max":1,"status_id":4,"accept_terms":1,"created_at":"2022-02-23 18:01:24","modified_at":"2022-03-01 18:31:00","status":{"id":4,"name":"completed","label":"Completed","description":"Completed item","created_at":"2022-02-27 05:32:24","modified_at":"2022-02-27 05:32:24"}}},"suspended":false}},{"id":"82b34e0b-6711-4554-8157-ac8f8a328520","user_id":"1ee10a0e-d405-4e67-90b8-25c3b6c87eb2","agent_id":"e881e4f4-46d7-4473-8bc9-b6a4d2866dd8","cluster_id":"d7907c25-0882-4d7a-a433-71d88c19c250","status_id":1,"accepted_at":"2022-02-28 12:33:18","created_at":"2022-02-28 13:27:38","agent":{"id":"e881e4f4-46d7-4473-8bc9-b6a4d2866dd8","user_id":"1ee10a0e-d405-4e67-90b8-25c3b6c87eb2","moni_id":null,"eligible_loan_id":"ae043ff0-7c1f-4625-9c4f-e62e8eb3b872","first_name":"Komla","middle_name":"Asamoah","last_name":"Adzam","nickname":"Bellefull","birth_date":"1990-01-30 23:00:00","gender":"male","business_name":"Komla Empire","marital_status":"married","education":"masters","house_address":"Adzam House","shop_address":"24, Tampa street","lga":null,"city":null,"state":null,"country":null,"phone_number":"07052243402","email_address":"adzamkomla@gmail.com","bvn":"78787878787","has_credit_history":0,"verified":1,"referral_link":"nCQSfeo5cfUA","media_url":"https://res.cloudinary.com/https-cashtopup-co/image/upload/v1646146816/wcxptgryc1hh4rx5nj0q.jpg","channel":"Mobile","agent_repayment_rate":100,"bvn_verified_after":1,"loan_enabled":1,"status_id":1,"eligible_loan_modified_at":"2022-02-28 12:40:23","created_at":"2022-02-28 13:27:38","modified_at":"2022-03-01 16:00:16","cap_agent_loan":0,
"loan_count":1,"recent_loan":{"id":"bc76b177-7e52-41c0-b5e0-e215f4d075d0","agent_id":"e881e4f4-46d7-4473-8bc9-b6a4d2866dd8","cluster_id":"d7907c25-0882-4d7a-a433-71d88c19c250","agent_loan_id":"7bf4d4f1-51f6-433d-a763-0235bf65a584","loan_amount":100000,"created_at":"2022-03-01 10:45:23","agent_loan":{"id":"7bf4d4f1-51f6-433d-a763-0235bf65a584","agent_id":"e881e4f4-46d7-4473-8bc9-b6a4d2866dd8","agent_credit_score_id":"571f1783-c49e-4f3d-a022-4ec2191923e5","loan_id":"ae043ff0-7c1f-4625-9c4f-e62e8eb3b872","agent_card_id":"5e7db87a-de81-434e-b03e-ce55715d0f47","interest_type":"percentage","interest_value":1.25,"loan_duration_type":"day","loan_duration":5,"loan_due_date":"2022-02-27 23:59:59","days_past_due":0,"loan_amount":100000,"loan_amount_due":101750,"loan_interest_due":1250,"loan_payment_date":"2022-03-01 17:49:00","loan_payment_rate":100,"loan_amount_paid":101750,"penalty_outstanding":500,"penalty_paid":0,"principal_paid":0,"principal_outstanding":100000,"interest_paid":0,"interest_outstanding":1250,"penalty_amount":500,"loan_status":{"id":20,"name":"repaid","label":"Repaid","description":"Repaid item","created_at":"2022-02-27 05:32:24","modified_at":"2022-02-27 05:32:24"},"is_max":1,"status_id":4,"accept_terms":1,"created_at":"2022-02-23 10:45:23","modified_at":"2022-03-01 17:49:01","status":{"id":4,"name":"completed","label":"Completed","description":"Completed item","created_at":"2022-02-27 05:32:24","modified_at":"2022-02-27 05:32:24"}}},"suspended":false}},{"id":"8797e141-09e4-4d73-ab91-8178b691d4d0","user_id":"0ec16250-5154-4ec9-96e7-0c2832fc09ee","agent_id":"546e6020-3167-48ed-9657-7e43d5709124","cluster_id":"d7907c25-0882-4d7a-a433-71d88c19c250","status_id":1,"accepted_at":"2022-02-28 14:38:52","created_at":"2022-02-28 15:10:24","agent":{"id":"546e6020-3167-48ed-9657-7e43d5709124","user_id":"0ec16250-5154-4ec9-96e7-0c2832fc09ee","moni_id":null,"eligible_loan_id":null,"first_name":"Joseph","middle_name":null,"last_name":"Yobo","nickname":"jojo","birth_date":null,"gender":"female","business_name":null,"marital_status":null,"education":null,"house_address":null,"shop_address":"12 yobo street","lga":null,"city":null,"state":null,"country":null,"phone_number":"09022222222","email_address":"dej@yopmail.com","bvn":null,"has_credit_history":0,"verified":0,"referral_link":"ozrRz50WgaBI","media_url":null,"channel":"Mobile","agent_repayment_rate":100,"bvn_verified_after":0,"loan_enabled":1,"status_id":1,"eligible_loan_modified_at":null,"created_at":"2022-02-28 15:10:24","modified_at":"2022-02-28 15:10:24","cap_agent_loan":0,"loan_count":0,"recent_loan":null,"suspended":false}},{"id":"a5368708-e516-4c12-8067-26a12d7c4a35","user_id":"c2719e05-74e8-4554-bac6-3fbc84287ad0",
"agent_id":"d1d2f350-1a79-40c4-be39-341bb54bc28d","cluster_id":"d7907c25-0882-4d7a-a433-71d88c19c250","status_id":1,"accepted_at":"2022-02-28 10:55:56","created_at":"2022-02-28 10:55:56","agent":{"id":"d1d2f350-1a79-40c4-be39-341bb54bc28d","user_id":"c2719e05-74e8-4554-bac6-3fbc84287ad0","moni_id":null,"eligible_loan_id":"ae043ff0-7c1f-4625-9c4f-e62e8eb3b872","first_name":"Ayodeji","middle_name":"Samuel","last_name":"Ogundijo","nickname":"dej","birth_date":"1992-09-17 23:00:00","gender":"male","business_name":"Deji Group Of Companies","marital_status":"married","education":"phd","house_address":"His house","shop_address":"23, dej road","lga":null,"city":null,"state":null,"country":null,"phone_number":"09011111111","email_address":"samuel@yopmail.com","bvn":"36387837478","has_credit_history":0,"verified":1,"referral_link":"CjY7dQjARQq9","media_url":null,"channel":"Mobile","agent_repayment_rate":100,"bvn_verified_after":1,"loan_enabled":1,"status_id":1,"eligible_loan_modified_at":"2022-02-28 10:06:51",
"created_at":"2022-02-28 10:55:56","modified_at":"2022-02-28 11:06:51","cap_agent_loan":0,"loan_count":0,"recent_loan":null,"suspended":false}}]}}
''';
@GenerateMocks([http.Client])
void main() {
  group('fetchCluster', () {
    test('returns a Cluster if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client
          .get(Uri.parse(ApiRoutes.clusterAgentUrl)))
          .thenAnswer((_) async =>
          http.Response(response, 200));

      final repository = LoanRepository(client);

      final httpResponse =  await repository.getClusterAgents();

      final cluster = httpResponse[0];

      expect(httpResponse.length, 1);



      expect(cluster, isA<Cluster>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client
          .get(Uri.parse(ApiRoutes.clusterAgentUrl)))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      final repository = LoanRepository(client);

      expect(repository.getClusterAgents(), throwsException);
    });
  });
}