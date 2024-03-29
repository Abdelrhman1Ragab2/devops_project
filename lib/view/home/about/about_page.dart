import 'package:flutter/material.dart';

import '../../../model/data.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  static const routeName = "AboutPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("about us "),
          centerTitle: true,
        ),
        body: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            aboutUsPart(context),
            const SizedBox(height: 25,),
            infoPart(context),
            const SizedBox(height: 25,),
            objectivePart(context)
          ],
        ),
      ),
    );
  }
  Widget infoPart(BuildContext context){
    return SizedBox(
      height: 250,
      child: ListView.separated(
        shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index)=>infoPartBody(context,dataName[index],dataImage[index]),
          separatorBuilder: (context,index)=>const SizedBox(width: 20,), itemCount: 4),
    );
  }

  Widget infoPartBody(BuildContext context,String name,String path) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [


         Image.asset(path,fit: BoxFit.cover,
         width: 200,height: 200,),

         TextButton(onPressed: (){

        }
        , child:  Text(name,
           style: TextStyle(
             color: Theme.of(context).secondaryHeaderColor,
             fontSize: 20

           ),),),

      ],
    );
  }

  Widget aboutUsPart(BuildContext context){
    return  Container(
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("About Us",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 18,),
          Text(
              """
              We are a group of DevOps engineers who have participated in the NTI initiative. Our team is dedicated to advancing our skills and knowledge in various technologies related to DevOps practices. As part of our initiative, we have embarked on a project to install Jenkins on CentOS, automate its deployment, and develop a web application using Jenkins for continuous integration and deployment.

          Our website serves as a platform to showcase our team and project. We aim to provide insights into the technologies and practices we are passionate about, including Linux, Bash Scripting, Docker, Kubernetes, Agile Methodologies, Python Programming, Jenkins, Amazon Web Services (AWS), Ansible, and Terraform. Through our project, we hope to demonstrate the importance and benefits of these technologies in modern software development and DevOps culture."""""
                  ,
            style:TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w300
          ),),
        ],
      ),
    );
  }
  Widget objectivePart(BuildContext context){
    return  Container(
      color: Colors.black87.withOpacity(0.8),
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Project Objective",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 18,),
          Text("Our objective is to create a promotional website for each part of the NTI initiative, highlighting key technologies and concepts such as Linux, Bash Scripting, Docker, Kubernetes, Agile Methodology, Python Programming, Jenkins, Amazon Web Services (AWS), Ansible, and Terraform. The website will serve as an informational platform to showcase the importance and applications of these technologies in modern software development and DevOps practices. Through engaging content and interactive features, we aim to educate and inspire individuals interested in advancing their skills in these areas, ultimately contributing to the growth and success of the tech community.",
          style:TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w300
          ),),
        ],
      ),
    );
  }
}
