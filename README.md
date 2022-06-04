# final_comic_reader

Comic Reader Application - Flutter Android

Members:
* Nguyễn Hoàng Minh Thư
* Lê Đức Thắng

Workloads sheet: [link](https://docs.google.com/spreadsheets/d/1onvR61u1fTW0O2I8wkWvt1UWuoJXeoOkO_R2St4fFT0/edit?usp=sharing)

# ForYouScreen
Display this screen when app first is loaded.

![For You Screen](assets/screens/foryou.jpg)

Carousel displaying 10 comics banner, auto sliding and can also link to DetailScreen of comic on click.

![For You Screen](assets/screens/carousel.jpg)

My subscriptions section displays comics that user has subscribed to.

![For You Screen](assets/screens/my-subscriptions.jpg)

All comics section to display all comic that our system currently has.

![For You Screen](assets/screens/all-comics.jpg)

# SearchScreen
Display when clicking on the search icon button on the on of ForYouScreen. Search function filters comics by its name on typing.

![Search Screen](assets/screens/search.jpg)
![Search Screen](assets/screens/search-1.jpg)



# CategoryScreen
Display comics by its category saved in database, one category per each tab bar view (1 comic can contain multiple categories).

![Category Screen](assets/screens/category.jpg)
![Category Screen](assets/screens/category-1.jpg)

# MyScreen
Display comics in a ListView of all comics that the user has subscribed to.

![My Screen](assets/screens/my.jpg)

# MoreScreen
Display current user information: name and log in status. A log in button if user is not logged in, and change to login button when user is logged in.

![More Screen](assets/screens/more.jpg)

# CreateAccountScreen
Display when user clicks the CREATE ACCOUNT text button in MoreScreen.

![Create Account Screen](assets/screens/create-account.jpg)

We will demo creating a user account, when user clicks the SIGN UP button, it will automatically prompts to LoginScreen if account is created successfully.

# LoginScreen
Display when user clicks the log in button in MoreScreen or prompting from CreateAccountScreen.

![Login Screen](assets/screens/login.jpg)

When account is logged in with valid credentials, user will be promted to ForYouScreen. Meanwhile, if we navigate to MoreScreen it will display the customer information: name and log in status, along with a LOG OUT button.

![More Screen](assets/screens/more-1.jpg)

# DetailScreen
Display detail of each comic with a subscribe button to tell the status 'isSubscribed' of the user to this comic.

![Detail Screen](assets/screens/detail.jpg)

Clicking the subscribe button will change it to a subscribed button and it is also recorded on the database that the current user has subscribed to this comic.

![Detail Screen](assets/screens/detail-1.jpg)

Also, the subscribed comic will be displayed on user's ForYouScreen and MyScreen.

![For You Screen](assets/screens/subscribe-to-foryou.jpg)
![My Screen](assets/screens/subscribe-to-my.jpg)

# ComicScreen
Display the content of a chapter in the comic as a vertical listview and an app bar that appears/disappears on touch and on scroll.

![Comic Screen](assets/screens/comic.jpg)
![Comic Screen](assets/screens/comic-1.jpg)

# TODO

* Function and layout that user can add, update, delete new comic.
* Download a comic chapter, it will be saved on device but can be loaded offline on the app.
* New layout to display novel (text comic) data


