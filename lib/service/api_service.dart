import 'dart:convert';
import 'package:currency_app/constants/constants.dart';
import 'package:currency_app/model/currencymodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Currencymodel>> getLatest(String baseCurrrency) async {
    List<Currencymodel> currencyModelList = [];
    String url =
       '${base_url}apikey=$apiKey&base_currency=$baseCurrrency';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        Map<String, dynamic> body = json['data'];

        body.forEach((key, value) {
          Currencymodel currencyModel = Currencymodel.fromJson(value);
          currencyModelList.add(currencyModel);
        });
        return currencyModelList;
      } else {
        return [];
      }
    } catch (e) {

      throw e.toString();
    }
  }

  Future<List<Currencymodel>> getExchage(String baseCurrrency,
      String targetCurrency) async {
    List<Currencymodel> currencyModelList = [];
    String url =
        '${base_url}apikey=$apiKey&base_currency=$baseCurrrency&currencies=$targetCurrency';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        Map<String, dynamic> body = json['data'];

        body.forEach((key, value) {
          Currencymodel currencyModel = Currencymodel.fromJson(value);
          currencyModelList.add(currencyModel);
        });
        return currencyModelList;
      } else {
        return [];
      }
    } catch (e) {
      throw e.toString();
    }
  }












     }






















