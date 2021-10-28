import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  //Instance of get storage
  final box = GetStorage();

  //Store user details
  storeUserCredentials({
    required String userid,
    required String fullname,
    required String password,
    required String username,
    required String contactnumber,
  }) {
    print("storeUserCredentials");
    box.write('userid', userid);
    box.write('fullname', fullname);
    box.write('password', password);
    box.write('username', username);
    box.write('contactnumber', contactnumber);
    printDetails();
  }

  //Print details
  void printDetails() {
    print("printDetails");
    print("userid ${box.read('userid')}");
    print("fullname ${box.read('fullname')}");
    print("password ${box.read('password')}");
    print("username ${box.read('username')}");
    print("contactnumber ${box.read('contactnumber')}");
  }

  removeData() {
    box.remove('userid');
    box.remove('fullname');
    box.remove('password');
    box.remove('username');
    box.remove('uscontactnumbererid');
  }
}
