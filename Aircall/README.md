# Introduction

In this document, you will find answers to these questions :

- Write a brief outline of the architecture of your app
- Explain your choice of libraries
- What was the most difficult part of the challenge?
- Estimate your percentage of completion and how much time you would need to finish

## Installation

In order to install and test the app, please follow these instructions :

1. Clone the repository
2. Execute the command `pod install` on your CLI
3. Launch Xcode using `Aircall.xcworkspace` file
4. Happy testing :)

## Documentation

The source code is documented around **80%**  
The technical documentation can be found [>> here <<](docs/index.html)

## Keys

For me this is the keys of my project

### Source code

The source code is :
 - well organized
 - documented
 - normalized
 - tested with and without internet connection
 - easy to read and understand

### Network stack

The network part is isolated, and robust because fully tested.  
So it's super easy to add more endpoint, or make changes.

Furthermore, it's ready to react on various failure:
 - network failure
 - server error
 - mapping error
 - business error

To sum up, the network stack is modern,
because it use Codable, and may be used with or without reactive programming,

### Architecture

The application is Reactive, easily testable,
thanks to MVVM-C pattern and RxSwift.
The base code can be upgraded quickly.
The app support DynamicType.
Colors can be changed in a second.
The app is fully localized.

### Works

Of course, the app do the job without crashing or poor performances.

## Answers

### Considerations

@Aircall you are using the **Clean Architecture**  
(and something close from **VIPER** architecture)  
Furthermore, you are using **Alamofire**..  
..without using the powerful **Codable**.
For the database you use **Realm**

That's why I decided to choose an architecture slightly different from the one you generally use.

I hope this different way for building an app,  
will be useful and profitable for you as evaluator.

### Architecture

#### MVVM-C

I decided to use the **MVVM-C** pattern for building this demo app.
**MVVM-C** stands for **Model-View-ViemModel-Coordinator** pattern.

#### Why

In one sentence : **when power meet simplicity**  
Unlike VIPER, basic principles are very simple and easy to understand even for junior developers.

It's super easy to become familiar with **MVVM** and after all, it seems that Apple, after more than 30 years with **MVC** is embracing the **MVVM** !

#### How

Basically **MVVM** allows easy decoupling, and add a layer between the **Model** and the **View** : the **ViewModel**

The **ViewModel** is the central piece of the architecture.  
You will find inside business rules, logical interactions with network or persistence store, and of course the view.

Basically a **ViewModel** receive an **Input** which describes all interactions sent from the **View**,
and use it to generate an **Output** which can be used to produce desired side effects or go back to the **View**.

The **ViewModel** is view independent, which means it can be reused easily.

Thanks to **RxSwift** and **RxCocoa** we can bind **ViewModel** data directly to **View** components,
allowing us to have a view always synchronized and up-to-date.
In fact Reactive programming is the perfect companion of *MVVM* pattern !

Even if the *MVVM* is powerful, there is one caveat to use it as is.
If you want to follow the clean architecture, the navigation flow mustn't be handled via the **View** or the **ViewModel**
That's why the **C** of **MVVM-C**. It stands for **Coordinator**

The **Coordinator** is responsible for the whole navigation flow, and then leave the other part in peace.

#### External libraries

- Lint: **SwiftLint**  
This library is the first added on my all projects. It force you to have an uniform coding convention.

- Network: **Moya**  
Moya is a super set of Alamofire.  
That's means everything you can do with Alamofire, you can do it with Moya.  
Of course, Moya offers various things which make it great and better than Alamofire IMO :
 - First, with Moya API implementation is standardized :  
It's much more easier to switch between projects using Moya, than projects using Alamofire, because each developers has it's own implementation.
 - Network logging built-it : No needs to print everywhere.
 - Native support for stubs : Easily test your network and parsing.
 - Native support of many authentication systems.
 - Support additional plugin.
 - Compatible with Reactive Programming : Both RxSwift and ReactiveSwift

- Reactive programming: **RxSwift** and **RxSwiftExt**, **RxCocoa**
Bring data binding to iOS : data always synchronized with UI components. Tedious multiple asynchronous tasks or scenarii handled with a breeze. Think a global application workflow is much more easier in reactive programming.
RxCocoa is the bridge between RxSwift, and Cocoa.

- Data: **CoreData**, **RxCoreData**, **RxDataSources**
I think CoreData has a bad reputation, since Realm, maybe for good reason, but I think for bad reason.
First, it's native ! Secondly, CoreData had major improvements the last years.
I have so many things to tell about CoreData and Realm, I will discuss about it with pleasure if you want.
RxCoreData, brings Reactive programming to CoreData.
Finally, RxDataSources, it's a powerful tool allowing to bind items from your persistence store to you UI.
It saves a lot of time, and a lot of mistakes made by young developers.
It allow you to build very strong scenarii, filters, so easily. We can discuss about it.

- Utils: **Reusable**
This micro-library is a must have on every project. I'm sure that you have already encounter the problem addressed by this library. The guy who develop this one, is French ! Working with multiple View, TableViewCell, CollectionViewCell is a lot easier with this tool.

- Notification: **NotificationBannerSwift**
In fact this is the first time is used this library... I used it to test how it works.
It's just an enhancement for the demo app. It displays banner when you have a request error.
I was not supposed to use it. I think I will never use again this library.

#### The most difficult part of the challenge

Make the **cursor on the right place**, and then, don't take too much time on less interesting things.
In other words, **time management** was the most difficult part, because we are trying to do the best as possible.

In the other hand, the goal of this technical test, is to demonstrate our skill, and presents source code,
like we used to produce it, in the real world. So it's important to do like, we used to do even if it take time : dilemma

As you see, I used to document all my source code, because it help a lot to understand what we are doing and what we have done.
Because I always do it, I think I don't take too much time on that part.

Same thing with Unit Tests : for me it's primordial to do it soon, it make our code more robust.
But in this case, I take much time. Unfortunately I didn't have enough time to test everything and some parts was left..
Furthermore i didn't start UI Tests at all...

From a technical point of view, no special difficulty in this test.

#### The percentage of completion

- The user interface is not exactly what is presented on the screenshot.
- Unit Tests are not fully implemented, and UI Tests are not implemented at all.
- But basic functionality are implemented

So I would like to say that that **my percentage of completion is about 80%**

#### How much time to finish

To finish I certainly need at least 2 hours.
Maybe 4 hours to be sure that everything is really "perfect".
(In fact more we rode our code, more we can improve it...)
