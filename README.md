<h1><img src="logo_가로형.png" width =200></h1>

 <img src="https://img.shields.io/badge/SpringMVC-5.0.2.RELEASE-brightgreen.svg">

## What is this?

> Study Group Web Services. (Groupth = Group + Growth)

### Function

- Groups can be retrieved
- You can create groups and add members
- You can find the same members of interest anywhere you want
- The group reader can set the study position and can also provide important news
- Knowledge sharing function (board)



## Stack

> Front-end

- HTML5 / CSS3 / JavaScript / jQuery / Ajax 
- Media Query
- Google Map API
- Leaflet

> Back-end

- Spring STS 3.9.9
- Tomcat v9.0
- JAVA (jdk1.8.0_211)
- Mybatis
- JSP
- Oracle Database Express Edition 11g Release 2



## Installation

1. https://github.com/kyun9/Groupth.git  - [Clone or download] - ["Click"]
2. Import from Eclipse



## Usage

1. Oracle database CREATE USER and GRANT

   ```sql
   CREATE USER {userid} IDENTIFIED BY {password};
   GRANT CONNECT, RESOURCE TO {userid};
   ```

2. Import 'groupth.dmp'

   ```bash 
   $ imp userid={userid}/{password}@SID file='groupth.dmp' 
   ```

3. [Add server from Tomcat v9.0 in Eclipse] - [Start the server]



## video

[![Watch the video](Groupth.PNG)](https://www.youtube.com/watch?v=UFqDNVF4j3I)
