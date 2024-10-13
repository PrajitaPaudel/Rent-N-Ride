import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class VDamageController extends GetxController {
  // Define the list of categories
  List<String> damage = ["No Damage", " Minor Scratches", "Dents", "Cracked Windshield", "Broken Lights", "Engine Issues","Tire Damage","Interior Wear and Tear","Body Rust","Chassis Damage"];

  // This will hold the selected category
  var selectedDamage = "No Damage".obs;

  // Function to update the selected category
  void setSelectedDamage(String damage) {
    selectedDamage.value = damage;
  }
}

