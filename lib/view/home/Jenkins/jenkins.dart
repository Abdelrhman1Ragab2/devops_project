

import 'package:flutter/material.dart';
import 'package:network/model/connection.dart';

import '../../../core/widget/text_block.dart';
import '../../../core/widget/tool_logo.dart';


class Jenkins extends StatefulWidget {
  const Jenkins({Key? key}) : super(key: key);
  static const routeName = "Jenkins";

  @override
  State<Jenkins> createState() => _JenkinsState();
}

class _JenkinsState extends State<Jenkins> {
  List<Connection>connections=[];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Jenkins"),
          centerTitle: true,
        ),
        body: buildBody(context));
  }


  Widget buildBody(BuildContext context){
    return   const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topRight,
              child: ToolLogo(image: "assets/images/jenkinss.jpg")),
          TextBlock(
              title: "Jenkins",
              description: """
              Jenkins is an open-source automation server widely used in the DevOps domain for building, testing, and deploying software projects. It provides a robust platform for continuous integration (CI) and continuous delivery (CD), enabling teams to automate various stages of the software development lifecycle. Here is a description of Jenkins, along with information on how to install it, how it can help DevOps engineers, and how to use Jenkinsfile to automate software.                  
             
             
              With Jenkins, developers can set up pipelines to automate the entire software delivery process. It supports version control systems like Git and Subversion, build tools such as Maven and Gradle, and testing frameworks like JUnit and Selenium. Jenkins offers a web-based interface and a flexible configuration system, making it easy to configure and customize pipelines to fit specific project requirements.   
                 
                  """),
          SizedBox(height: 25,),
          TextBlock(title: "Installing Jenkins",
              description: """
              
             To install Jenkins, you can follow these general steps:
a. Check system requirements: Ensure that your system meets the necessary requirements, such as having Java Development Kit (JDK) installed.

b. Download and install Jenkins: Visit the official Jenkins website (https://www.jenkins.io) and download the appropriate installer for your operating system. Follow the installation instructions provided for your specific platform.

c. Start Jenkins: Once the installation is complete, start the Jenkins service using the provided instructions. Jenkins usually runs on port 8080 by default.

d. Access Jenkins web interface: Open a web browser and navigate to http://localhost:8080 (or the appropriate IP address if Jenkins is installed on a remote server). Follow the on-screen instructions to complete the initial setup and unlock Jenkins.

e. Install recommended plugins: During the initial setup, Jenkins will provide an option to install recommended plugins. It is advisable to install these plugins as they offer essential functionality for Jenkins.

f. Create an administrative user: Set up an administrative user account to secure your Jenkins installation by providing a username and password.

g. Configure Jenkins: Customize Jenkins settings as per your requirements, including configuring system-wide settings, setting up access controls, and configuring global tools. """),
          SizedBox(height: 25,),

          TextBlock(title: "Jenkins & DevOps Engineers", description: """
         Jenkins offers several benefits to DevOps engineers:
a. Continuous Integration (CI): Jenkins helps automate the process of integrating code changes from multiple developers into a shared repository. It can trigger builds automatically whenever changes are committed, enabling early detection of integration issues.

b. Continuous Delivery (CD): Jenkins supports the automation of various stages of the software delivery pipeline, including building, testing, and deploying applications. It allows for the seamless and efficient delivery of software to production environments.

c. Pipeline as Code: Jenkins provides a powerful feature called Jenkinsfile, which allows DevOps engineers to define the entire software delivery pipeline as code. This declarative syntax-based approach makes it easier to version control, review, and manage pipeline configurations.

d. Extensibility and Integration: Jenkins has a vast ecosystem of plugins that can be integrated with various tools and technologies. DevOps engineers can leverage these plugins to extend Jenkins' capabilities and integrate it with their preferred tools for version control, testing, deployment, and monitoring.

e. Scalability and Distributed Builds: Jenkins supports distributed builds, allowing DevOps engineers to set up a scalable infrastructure for running builds across multiple machines, reducing build times and increasing efficiency.

"""),
          SizedBox(height: 25,),

          TextBlock(title: "Jenkinsfile", description: """
          Jenkinsfile :
Jenkinsfile is a text file written in Groovy syntax that defines the entire software delivery pipeline in Jenkins. It allows DevOps engineers to define stages, steps, and conditions for each stage of the pipeline. Here's an overview of how to use Jenkinsfile:
a. Create Jenkinsfile: Create a file named "Jenkinsfile" in the root directory of your project. This file will define the pipeline.

b. Define stages and steps: Inside the Jenkinsfile, define the stages that make up your pipeline. Each stage can have multiple steps, such as checking out code from version control, building, testing, and deploying.

c. Configure agents: Specify the agent or agents on which the pipeline should run. Agents can be defined to run on specific machines or in a distributed environment.

d. Use Jenkins DSL: Jenkins provides a domain-specific language (DSL) that allows you to define pipeline steps and conditions. Utilize this DSL to configure each stage and step of your pipeline.

e. Version control and run pipeline: Store the Jenkinsfile in your version control system and configure Jenkins to monitor the repository for changes. Jenkins will automatically detect changes, pull the Jenkinsfile, and execute the pipeline as defined.

f. Monitor and troubleshoot: Jenkins provides a web-based interface to monitor the progress and status of pipeline runs. If any issues arise, Jenkins logs and console output can help identify and troubleshoot problems.

By leveraging Jenkinsfile, DevOps engineers can achieve automationand standardization of their software delivery pipelines, enabling reliable, reproducible, and efficient software deployments.""")
        ],
      ),
    );

  }
}
