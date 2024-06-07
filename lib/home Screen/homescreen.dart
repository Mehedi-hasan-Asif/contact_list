import 'package:contact_list/home%20Screen/layout.dart';
import 'package:contact_list/provider/contact_list_provider.dart';
import 'package:contact_list/utils/string.dart';
import 'package:contact_list/widgets/alertdialouge.dart';
import 'package:contact_list/widgets/contactlist.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _nameTEController;
  late final TextEditingController _phoneNumberTEController;
  late final GlobalKey<FormState> _formKey;
  late final ContactListProvider _contactListProvider;

  @override
  void initState() {
    _nameTEController = TextEditingController();
    _phoneNumberTEController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _contactListProvider =
        Provider.of<ContactListProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8.00),
          child: Column(
            children: [
              FormLayout(
                formKey: _formKey,
                nameTEController: _nameTEController,
                phoneNumberTEController: _phoneNumberTEController,
              ),
              const Gap(20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _contactListProvider.saveContactInformation(
                        _nameTEController.text,
                        _phoneNumberTEController.text,
                      );
                      _nameTEController.clear();
                      _phoneNumberTEController.clear();
                    }
                  },
                  child: const Text(contactAddButtonText),
                ),
              ),
              const Gap(50),
              ContactList(
                onTileTap: (int index) {
                  showDialog(
                    context: context,
                    builder: (context) => AppAlertDialog(
                      title: alertDialogTitle,
                      content: alertDialogContent,
                      deleteItem: () {
                        _contactListProvider.deleteContactInformation(index);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _phoneNumberTEController.dispose();
    _contactListProvider.dispose();
    super.dispose();
  }
}