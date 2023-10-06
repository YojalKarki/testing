import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const CircleAvatar(
                radius: 53,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/images/blank-profile-picture-973460_1280.webp'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Address',
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Abc Education Consultancy Pvt.Ltd',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade400)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Consultancy Email',
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Abc Education Consultancy Pvt.Ltd',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade400)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Phone Number',
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '9800000000',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade400)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Mobile Number',
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '9800000000',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade400)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Country',
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Australia',
                    suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade400)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'services',
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'PTE,IELTS,TOEFl',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade400)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Website Link',
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'abcconsultancy.com',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade400)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Ios app Link',
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'abcconsultancy.com',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade400)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Android app Link',
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'abcconsultancy.com',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade400)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'About us',
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText:
                        'Lorem ipsum dolor sit amet consectetur.Platea \n aliquet pulvinar blandit facilisis swd.Massa aliquet justo leo nisi.Nam accumsan pretium sagitis cursus ac margins ut.Lorem ipsum dolor sit amet consectetur',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade400)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Map',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.blue,
                    fontSize: 24),
              ),
              SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.all(6),
                child: Text(
                  'Latitude (Map)',
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter values between -90 to 90',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade400)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(6),
                child: Text(
                  'Longitude (Map)',
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter values between -180 to 180',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade400)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
