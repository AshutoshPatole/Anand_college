import 'package:anand_college/Screens/courseDetails.dart';
import 'package:anand_college/models/loginModels.dart';
import 'package:anand_college/models/userInfo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final departmentList = ['CSE', 'MECH', 'EEE', 'CHEM', 'BioTech', 'IT'];
  final departmentPictures = [
    'https://image.freepik.com/free-vector/network-gadget-set_1284-10695.jpg',
    'https://image.freepik.com/free-vector/mechanic-background-design_1322-73.jpg',
    'https://image.freepik.com/free-vector/electricity-icons-set_1284-4535.jpg',
    'https://image.freepik.com/free-vector/science-experiments-test-tubes_23-2147491132.jpg?1',
    'https://image.freepik.com/free-vector/biotechnology-logo_23-2147508563.jpg',
    'https://image.freepik.com/free-vector/it-specialists-upgrading-operating-system-illustration_1262-18941.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LoginModels>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome,',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              Text(
                user.userName ?? ' ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Please select a course'),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 10),
                itemCount: departmentList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      final userinfo =
                          Provider.of<UserInfo>(context, listen: false);
                      userinfo.setEmail(user?.user?.email);
                      userinfo.setName(user.userName);
                      userinfo.setPhone(user.phoneNumber);
                      userinfo.setCourseID(departmentList[index]);
                      userinfo.setAge(user.age);
                      userinfo.setCaste(user.caste);
                      userinfo.setDOB(user.dob);
                      userinfo.setFatherName(user.father);
                      userinfo.setNationality(user.nationality);
                      userinfo.setReligion(user.religion);
                      userinfo.setSEX(user.sex);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CourseDetails(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            child: CachedNetworkImage(
                              imageUrl: departmentPictures[index],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            departmentList[index],
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
