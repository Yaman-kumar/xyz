import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:xyz/app/data/categories.dart';
import 'package:xyz/app/modules/home/controllers/home_controller.dart';
import 'package:xyz/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:xyz/services/apicall.dart';
import 'package:xyz/services/utils.dart';

class WelcomeController extends GetxController {
  //TODO: Implement WelcomeController
  static WelcomeController get to => Get.find();
  var selectedList=[].obs;
  List<String> selectedListCategoriesId=[];
  var userdetails = userDeteails().obs;
  final count = 0.obs;
  var activeValue=0.obs;
 void updateActiveWelcome(index){
   if(!(selectedList).contains(index)){
     selectedList.add(index);
     selectedListCategoriesId.add((userdetails.value.categories?[index]!.Id).toString());

   }
   else{
     selectedList.remove(index);
     selectedListCategoriesId.remove((userdetails.value.categories?[index]!.Id).toString());

   }
   activeValue.value=index;


  }
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    Get.find<HomeController>().fetchUserData();
    print("WelcomeController init");

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  SignUpController signUpController = Get.find<SignUpController>();
  final FirebaseAuth Aauth = FirebaseAuth.instance;
  Rx<bool> loader=false.obs;

   postWelcomeData() async {
loader.value=true;
    
var body={
  "category":selectedListCategoriesId,
};
  final User? user = Aauth.currentUser;
  await signUpController.validateCreatetoken(user!);

    var response = await ApiCall().postDataWithHeaderandBody('/api/user/onboarding',jsonEncode(body));
   // fetchsubcatbycatid.value=fetchSubCategoriesByUsingCategoriesId.fromJson(response);
   print(response);
    loader.value=false;
  }
Rx<bool> welcomeCategories=false.obs;
  final categoriesLength=0.obs;
 Future<int> fetchCategories() async {
   welcomeCategories.value=true;
   /*final User? user = Aauth.currentUser;
   signUpController.validateCreatetoken(user!);*/
   final response = await http
       .get(Uri.parse('$prod/api/category'),);

   if (response.statusCode == 200) {
     // If the server did return a 200 OK response,
     // then parse the JSON.
     var value=jsonDecode(response.body);
     userdetails.value=userDeteails.fromJson(value);
     categoriesLength.value=userdetails.value.categories!.length;
     welcomeCategories.value=false;
     return 1;
    // return Album.fromJson(jsonDecode(response.body));
   } else {
     // If the server did not return a 200 OK response,
     // then throw an exception.
     throw Exception('Failed to load album');
   }
 }


}
