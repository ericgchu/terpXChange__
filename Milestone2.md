## Important (Copied from Milestone1)
* As stated in the Lessons Learned section in order for the app to successfully build, you need to download the roots.pem file. It can be found here: https://www.dropbox.com/s/onm9gu5vcqqjh7g/roots.pem?dl=0
* After it is downloaded you have to copy and paste it in the "etc" folder, the directory is below
 > nextbigthing -> TerpExchange -> Pods -> gRPC-C++ -> etc  
* Another possible issue that can be encountered when trying to view the preview in XCode is that scheme might be set incorrectly, in order to set the scheme follow instructions below
> Product -> Scheme -> make sure the "TerpExchange" option is selected
* To test the login use the username: "A@gmail.com" & password: "Aaaaaa"

## Original Milestone 2 Goals 
* Implement textbook image upload feature
* Enable tags & scroll view in the home view feed
* Built out profile so users can see other textbooks you are selling

## Goals Accomplished 
* We completely revamped the whole UI (login, signup, main feed, & profile page)
* Correctly put in placed the main feed scroll view into the tabbed overiew 
* Created rough drafts of textbook posts tags & working on implementing them as a button to overview a category of related books
* Profile interface skeleton has been improved to be the template for all users profiles when clicking on the textbook post one would like to purchase
* We implemented the textbook image upload feature but are currently finishing the backend support to post on the main feed page
* Tags & scroll view in home view has been implemented
* Created profile skeleton for future users to see when clicking on textbook posts 
* Fixed misc. Firebase login problems
* Faced issues pushing with git - so we gave code to one person to push & learned how not to replicate those issues 

## Lessons Learned 
* Learned how property wrappers work, how to properly implement it & when to implement it 
* How to efficently interact & communicate with data in Firebase
* Proper use of SwiftUI navigation
