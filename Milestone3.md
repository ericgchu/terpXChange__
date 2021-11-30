## Important (Copied from Milestone1)
* As stated in the Lessons Learned section in order for the app to successfully build, you need to download the roots.pem file. It can be found here: https://www.dropbox.com/s/onm9gu5vcqqjh7g/roots.pem?dl=0
* After it is downloaded you have to copy and paste it in the "etc" folder, the directory is below
 > nextbigthing -> TerpExchange -> Pods -> gRPC-C++ -> etc  
* Another possible issue that can be encountered when trying to view the preview in XCode is that scheme might be set incorrectly, in order to set the scheme follow instructions below
> Product -> Scheme -> make sure the "TerpExchange" option is selected
* To test the login use the username: "A@gmail.com" & password: "Aaaaaa"

## Original Milestone 3 Goals 
* Implement Dept. & course specific categories
* Change profile picture icon, Edit listing captions, implement 'SOLD' tag
* Finalize Firebase infrastructure
* At this point, we will begin working on the stretch goals


## Goals Accomplished 
* Added a search button to the MainFeed page, allows user to search for Books
* Fixing username and password authentication bug
* Making username case insensitive and password case sensitive
* Clear username and password text field info after log out
* Fixing the disappeared divider if error label shows
* Created messaging tab layout class & show what it will look like when connected
* Fixed UI details on textbook tags


## Lessons Learned 
* Learned to manipulate the provided firebase database to fit the need for our app
* Learned to download data from firebase and display in our app view
