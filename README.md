## Prerequisites for Running Java Servlet Web Application
1. Install JDK and setup the environment(above Java 8)
2. Tomcat server
    - Download Apache Tomcat from the [official Tomcat download page](https://tomcat.apache.org/download-90.cgi).
    - Extract the downloaded archive to a directory of your choice.
    > Note: For Linux and macOS, you can extract the `.tar.gz` file. For Windows, use the `.zip` file.

## Step 1: Clone the repository and build the project
```bash
git clone https://github.com/Oijanak/Book-Management-System.git
cd Book-Management-System
./mvnw clean install
```
## Step 2: Step 2: Deploy the .war File to Tomcat
  - Locate the BMS.war file in the target folder of the cloned project.
  - Copy the BMS.war file into the webapps folder inside your Tomcat directory. The webapps folder is where Tomcat looks for .war files to deploy.
## Step 3:  Start Tomcat
  - Navigate to the bin directory inside the Tomcat folder and run the startup.sh script and startup.bat for window
  - Finally you can access application at http://localhost:8080/BMS
