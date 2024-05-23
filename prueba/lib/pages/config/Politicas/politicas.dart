import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Politicas extends StatefulWidget {
  const Politicas({super.key});

  @override
  State<Politicas> createState() => _PoliticasState();
}

class _PoliticasState extends State<Politicas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: principal(),
      )),
    );
  }

  Column principal() {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Center(
          child: FittedBox(
            child: Text(
              'Politicas de privacidad',
              style: TextStyle(fontFamily: 'Inter', fontSize: 25),
            ),
          ),
        ),
        buttonregreso(),
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
            width: 350,
            height: 800,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Privacy Policy\nLast Updated On 08-May-2024\nEffective Date 07-May-2024\n\nThis Privacy Policy describes the policies of Gang of five, C. Río Mocorito 507, Ex-Ejido Coahuila, 21360 Mexicali, B.C., '
                    'Baja california norte 21360, Mexico, email: gangoffive@gmai.com, phone: 6863076580'
                    ' on the collection, use and disclosure of your information that we collect when you use our website ( https://gangoffive.com/home ). '
                    '(the “Service”). By accessing or using the Service, you are consenting to the collection, use and disclosure of your information in accordance with this Privacy Policy. If you do not consent to the '
                    'same, please do not access or use the Service. We may modify this Privacy Policy at any time without any prior notice to you and will post the revised Privacy Policy on the Service. The revised Policy '
                    'will be effective 180 days from when the revised Policy is posted in the Service and your continued access or use of the Service after such time will constitute your acceptance of the revised Privacy '
                    'Policy. We therefore recommend that you periodically review this page. ',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                  ),
                  Text(
                    '\nInformation We Collect:\nWe will collect and process the following personal information about you: ',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                  ),
                  Text(
                    '\nName\nEmail\nMobile\nPayment Info',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                  ),
                  Text(
                    '\nHow We Use Your Information:\nWe will use the information that we collect about you for the following purposes: ',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                  ),
                  Text(
                    '\nMarketing/ Promotional\nCreating user account\nTestimonials'
                    '\nTargeted advertising\nIf we want to use your information for any '
                    'other purpose, we will ask you for consent and will use your information only on '
                    'receiving your consent and then, only for the purpose(s) for which grant consent unless'
                    ' we are required to do otherwise by law. ',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                  ),
                  Text(
                    '\nRetention Of Your Information:\nWe will retain your personal information with us for 90 '
                    'days to 2 years after user terminate account or for as long as we need it to fulfill the purposes '
                    'for which it was collected as detailed in this Privacy Policy. We may need to retain certain information '
                    'for longer periods such as record-keeping / reporting in accordance with applicable law or for other legitimate '
                    'reasons like enforcement of legal rights, fraud prevention, etc. Residual anonymous information and aggregate '
                    'information, neither of which identifies you (directly or indirectly), may be stored indefinitely.',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                  ),
                  Text(
                    '\nYour Rights:\nDepending on the law that applies, you may have a right to access and rectify or '
                    'erase your personal data or receive a copy of your personal data, restrict or object to the active '
                    'processing of your data, ask us to share (port) your personal information to another entity, '
                    'withdraw any consent you provided to us to process your data, a right to lodge a complaint with a statutory '
                    'authority and such other rights as may be relevant under applicable laws. To exercise these rights, you can '
                    'write to us at gangoffive@gmai.com. We will respond to your request in accordance with applicable law. Do note that '
                    'if you do not allow us to collect or process the required personal information or withdraw the consent to process the '
                    'same for the required purposes, you may not be able to access or use the services for which your information was sought.',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                  ),
                  Text(
                    '\nCookies Etc.\nTo learn more about how we use these and your choices in relation to these '
                    'tracking technologies, please refer to our Cookie Policy. ',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                  ),
                  Text(
                    '\nSecurity:\nThe security of your information is important to us and we will use reasonable '
                    'security measures to prevent the loss, misuse or unauthorized alteration of your information under '
                    'our control. However, given the inherent risks, we cannot guarantee absolute security and '
                    'consequently, we cannot ensure or warrant the security of any information you transmit to us and '
                    'you do so at your own risk. ',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                  ),
                  Text(
                    '\nGrievance / Data Protection Officer:\nIf you have any queries or concerns about the processing of '
                    'your information that is available with us, you may email our Grievance Officer at gang of five, C. '
                    'Río Mocorito 507, Ex-Ejido Coahuila, 21360 Mexicali, B.C., email: gangoffive@gmai.com. We will '
                    'address your concerns in accordance with applicable law. ',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget buttonregreso() {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: FloatingActionButton(
            heroTag: 'back',
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
            elevation: 0,
            child: Image.asset('assets/arrow-back.png'),
          ),
        ),
      ],
    );
  }
  
  @override
  void dispose(){
    super.dispose();
  }
}
