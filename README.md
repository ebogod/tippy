# tippy
# Pre-work - tippy

tippy is a tip calculator application for iOS.

Submitted by: Ester Bogod

Time spent: 9 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!
- [x] App Icon
- [x] Start Screen

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/dfjRpJy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** My reactions to the iOS app development so far is that there is a lot of drag and dropping, it is very visual. Other languages that I have worked with in the past haven’t felt as visual as iOS development even when it is with Javascript and web design. iOS development also feels very connected to the IDE, and has a lot of “magic” built in with xCode.

I would describe outlets and actions to another developer as a way to connect the visual components to the code. Outlets let you define and use the component in code while actions are where the logic or specific events are connected to. For example, if we want to change the color of a text field in code we only need an outlet, versus if we want to have the logic of tapping on the text field to make an animation appear we need an action. If a developer is familiar to web development I could use the example of how web connects components with id or class names in order for code to trigger an action. Under the hood the way outlets and actions are being implemented is through using xml tags called `connections` and inside there are `actions` and `outlet` tags. The child tags have properties such as `destination` ( that state the destination or the property name that in the ViewController of the associated Storyboard), `property` (that state the name of the component), and more. 

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** In Swift Automatic Reference Counting (ARC) is used to track and manage the app's memory usage. It keeps track of references to resources in the code such as properties, classes, closures, objects, etc. The ARC makes sure that memory isn't wasted by deallocating memory (removing the reference to the resources from memory) when there is nothing that is calling, or using that property. Sometimes that can cause an issue when there are classes which point to each other. For example, we could have a Country class that contains the name and a capital city in it of type City, then we could also have a City class that contains the name of the city and which country of type Country it is in. These two classes have a strong reference cycle to each other, by trying to remove the reference of one or the other class (by setting Country to nil or setting city to nil) it will not deallocate the memory of them. 

A closure is a block of functions that can be passed around and used in the code, it is usually has a name that can be used in the code to reference that block of functions. The way you could get a strong reference cycle for closures are if you set a closure to a property in a class and inside the closure use properties or other methods from that same class. Usually you can see this by calling "self" in the closure which causes to need the reference to that class, and that creates a strong reference cycle. For example, inside of the Country class we defined previously we could have a closure that wants to print out the capital city of a country such as 
```
lazy var capitalOfCountry: () -> String = {
   return "\(self.capital.name) is the capital city of \(self.name)"
}
```
`capitalOfCountry` property holds a strong reference to its closure because the closure refers to `self` within its body. Within the body the closure needs to hold a strong reference back to the `capitalOfCountry` instance.


## License

    Copyright 2017 Ester Bogod

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

