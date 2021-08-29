import 'package:deletedvgtv/services/api_services.dart';
import 'package:deletedvgtv/utils/constants.dart';
import 'package:flutter/material.dart';

Future<void> setApplicationAdd(applicationModal, context) async {
  UserAPIServices apiServices = new UserAPIServices();
  apiServices
      .applicationAdd(
    applicationModal,
    applicationAPI + 'create',
  )
      .then((response) async {
    print('ResponseCode: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      // var data = RegisterResponseModal.fromJson(json.decode(response.bodt));
      // var sp = await SharedPreferences.getInstance();
      //sp.setString("name", data.name.toString());
      // sp.setString("user_email", data.email.toString());

      final snackBar = SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "Bu ilan için başvurunuz alındı. Detayları Başvurularım sayfasından görebilirsiniz.",
          style: TextStyle(fontFamily: 'Nunito'),
        ),
        action: SnackBarAction(
          textColor: Color(0xffffffff),
          label: 'Tamam',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text('İlana Başvuru sırasında bir hata oluştu'),
        action: SnackBarAction(
          textColor: Color(0xffffffff),
          label: 'Tamam',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  });
}
