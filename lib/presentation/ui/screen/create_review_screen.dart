import 'dart:ffi';

import 'package:flutter/material.dart';

class CreateReview extends StatefulWidget {
  const CreateReview({super.key});

  @override
  State<CreateReview> createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create review'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'First Name'
                  ),
                ),
                const SizedBox( height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Last Name'
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  maxLines: 8,
                  decoration: const InputDecoration(
                      hintText: 'Write your review',
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16)
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){},
                      child: const Text('Submit')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
