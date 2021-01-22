import 'package:gp_project/models/services.dart';

List<service> getProductByCategory(String kJackets, List<service> allproducts) {
  List<service> services = [];
  try {
    for (var service in allproducts) {
      if (service.servId == kJackets) {
        services.add(service);
      }
    }
  } on Error catch (ex) {
    print(ex);
  }
  return services;
}
