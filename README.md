# Credit Score



*_Credit Score is an app that presents a credit score in a round animated progress bar._*



### Approach taken


The app is built with a single ViewController using MVVM architecture, where the ViewModel is responsible for the business logic and the ViewController is kept simple and only responsible for presenting UI. To scale this app, a coordinator pattern could be introduced for navigation, to further separate concerns and easy testing. 

The app is built using a protocol oriented approach for easy testability. 



### Technologies used

-  [Swift 5](https://developer.apple.com/swift/)



### How to test it


Please clone the repo, clean the project in Xcode and run the project. No need to run any library package manager. 



### Known issues



- UITests missing for custom circular progress bar. 



### Future Improvements / Additions



- Add more unit tests to get coverage higher



- Add missing UI Tests to get 100% view coverage



### Screenshots



![alt text](https://i.imgur.com/DKxsQq1.png)



### User stories:



```

As a user I want to see my current credit score

```
