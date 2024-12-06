import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'next_page.dart';

class AutofillGroupExample extends StatelessWidget {
  const AutofillGroupExample({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('AutofillGroup Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // **********  Wrap the form with AutofillGroup **********
        child: AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login Form',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // **********  Email TextFormField **********
              TextFormField(
                controller: emailController,
                focusNode: FocusScopeNode(),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                // **********  Set the autofillHints to email **********
                autofillHints: const [AutofillHints.email],
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 20),
              // **********  Password TextFormField **********
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                // **********  Set the autofillHints to password **********
                autofillHints: const [AutofillHints.password],
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  // Finish the autofill context to save the credentials
                  TextInput.finishAutofillContext();
                  // Navigate to the next page with the saved email and password
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NextPage(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    ),
                  );
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
