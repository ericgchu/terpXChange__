## Important 
* As stated in the Lessons Learned section in order for the app to successfully build, you need to download the roots.pem file. It can be found here: https://www.dropbox.com/s/onm9gu5vcqqjh7g/roots.pem?dl=0
* After it is downloaded you have to copy and paste it in the "etc" folder, the directory is below
 > nextbigthing -> TerpExchange -> Pods -> gRPC-C++ -> etc  
* Another possible issue that can be encountered when trying to view the preview in XCode is that scheme might be set incorrectly, in order to set the scheme follow instructions below
> Product -> Scheme -> make sure the "TerpExchange" option is selected
* To test the login use the username: "A@gmail.com" & password: "Aaaaaa"

## Original Milestone 1 Goals 
* Create login/signup interface w/ Firebase backend 
* Home feed/ Upload/ Profile sections (but not 100% built)
* Develop & style UI/UX interface features to be functional

## Goals Accomplished 
* Login/signup interface was created along with the Firebase backend
* The overall design of the home feed was created with test posts to get a visual representation
* A general design for the upload section was implemented but there are a few features that are missing such as having the ability to upload a picture for a user's textbook
* Profile interface has been built as well
* Most of the UI/UX designs have be implemented, however, the overall designs will possibly change as we move on to the next milestone
* (For demonstration purposes, the tabbed view page was left out & only the feed page is displayed after logging in)

## Lessons Learned 
* Since we are using Firebase, the file roots.pem has to be added into the directory in order for the app to successfully build
