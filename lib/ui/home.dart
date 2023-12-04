import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_picker_dropdown.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:currency_app/constants/all_currency_listitem.dart';
import 'package:currency_app/model/currencymodel.dart';
import 'package:currency_app/service/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();

  String _selectedCurrency = "USD";

  Widget _dropDownItem(Country country) => Container(
        child: Row(
          children: [
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(
              width: 8,
            ),
            Text('${country.currencyName}')
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            "Base Currency ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 2),
          )),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: CountryPickerDropdown(
              initialValue: 'us',
              itemBuilder: _dropDownItem,
              onValuePicked: (Country? country) {
                setState(() {
                  _selectedCurrency = country?.currencyCode ?? "";
                });
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            "All Currency ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 2),
          )),
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: apiService.getLatest(_selectedCurrency),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Currencymodel> currencyModel = snapshot.data ?? [];

                  return Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return AllCurrencyListItem(
                        currencymodel: currencyModel[index],
                      );
                    },
                    itemCount: currencyModel.length,
                  ));
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error occured',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ],
      ),
    );
  }
}
