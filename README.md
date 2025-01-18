## HeelShop
HeelShop is a marketplace app designed specifically for university students to buy and sell items locally with ease. Unlike traditional platforms, HeelShop eliminates the need for shipping, long-distance travel, or dealing with strangers by restricting access to verified students within the same school. Additionally, HeelShop provides an outlet for student-made businesses to not only sell their products but also promote their brand within the campus community. Currently, the only comparable method is posting on social media platforms. However, this approach lacks organization, clutters users feeds with items that might not interest them, and discourages many individuals who feel too shy to post publicly. HeelShop addresses these challenges by creating a safer, more organized, and community-focused marketplace tailored to the unique needs of campus life.

## Functionality
Only individuals with a university emailc an access the app. Users login and would be able to post either items to sell or create a personal business.

## Process
My friend made me a mockup, and using this rough outline I logged into Swift and let my creativity loose.

## Attributes
**Features within the app**

- Used "Fake Store API" to populate the listings within the home and discover page. On the discover page, I filtered the data to only include discounted items and populated the corresponding section
- Performed network calls complete with data error and a loading screen for when images were loading.
- Used LazyGrids and Scroll Views for a majority of the app so that the page only populates as far as the user scrolls.
- App conforms to MVVM design, it might be a little messy because this was the first time I tried to apply the design pattern within swift.

## Journey
**Obstacles and Future Additions**

<details>
  <summary>TabView</summary>
  Successfully incorporated a TabView
</details>

<details>
  <summary>Scroll View</summary>
  Successfully incorporated a scroll view
</details>

<details>
  <summary>Search Bar</summary>
  Work in progress, managed to create a search bar to filter in user input but I need to figure out how to make it a reusable view as well as make another view "pop up" while the user is typing in the search bar.
</details>

<details>
  <summary>Shopping Cart</summary>
  I want this cart to show all the items users have liked and palce it in their bag.
</details>

<details>
  <summary>Accounts Page</summary>
  Still a work in progress, I want this page to show user information tied to their account and listings.
</details>

<details>
  <summary>User Login</summary>
  Still a work in progress, I want for the login to only accent emails ending in "unc.edu"
</details>

<details>
  <summary>Data Base</summary>
  While the app is currently tied to a mockdata API, I hope to be able to create my own data base complete with user account information, listings, and businesses.
</details>
