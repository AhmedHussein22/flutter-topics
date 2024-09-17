import 'package:flutter/material.dart';

class StateRestoration extends StatefulWidget {
  const StateRestoration({super.key});

  @override
  StateRestorationState createState() => StateRestorationState();
}

class StateRestorationState extends State<StateRestoration> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keep Alive in Tabs'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Personal Info'),
            Tab(text: 'Contact Details'),
            Tab(text: 'Preferences'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          PersonalInfoTab(),
          ContactDetailsTab(),
          PreferencesTab(),
        ],
      ),
    );
  }
}

class PersonalInfoTab extends StatefulWidget {
  const PersonalInfoTab({super.key});

  @override
  PersonalInfoTabState createState() => PersonalInfoTabState();
}

class PersonalInfoTabState extends State<PersonalInfoTab> with AutomaticKeepAliveClientMixin {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: _ageController,
            decoration: const InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }
}

class ContactDetailsTab extends StatefulWidget {
  const ContactDetailsTab({super.key});

  @override
  ContactDetailsTabState createState() => ContactDetailsTabState();
}

class ContactDetailsTabState extends State<ContactDetailsTab> with AutomaticKeepAliveClientMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: 'Phone Number'),
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}

class PreferencesTab extends StatefulWidget {
  const PreferencesTab({super.key});

  @override
  PreferencesTabState createState() => PreferencesTabState();
}

class PreferencesTabState extends State<PreferencesTab> with AutomaticKeepAliveClientMixin {
  bool _receiveNewsletter = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SwitchListTile(
            title: const Text('Receive Newsletter'),
            value: _receiveNewsletter,
            onChanged: (bool value) {
              setState(() {
                _receiveNewsletter = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
