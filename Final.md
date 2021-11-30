# TerpXChange

## Overview 
Like any other college student, a big part of every semester is going to the school bookstore and having to search for your textbooks. It is no secret that some textbook prices can be on the high end but sometimes students are left no choice but to spend that money for their classes. While other options such rentals and used textbook exist, they tend to be harder to find for almost every book. 

However, there is another market for students to acquire textbooks, and that is themselves. Speaking from experience, once you finish a class there is no reason to keep a textbook around. Most students tend to sell their textbooks through websites like Amazon, Barnes and Noble, and others. While these retailers provide various options, it can be hard to locate a specific book you need for a specific course at UMD. 

This is where our app TerpXChange comes in. Through the use of our app, we allow our users to upload their listings for their textbooks that they are selling. The app is specifically made for University of Maryland students in the sense that it allows them to sell their own textbooks without any extra costs. A new user to our app is allowed to make an account and browse the listings of textbooks posted by other users. 


### Goals

The primary goal of this app is to have students be able to post textbooks amongst other items in a collegiate local marketplace where they can buy, sell and/or exchange items at a relatively affordable price. 

### Login backed by Firebase
We used Google’s Firebase to hold a user’s login information, preference & textbook posts to ensure max security & reliability. We have created beautiful UI’s for the login & sign up page along with the profile page to display all posts retrieved from Firebase’s backend. 




### Main Feed Page
This is where the main show is at - we allow students to see a feed of newly posted textbooks/misc. items cleanly listed with the picture of the item being sold, title of the item, price, class it is for, seller’s name, & tags that detail the post. As seen in the last example post - we can see that other items are allowed to be posted as well - maybe furniture/accessories that other students would use in decorating their dorm! We can also see an additional feature in the upper right hand corner not detailed in our goals or stretch goals as we decided to create this for future goals (outside of class). This is UI only, but it would allow users to find their exact item very quickly. 

Lastly, we have the upload button in the lower right hand corner that allows for easy posting with the text fields - title, class name, price & description allowing to source from the camera or the photo library very quickly. In the future, we plan to make the posts clickable to expand the view & see details regarding full description, extra pictures of the item & user profile.

### Messaging System 
To clarify: this is a stretch goal. We initially started experimenting with the Firebase Cloud Messaging system but decided the clunkiness, storage costs & etc. were not the most efficient solution. Then we thought about linking a social networking profile as many college students use one & can build friendships & even networking opportunities. This is seen on the profile page and clicking on the instagram icon can take you to their profile where you can contact & discuss details regarding the price & meeting up on campus. 

### Tag-Label Categorization
To allow for more insightful post recognition we allow for tagged labels detailing which year that textbook would be used for, which types of majors would purchase it & the condition it is in. We have not implemented to be a clickable link for all specific textbooks to populate it but as a label for now. 

### Profile Page
In the profile page tab, the user would see a very similar page in which any other user scrolling to their page would see. The only difference are the icons detailing a change to the profile picture, name & settings button in which are only visible to the creator. Any other user would see a profile picture, a link to their instagram & a bunch of tabbed boxes holding expendables containing their post, but you can clearly see what they are selling, the price & class name in the quick view allowing others to see if they are selling textbooks similar to classes they are going to take in the future. 

### User Interactions 

|||
|--------|--------|
| ![homepage2smallll.png](https://www.dropbox.com/s/mv3yz66zonnryan/homepage2smallll.png?dl=0&raw=1)|  ![hompage1smallllllll.png](https://www.dropbox.com/s/dkmhrcu2n4yx4tf/hompage1smallllllll.png?dl=0&raw=1) |
| This is the homepage | This is the sign up page |

##### Login Page 
When you first open the app, the login page is shown to the user. From here the user is able to enter their email and password to be able to log into the app. For our case the user's email is considered their username. The user is also allowed to view their password as they are typing it by clicking on the eye symbol on the right side of the password field. 

##### Sign Up Page 
If the user does not currently have an account with our app, then on the login page there is an option where they can create an account. On the create an account page, the new user is asked for their username and password to be able to create an account. Once they have entered that information then they will be redirected to the login page, where they can enter in their information. 

##### Main Feed Page 
![mainfeed.png](https://www.dropbox.com/s/q4u078rmesk3u4i/mainfeed.png?dl=0&raw=1) <br>
Once the user logins into the app, this is the main feed page. This is where the user can see the all the available lists for textbooks. In this scrollable view, the user can view the listings from every user that uses the app. The way the posts are listed are designed so the user can view the most important information first. Each listing, shows the class name, textbook title, user who posted it, and cateogry labels for the class along with the price of the textbook. The button with the camera image is going to allow the user to upload a listing to the app. Also visible in the interface is the home, messages, and profile tabs along with a search button at the top right of the screen that would essentially help the user located certain listings. However, the implementation of that feature would be consider a stretch goal that we did not get around to. 

###### Upload Page <br>

|||
|--------|--------|
| ![uploadpage.png](https://www.dropbox.com/s/p39kspmg2ussfjv/uploadpage.png?dl=0&raw=1)|  ![uploadpagefinal.png](https://www.dropbox.com/s/h55s7x5m9tol163/uploadpagefinal.png?dl=0&raw=1) |
| Empty Upload Page | Filled in Upload Page |

If the user taps on the camera icon then they will be brought to this page where they will be able to upload a listing of their own. The fields are the book title, class category, class name, book price, book description followed by an image of the textbook. On the right side you can find an example of a filled version of the page, where the user has filled out all the necessary information. Once the user has done this then they can select the post button on the top right and have their listing be sent to the Firebase database and listed in the mainfeed as well. 

##### Profile Tab
![profiletab.png](https://www.dropbox.com/s/x7rcbzilc82bd4k/profiletab.png?dl=0&raw=1) <br>
Finally, there is the ability for the user to view their profile. In the profile view of the interface, the user has the ability to view their listings of their books in a scrollable view. Along with their listings the user is able to view their profile picture and their name as well. They also present the ability to change their profile picture and name as well by selecting the camera icon, pencil icon, and instagram icon respectively.
||||
|--------|--------|------|
| ![changepic.png](https://www.dropbox.com/s/eb554j8lt4wzruh/changepic.png?dl=0&raw=1)| ![changename.png](https://www.dropbox.com/s/xn34g43hg9eaex5/changename.png?dl=0&raw=1)| ![changeIG.png](https://www.dropbox.com/s/p2p9eazxejcd2hh/changeIG.png?dl=0&raw=1) |
| Change Profile Interface | Change Name Interface | Change Instagram Name Link |

As stated previously, the user had the ability to change their profile picture, name and as well as their instagram handle. To allowed use to provide the user with more customization and features. The reason behind including the instagram handle is due to the fact that we did not have a good amount of time to implement the messages tab for our app. We believed that having an instagram tab would allow our users an alternative to finding a way to communicate with the potential buyer/seller. 
### Development Process
##### Eric Chu 
During the development process I working on the UI with Alex along with some backend support with Hank. To start, in the first milestone I developed the login, sign-up, 3 tab interface rough draft while Hank was able to connect that to Firebase allowing for seamless logging in & out. I put in a few hours every week before the deadline & the 3 of us always made sure to have meetings & discuss what we have been working on, timelines & future goals along with UI/UX details before every push. And as Alex then took over the UI/UX of the application I helped Hank research storing items on Firebase unique to the person uploading them + implemented the tags/labels for potential categorization. We reached the goals of providing tags, but we definitely want to apply the categorization feature in future goals. Alex and I also worked on a clean design for the card posts in the main feed. I also mocked up a dummy messaging tab with potential messages with a friend to deal with later as it was a stretch goal. In in the last milestone, I had dealt with mock-ups for items other than textbooks, university tags for distincion & an instagram hyperlink as a replacement for the Firebase messaging system as we had dealt with some problems regarding such. 

##### Alexander Quinto 
In terms of the development process I was mostly in charge of the UI design for the app. When we started I did not have a concrete idea for the UI design for the app overall. Generally, the login and sign up pages were designed by the three of us. However, I had made the final design changes to make it a more modern yet simple login/sign up page. For the most part, the big UI stuff was completed for the first milestone deadline, this included a rough cut of the login/signup pages, and the main feed page where we listed the book listings. There was a few issues when it came to the main feed page of the app, where it was hard to decide on a design that would display exactly what we wanted in the app. However, I took a bit of inspiration from other social media apps to come up with the final design of the small views that list the books. A similar approach was taken for the buttons that were used to upload posts, as I took a bit of inspiration from Twitter and their button design that they use in their iOS app. For the second milestone, there was a rough cut of the profile page that I had designed along with Eric, overall it was rough idea as to what we wanted to display on that page. There was an issue  in terms of wanting to display the users book listings, where we tried to reuse the same card view from the main feed page but it did not look good because the formatting of the pictures were completely oversized for the small area that it was presented in. For the final milestone, there wasn't much to be done in terms of the UI design because most of it was completed by the end of the second milestone deadline. In terms of the things that we used that we did not cover in class was the library PhotosUI to have the ability to upload pictures into the views. Overall, there was not many changes that were made from the original designs and concepts that we had when it came to our app.


##### Hank Wu
Throughout this project, I have been spending most of time on constructing backend data system. At the beginning, we need the user id and password authentication system in our project to handle user accounts. After the user accounts is setup and implemented, I then started to work on receiving data from the user when they post a new textbook. All the book information is going to be uploaded to firebase, and the profile page will update the current list of books that the user posted. Between the milestones, I also did some minor view modification to make it looks better, such as adjusting the space between items in the view. At some point, I started to realize that the app crashes during sign in process and found that the error was the sign out process. I realized that my program didn’t handle the account sign out process correctly. After that, I started to work on handling the image data from the post. I first upload the images to firebase storage, and then waiting to download and display in MainFeedPage view. It was quite tricky when dealing with image files since the size of image files are quite big. One important thing was that the images hit the daily limit and we are no longer able to access the data for image. Therefore, we created some data on local for the program to run.



### Future Directions
We would start off by finishing some of the current features along with adding some new ones in. The (extra credit) search button would have backend support to search for all items within the database as well as showing them in a page. Tags would be clickable to show the category of items under that tag in a new pop up page. We would possibly look into a new messaging API or workout some issues with the messaging system as maybe Instagram might not be a desirable option to message others about pricing. The UI might also get a fresh coat of paint as we have a clean white background to really show off the items on the page, maybe a gradient type of color. Lastly, we would finish off making the posts in the main feed & profile page expandable so potential buyers can see extra pictures, description use, etc. 

Some new features we would love to add would be a “forgot my password” button, a “Give us Feedback!” button, and even a cleaner sign up page where you would enter your username, password, university & name page by page for a cleaner & more seamless process - similar to CashApp’s signup process. Lastly, we might give an option to reorganize the main feed to produce a feed of a certain category - say “CMSC” textbooks or “CMSC”/”MATH”/PHYS” textbooks only as a user might only need to buy textbooks for those classes. 
