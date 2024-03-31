

import 'package:flutter/material.dart';
import 'package:network/model/connection.dart';

import '../../../core/widget/text_block.dart';
import '../../../core/widget/tool_logo.dart';


class Python extends StatelessWidget {
  const Python({Key? key}) : super(key: key);
  static const routeName = "Jenkins";

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
              child: ToolLogo(image: "assets/images/pythons.jpg")),
          TextBlock(
              title: "Python",
              description: """
              Python was created by Guido van Rossum and first released in 1991. It emphasizes code readability and follows a clear, expressive syntax that makes it easy to learn and understand. Python supports multiple programming paradigms, including procedural, object-oriented, and functional programming. It offers a vast standard library and a rich ecosystem of third-party packages, making it suitable for a wide range of applications.

7Python's versatility and simplicity make it a preferred choice for many developers. It has extensive support for various platforms and operating systems, including Linux, macOS, and Windows. Python is an interpreted language, which means that code is executed line by line by an interpreter, making it highly interactive and suitable for scripting and rapid prototyping."""),
          SizedBox(height: 25,),
          TextBlock(title: "Installing Python and Jupyter",
              description: """
              
To install Python and Jupyter, you can follow these general steps:
a. Download Python: Visit the official Python website (https://www.python.org) and download the appropriate installer for your operating system. Choose the latest stable version of Python (e.g., Python 3.x).

b. Run the installer: Execute the downloaded installer, and follow the installation wizard. Make sure to check the option to add Python to the system PATH during the installation process.

c. Verify the installation: Open a command prompt or terminal and type python --version to check if Python is properly installed. It should display the installed Python version.

d. Installing Jupyter: After installing Python, you can install Jupyter using pip, the Python package installer. Open a command prompt or terminal and run the command pip install jupyter. This will download and install Jupyter along with its dependencies.

e. Launch Jupyter: Once Jupyter is installed, you can start it by running the command jupyter notebook in the command prompt or terminal. This will open the Jupyter Notebook interface in your web browser.

"""),
          SizedBox(height: 25,),

          TextBlock(title: "  Python & DevOps Engineers", description: """
        
Python offers several benefits for DevOps engineers:

a. Automation: Python's simplicity and extensive standard library make it ideal for automating tasks. DevOps engineers can write Python scripts to automate various processes such as server provisioning, deployment, and configuration management.

b. Infrastructure as Code: Python can be used with frameworks like Ansible, Terraform, and AWS SDK to define infrastructure as code. DevOps engineers can write Python scripts to provision and manage cloud resources, automate infrastructure deployment, and orchestrate complex workflows.

c. Scripting and Integration: Python provides rich libraries and modules for interacting with various APIs, databases, and services. DevOps engineers can leverage Python to write scripts that integrate different tools and systems, enabling seamless communication and data exchange.

d. Data Analysis and Visualization: Python's robust data analysis libraries, such as NumPy, Pandas, and Matplotlib, make it valuable for analyzing system logs, performance metrics, and other data. DevOps engineers can use Python to extract insights, generate reports, and create visualizations.

e. Testing and Quality Assurance: Python has frameworks like pytest and unittest for automating testing and performing quality assurance tasks. DevOps engineers can write Python scripts to automate unit tests, integration tests, and continuous testing processes.
         
         
"""),
          SizedBox(height: 25,),

          TextBlock(title: "Python Scripts", description: """
          
      Python provides a simple and powerful scripting interface that allows DevOps engineers to automate tasks. Here's a general approach to using Python scripts for automation:
a. Identify the task: Determine the specific task or process you want to automate. It could be anything from file manipulation to network operations or system administration.

b. Write the script: Use a text editor or an integrated development environment (IDE) to write a Python script that performs the required actions. Leverage Python's standard library and third-party packages to simplify and enhance the script's functionality.

c. Test and debug: Test the script thoroughly to ensure it behaves as expected. Debug any issues or errors that arise during testing.

d. Schedule execution: To automate the task, you can schedule the execution of the Python script using a job scheduler like cron (on Linux) or Task Scheduler (on Windows). Set the appropriate schedule to run the script at the desired intervals.

e. Monitor and maintain: Monitor the execution of the Python script and ensure it runs without errors. Make necessary adjustments or updates as needed.

Python's versatility and extensive library ecosystem make it an excellent choice for automating various tasks and processes in a DevOps environment. Its readability and ease of use contribute to the efficiency and maintainability of automation scripts.

"""),
          TextBlock(title: "Example", description: """
          
     automating the deployment of a web application to a remote server using SSH.

import paramiko

def deploy_web_app(host, port, username, password, local_path, remote_path):
    # Create an SSH client
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

    try:
        # Connect to the remote server
        client.connect(hostname=host, port=port, username=username, password=password)
        print("Connected to the server.")

        # Create an SFTP client
        sftp = client.open_sftp()

        # Upload the local files to the remote server
        sftp.put(local_path, remote_path)
        print("File uploaded successfully.")

        # Execute commands on the remote server
        stdin, stdout, stderr = client.exec_command(f"cd {remote_path} && ./deploy.sh")
        print(stdout.read().decode())

        # Close the SFTP and SSH connections
        sftp.close()
        client.close()
        print("Deployment completed successfully.")

    except Exception as e:
        print(f"Error: {str(e)}")

# Example usage
deploy_web_app(
    host="example.com",
    port=22,
    username="your-username",
    password="your-password",
    local_path="/path/to/local/app",
    remote_path="/path/to/remote/app"
)
In this example, the script uses the paramiko library, which is a Python implementation of the SSH protocol. It connects to a remote server using SSH, uploads the local web application files to the server, and executes a deployment script (deploy.sh) on the remote server to deploy the application.
     
"""),
        ],
      ),
    );

  }
}
