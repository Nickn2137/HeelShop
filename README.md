## 🐏 HeelShop
HeelShop is a marketplace app designed specifically for university students to buy and sell items locally with ease. Unlike traditional platforms, HeelShop eliminates the need for shipping, long-distance travel, or dealing with strangers by restricting access to verified students within the same school. Additionally, HeelShop provides an outlet for student-made businesses to not only sell their products but also promote their brand within the campus community. Currently, the only comparable method is posting on social media platforms. However, this approach lacks organization, clutters users feeds with items that might not interest them, and discourages many individuals who feel too shy to post publicly. HeelShop addresses these challenges by creating a safer, more organized, and community-focused marketplace tailored to the unique needs of campus life.

## 🦾 Functionality
To access HeelShop, users must first create an account using a university email ending in ".unc.edu," ensuring that only verified students can join the platform. Once registered, users are greeted with the Home Page, which showcases local shops and postings. From here, users can press on the large "+" button to create postings quickly and with ease. Additionally, the app includes several key features designed to enhance the user experience:
- **Discover Page:** Helps users explore and find items or businesses that match their interests.
- **Message View:** Where buyers and sellers can communicate with one another to facilitate transactions.
- **Account Page:** Allows users to manage their account information, view and edit their listings, and promote their student-made businesses.

**View the app below or [click here](https://youtube.com/shorts/njWk-H8MnAk):**

![HeelShop](https://github.com/user-attachments/assets/a67a0342-d7a6-462e-aa07-45cf0648e61e)

> **Disclaimer:** _This app is a work in progress. The video provided is not indicative of the final product, as features and functionality are subject to change during development._

## ⚡️ Process
The development of HeelShop began by identifying a problem I was passionate about solving: improving the efficiency and safety of selling items on campus while facilitating commerce among students. I started by brainstorming and sketching a rough design on paper to visualize the app's layout and core functionalities. To refine this vision, I enlisted the help of a friend to create a Figma mockup, which provided a clearer structure for organizing the app's features and user interface.

With the concept defined, I began teaching myself the technical skills required to bring the app to life. Using knowledge gained from an iOS bootcamp, online courses, and ChatGPT, I learned and applied key iOS development concepts. Equipped with these tools, I allowed my creativity to guide me throughout development process, constantly approaching the app from a user’s perspective. This ensured that every feature and design decision aligned with the goal of creating an intuitive and user-friendly marketplace experience.

## 🔥 Attributes

Here are some notable features of my app. Additional features, such as the implementation of Firebase, custom databases, and more, are expected as I progress further in development.

- **MVVM Design Pattern:** The app follows the Model-View-ViewModel (MVVM) design pattern, marking the first time I implemented this architecture in Swift. While the implementation might be a bit messy due to the learning process, it demonstrates a structured approach to app development.🪽
- **Optimized Layouts with LazyGrids and Scroll Views:** Leveraged LazyGrids and Scroll Views throughout the app to ensure efficient loading and rendering of content, with pages populating dynamically as the user scrolls.
- **API Implementation:** Integrated the "[Fake Store](https://fakestoreapi.com/docs)" API and utilized tools like JSONDecoder() to populate product listings. The Discover page features a custom filter that dynamically showcases only discounted items in the corresponding section.
- **Data Handling:** Implemented network calls with comprehensive error handling, including user-friendly alerts for data issues. The app also includes a loading screen to handle image rendering, ensuring a smooth user experience during content loading.

## 🚀 Journey
The dropdowns below document my journey in developing HeelShop, showcasing features I've worked on, their current status, and the challenges I’ve encountered. This section highlights both my progress and the learning experiences behind each feature. Within the dropdowns, you'll find successes, errors encountered, and resolutions. Striked items are mostly completed.

<details>
  <summary>TabViews</summary>
  
  - 🟢 Successfully incorporated a TabView.
  - 🔴 RESOLVED: I came across issues inegrating the API into my app as it didn't have all the required informaiton I needed for some functionalities. Because this wasn't my database, I couldn't just edit it. To solve this issue, I had to create functions to edit the database until it was what I wanted it to be. This feature was necessary for testing my app and it will not be included in the final version.
</details>

<details>
  <summary>HomeView</summary>
  
  - 🟢 Successfully incorporated "Lazy scrolling" for efficient content rendering.
  - 🟢 "Products" section correctly populates the list based on API call.
  - 🟢 Discounted postings are distinct from regular ones.
  - 🔴 RESOLVED: I encountered an issue with invalid data errors while trying to populate the posting list from an API call, which stemmed from a mismatch between my data model and the structure of the API response. Initially, I assumed the response had a nested structure, but further debugging revealed it was a flat array. Adjusting my decoding approach to align with the actual API response resolved the issue. 
</details>

<details>
  <summary>DiscoverView</summary>

  - 🟢 Successfully incorporated "Lazy scrolling" for efficient content rendering.
  - 🟢 This view is visually where I want it to be at, however, adjustments to the model are necessary for this page to be functionally complete.
  - 🔴 RESOLVED: Issues were encountered filtering the database. Problems resided in filtering the database as the expected filtered list returned nothing. To fix this, I moved all of this data to the ViewModel and created a separate variable to handle fetching the information.
</details>

<details>
  <summary>MessageView</summary>

  - 🟢 Visually where I want it to be at. However, I still need to implement FireBase features for this view to work as I want it to.
  - 🔴 RESOLVED: Issues were encountered creating the "Inbox" header. Originally, I had the text and the icon within an HStack but changed it so the bell icon is on its own separate stack. Both views were combined used an ZStack to formate the view how I wanted it to be. 
</details>

<details>
  <summary>AccountView</summary>
  
  - Not yet started.
</details>

<details>
  <summary>SearchView</summary>
  
  - 🟢 Successfully made a working search bar to fiter the list of postings.
  - 🔴 Error occurred in the way in which SearchView is implemented. The idea is for a view to popup when users enter the search bar, but issues relating to formatting of the page arose. Further inspection and implementation of this view is necessary. As a result of this, this view is unusable for all the main views.
</details>

<details>
  <summary>BagView</summary>
  
  - Not yet started
</details>
