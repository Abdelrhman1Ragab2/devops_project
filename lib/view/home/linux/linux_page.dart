

import 'package:flutter/material.dart';
import 'package:network/model/connection.dart';

import '../../../core/widget/text_block.dart';
import '../../../core/widget/tool_logo.dart';


class Linux extends StatefulWidget {
  const Linux({Key? key}) : super(key: key);
  static const routeName = "Linux";

  @override
  State<Linux> createState() => _LinuxState();
}

class _LinuxState extends State<Linux> {
List<Connection>connections=[];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Linux"),
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
              child: ToolLogo(image: "assets/images/Linux1.jpg")),
          TextBlock(
              title: "Linux",
              description: "Linux is an operating system kernel created by Linus Torvalds in 1991. It forms the foundation of many Linux distributions, such as Ubuntu, Fedora, Debian, and CentOS. Linux is based on the Unix operating system and is designed to be free and open-source, allowing users to modify and distribute it as per their needs. It provides a robust, multitasking, and multi-user environment.\n\n"
                  "Linux supports a wide range of hardware architectures and offers a command-line interface (CLI) along with graphical user interfaces (GUIs) like GNOME and KDE. It is highly customizable, with numerous software packages available through package managers. Linux distributions are widely used in servers, supercomputers, embedded systems, and personal computers"),

          SizedBox(height: 25,),
          TextBlock(title: "Installing Linux",
              description: """
              
              To install Linux, you need to follow these general steps:
a. Choose a Linux distribution: Select the distribution that suits your requirements. Popular choices include Ubuntu, Fedora, and CentOS.

b. Download the ISO image: Visit the official website of the chosen distribution and download the ISO image corresponding to your system architecture.

c. Create a bootable medium: Burn the ISO image to a DVD or create a bootable USB drive using software like Rufus or Etcher.

d. Boot from the installation medium: Insert the DVD or plug in the USB drive and restart your computer. Configure the boot order in the BIOS settings to boot from the installation medium.

e. Follow the installation wizard: The installation process varies depending on the distribution, but generally, you'll be asked to choose the installation type, disk partitioning, and create user accounts.

f. Complete the installation: After the installation process is finished, restart your computer, and you'll have Linux installed.
              """),
          SizedBox(height: 25,),

          TextBlock(title: "Linux & DevOps Engineers", description: """
          Linux plays a crucial role in the field of DevOps. Here are some ways it can help DevOps engineers:
a. Infrastructure Management: Linux provides a stable and reliable platform for managing infrastructure, including servers, networking devices, and virtual machines.

b. Automation and Scripting: DevOps engineers often use Linux's command-line interface and scripting capabilities to automate tasks, manage configurations, and deploy applications.

c. Containerization and Orchestration: Linux-based technologies like Docker and Kubernetes are widely used in DevOps for containerization and orchestration of applications, enabling efficient deployment and scalability.

d. Monitoring and Logging: Linux offers various tools and utilities for monitoring system performance, analyzing logs, and troubleshooting issues, helping DevOps engineers ensure optimal system operation.

e. Security and Access Control: Linux provides robust security features, including user management, file permissions, and firewalls, allowing DevOps engineers to maintain a secure environment for applications and data.
          """),
          SizedBox(height: 25,),

          TextBlock(title: "Important Topics in Linux", description: """
          While Linux is a vast topic, some important areas worth exploring for DevOps engineers include:
a. Command-Line Interface (CLI): Understanding essential command-line tools, shell scripting, and command-line utilities is crucial for efficient system administration and automation.

b. File System Hierarchy: Familiarize yourself with the Linux file system structure, including directories like /etc, /bin, /sbin, /usr, and /var, to understand how configuration files and system components are organized.

c. Package Management: Learn about package managers like apt, yum, and dnf, used for installing, updating, and managing software packages in Linux distributions.

d. Networking and Security: Gain knowledge about networking concepts, IP addressing, firewall configuration, and securing Linux systems to ensure smooth operations and protect against potential threats.

e. System Monitoring and Performance: Explore tools like top, vmstat, sar, and Grafana to monitor system performance, identify bottlenecks, and optimize resource usage.

f. Shell Scripting and Automation: Develop skills in shell scripting using languages like Bash to automate repetitive tasks, system administration, and application deployment.

Remember, Linux is a vast ecosystem, and continuous learning and exploration are essential to becoming proficient in leveraging its capabilities for DevOps engineering.
          """)
        ],
      ),
    );

  }
}
