//  TEST 2 
//  PROGRAMMEUR : VOTRE NOM

import 'package:flutter/material.dart';

class AddGarageSale extends StatefulWidget {

  const AddGarageSale({super.key});

  @override
  AddGarageSaleState createState() => AddGarageSaleState();
}

class AddGarageSaleState extends State<AddGarageSale>{

  final _formKey = GlobalKey<FormState>();
  final Map<String, String> garagesaleData = {};



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add GarageSale')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                onSaved: (value) => garagesaleData['location'] = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Date'),
                onSaved: (value) => garagesaleData['date'] = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Start Time'),
                onSaved: (value) => garagesaleData['startTime'] = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'End Time'),
                onSaved: (value) => garagesaleData['endTime'] = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Category'),
                onSaved: (value) => garagesaleData['category'] = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Items (Notes)'),
                maxLines: 3,
                onSaved: (value) => garagesaleData['notes'] = value ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  Navigator.pop(context, garagesaleData);
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
