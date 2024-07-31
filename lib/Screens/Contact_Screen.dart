import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Widgets/CustomAppBarDrawer.dart';
import '../Widgets/CustomBackgroundImage.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _subjectController = TextEditingController();

  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final email = _emailController.text;
      final subject = _subjectController.text;
      final message = _messageController.text;

      final mailtoUrl = Uri(
        scheme: 'mailto',
        path: 'mdalopi@gmail.com',
        query: 'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent('Name: $name\nEmail: $email\n\n$message')}',
      );

      if (await canLaunch(mailtoUrl.toString())) {
        await launch(mailtoUrl.toString());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch email client')),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomBackgroundimage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("Contact"),
          ),
          drawer: const CustomAppBarDrawer(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Contact us",style: GoogleFonts.robotoSlab(textStyle: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold
                          ),)),
                          const ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.email, color: Colors.orange,),
                            title: Text("E-mail us:",style: TextStyle(
                              color: Colors.grey
                            ),),
                            subtitle: Text("youremail@gmail.com",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                            ),),
                          ),
                          const ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.call, color: Colors.orange,),
                            title: Text("Call us:",style: TextStyle(
                                color: Colors.grey
                            ),),
                            subtitle: Text("+123 456 789",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Or Write us",style: GoogleFonts.robotoSlab(textStyle: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold
                          ),)),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _messageController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                hintText: 'Your Message...'),
                            maxLines: 4,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your message';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: _submitForm,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Center(
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Church Location",style: GoogleFonts.robotoSlab(textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),)),
                              TextButton(
                                onPressed: (){
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Get Direction'),
                                    ),
                                  );
                                },
                                child: Text("Get Direction",style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold
                                ),),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text("10007,	United States,	New York.	New York",style: TextStyle(
                            fontSize: 17,
                          ),),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: (){
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Opening Google Map'),
                                ),
                              );
                            },
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                child: Image.asset("Assets/churchlocation.png")),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
