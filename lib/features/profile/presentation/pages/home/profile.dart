import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Profile extends HookWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          const Text(
            'Fill Your Profile',
            style: TextStyle(fontSize: 30),
          ),
          const Center(
            child: Text(
              "Don't worry, you can change it later, or you can skip it for now.",
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const CircleAvatar(
            radius: 70,
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.account_circle,
              size: 130,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              suffixIcon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              hintText: 'Name',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              suffixIcon: Icon(
                Icons.alternate_email,
                color: Colors.grey,
              ),
              hintText: 'Nickname',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              suffixIcon: Icon(
                Icons.email,
                color: Colors.grey,
              ),
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          IntlPhoneField(
              initialCountryCode: 'CO',
              decoration: const InputDecoration(
                hintText: 'Phone Number',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              languageCode: "en",
              disableLengthCheck: true,
              onChanged: (phone) {},
              onCountryChanged: (country) {},
              pickerDialogStyle: PickerDialogStyle(
                  width: double.infinity,
                  listTileDivider: const Divider(),
                  backgroundColor: Colors.white,
                  listTilePadding: EdgeInsets.zero,
                  padding: const EdgeInsets.all(32),
                  searchFieldInputDecoration: const InputDecoration(
                    hintText: 'Search country',
                    hintStyle: TextStyle(color: Colors.grey),
                  ))),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Skip'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Star'))),
            ],
          )
        ],
      ),
    )));
  }
}
