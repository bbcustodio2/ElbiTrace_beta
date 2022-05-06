<div id="top"></div>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->


<!-- PROJECT LOGO -->
<div align="center">
  <h3 align="center">ElbiTrace - Beta</h3>

  <p align="center">
    <a href="https://github.com/bbcustodio2/ElbiTrace_beta"><strong>Explore the docs »</strong></a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

![image](https://user-images.githubusercontent.com/60213750/167064594-cf13ee5d-163e-49be-84d8-040bd47b273b.png)

This application is developed for the purpose of creating a Contact-tracing application using Bluetooth Low-Energy (BLE) Technology and location services. It is 
part of my Special Problem, which is one of my requirements for graduation. This application has 3 main functionalities: 

* User Profile - After a user has registered an account or signed in through their google account, they will be able to see their profile page which includes their COVID-19 Status (which is set to NEGATIVE by default). 
* Virus Heatmap - All COVID-Positive traces will be plotted in Google Maps. no other details will be displayed except where the data was written. 
* Contact Tracing History - all close-proximity contacts will be displayed. This will tell the user if they had been in contact with someone who is COVID-Positive.

This project is still in its early development stage and any suggestions about this application is greatly appreciated! 


<p align="right">(<a href="#top">back to top</a>)</p>

### Built With

This section should list any major frameworks/libraries used to bootstrap your project. Leave any add-ons/plugins for the acknowledgements section. Here are a few examples.

* [Flutter](https://flutter.dev/)
* [Google Maps API](https://developers.google.com/maps)
* [Flutter Nearby Connections API](https://pub.dev/packages/flutter_nearby_connections)
* [Firebase](https://firebase.google.com/)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

Setting up the application is very easy. Just follow these steps below.

### Prerequisites

This application is still in its early development stages and can only accomodate Android Devices. 
* Minimum Android Version
  ```sh
  Android 5.0^ (Lollipop)
  ```

### Installation and Usage

_Below is an example of how you can instruct your audience on installing and setting up your app. This template doesn't rely on any external dependencies or services._
1. Clone the repo
   ```sh
   git clone https://github.com/bbcustodio2/ElbiTrace_beta.git
   ```
3. put `app-release.apk` in your mobile device
4. Install it in your phone.
5. You can EITHER: Sign in with your Google Account OR tap on the Sign up at the Login Screen. 
6. Leave application running so your device will be detected by other users. 

<p align="right">(<a href="#top">back to top</a>)</p>

## Usage
### Login Screen
![image](https://user-images.githubusercontent.com/60213750/167064300-8c3cdc55-b84e-42f9-afa9-cab3f90dd64a.png)
* When you first initialize the application, the user will be taken to the login screen. A first-time user can login using their google accounts or by registering a new account by tapping the `Sign up` text at the bottom.

### Registration Screen
![image](https://user-images.githubusercontent.com/60213750/167064489-1d52b040-afd2-4676-953d-ab4120c1bf66.png)
* During signup, the user will be prompted to input their Display Name, email, and their password. They can also upload a profile image. 

### Home Screen
![image](https://user-images.githubusercontent.com/60213750/167064594-cf13ee5d-163e-49be-84d8-040bd47b273b.png)
* Once the user has logged in, they will be directed to the Home Screen. As long as the User is logged in, they will be directed to this screen when they start the application. A user can update their status to POSITIVE or NEGATIVE in this screen. There are also two buttons at the bottom which will redirect the user to the other two functionalities of the application.

### Contact Tracing History Screen
![image](https://user-images.githubusercontent.com/60213750/167064820-7e6ba289-f131-47b1-a015-18a2d7316969.png)
* This Screen displays all the user's recorded close contacts with other users. No information will be provided except for the Date, Time, and Status of the other user. When you tap the close contact record, it will redirect you to the google map page of the app where the close contact happened. All records will expire after 14 days. 

### Google Maps Screen
![image](https://user-images.githubusercontent.com/60213750/167065026-1c626e45-8133-4755-aa57-abfc65f18570.png)
* This screen will serve as a virus heatmap for the close contact traces. All close contact traces of the users with COVID-19 will be marked with red circles to indicate where those close contacts happened. 

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Bien Christian Custodio - [@BienCustodio](https://twitter.com/your_username) - bbcustodio2@up.edu.ph

Project Link: [https://github.com/bbcustodio2/ElbiTrace_beta](https://github.com/bbcustodio2/ElbiTrace_beta)

<p align="right">(<a href="#top">back to top</a>)</p>


