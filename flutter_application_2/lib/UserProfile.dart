import 'package:flutter/material.dart';
import 'package:flutter_application_2/User.dart';

class UserProfile extends StatefulWidget {
  final User user;
  final void Function(User) onUserUpdated;

  UserProfile({required this.user, required this.onUserUpdated});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _formKey = GlobalKey<FormState>();
  late String _name, _surname, _birthDate;
  int _age = 0;

  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
    _surname = widget.user.surname;
    _age = widget.user.age;
    _birthDate = widget.user.birthDate.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_picture.png'),
            ),
            SizedBox(height: 16),
            Text('Name: ${widget.user.fullName}'),
            Text('Age: ${widget.user.age}'),
            Text('Birth Date: ${widget.user.birthDate}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Edit Profile'),
                      content: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              initialValue: _name,
                              decoration: InputDecoration(labelText: 'Name'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a name';
                                }
                                return null;
                              },
                              onSaved: (value) => _name = value!,
                            ),
                            TextFormField(
                              initialValue: _surname,
                              decoration: InputDecoration(labelText: 'Surname'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a surname';
                                }
                                return null;
                              },
                              onSaved: (value) => _surname = value!,
                            ),
                            TextFormField(
                              initialValue: _birthDate,
                              decoration:
                                  InputDecoration(labelText: 'Birth Date'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a birth date';
                                }
                                return null;
                              },
                              onSaved: (value) => _birthDate = value!,
                            ),
                            TextFormField(
                              initialValue: _age.toString(),
                              decoration: InputDecoration(labelText: 'Age'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an age';
                                }
                                if (int.tryParse(value) == null) {
                                  return 'Please enter a valid age';
                                }
                                return null;
                              },
                              onSaved: (value) => _age = int.parse(value!),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              setState(() {
                                User updatedUser = User(
                                  name: _name,
                                  surname: _surname,
                                  age: _age,
                                  birthDate: DateTime.parse(_birthDate),
                                );
                                widget.onUserUpdated(updatedUser);
                              });
                              Navigator.pop(context);
                            }
                          },
                          child: Text('Save'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
