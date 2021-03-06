# Generating storyboard keys

## Screencast Title
Type-Safe Resources with SwiftGen: generating storyboard keys

## Screencast Description

## Language, Editor and Platform versions used in this screencast:

* Language: Swift 4
* Platform: iOS 11
* Editor: Xcode 9

## Introduction

Hey what's up everybody, this is Romain.

Storyboards are amazing tools available to you in Xcode. They provide you a great way to design your application look and flow.

There is only one problem: strings! Swift provides this amazing type-safety and yet, pushing a new view controller may crash at runtime!

How about fixing that? How about making sure that when the time comes to push this view controller on to the stack, we know it will work.

## Talking head

Let’s see how we can make our use of storyboards safer with code generation.

SwiftGen code generation is a 2 step process. First, it will analyze your project - or in this case, your storyboard. It will look for scenes and the segues. Then, the informations it gathered will be fed to a templating engine to generate Swift code.

For each type of resources, SwiftGen can generate different styles of code, you can find the list of available templates running the `templates list` command:

(In a shell)

Run `Pods/SwiftGen/bin/swiftgen templates list --only storyboards`

It is possible to write your own templates to customize the generated code, which makes SwiftGen a very powerful tool.

For this example, we’ll use the `swift4` template because that’s what we’re using in our application.

Let’s take a look at the command we need to run to generate code for our storyboards:

Run `Pods/Swiftgen/bin/swiftgen storyboards —help`

As you can see, this command expect several parameters, additionally to a path where to look for Storyboard files:

* `—output`: this option defines where we want to generate the code, if you don’t pass it, the generated code will be printed into your terminal.
* `--template`: as mentioned earlier, we’ll use the `swift4` template.

We’re not going to use `--templatePath` or `—param` right away, so there is no need to explain them.

Let’s run the command now: our storyboard is located in the SocialProfiles folder and we want to put the generated code in the `Generated` folder so we can easily ignore it in git. Unless you’re into versioning generated files, which is cool too.

Run `Pods/SwiftGen/bin/swiftgen storyboards -t swift4 RW-SwiftGen-SocialProfiles/Base.lproj/Main.storyboard --output RW-SwiftGen-SocialProfiles/Generated/Storyboards.swift`

Congratulation, you’ve generated your first piece of code with SwiftGen!

Let’s have a look at the generated code.

(Opens RW-SwiftGen-SocialProfiles_Generated_Storyboard.swift)

The first thing this template does is declaring some types to represent:
* a Storyboard, with `StoryboardType`
* a Scene, with `SceneType`
* a segue, with `SegueType`

That’s exactly what we’ve wanted since we started using Swift: more types!

It also adds a `perform` method to `UIViewController` that we’ll cover in a minute.

If we scroll down a little more, we can see that some code was generated for our storyboard so let’s use it!

(In Xcode)

The code was generated, but we need to add it to our Xcode project.

Right click on the SocialProfiles target and select “Add files to …”.

Select the `Generated` Folder and press “ok”.

Just to be safe, quickly build the app using CMD + B to make sure nothing broke.

The first thing we’re going to do is stop using the Main Storyboard as the entry point in the app. Instead, we’ll instantiate the first view controller manually.

In this situation it may seems like it doesn’t make sense, but you may want to inject parameters into your root view controller in the future, for example.

Select the SocialProfiles target and remove the “Main” from the “Main Interface” section.

Then, open your application delegate and implement the `didFinishLaunchingWithOptions` method.

The first find we’ll do is instantiate our root view controller with the following code:

```swift
let profiles = StoryboardScene.Main.profiles.instantiate()
```

Then, we’ll feed this instantiated view controller to an instance of UIWindow:

```swift
let window = UIWindow()
window.rootViewController = UINavigationController(rootViewController: profiles)
window.makeKeyAndVisible()
```

Build and run your application. Nothing should have changed and you should still see that list of social profiles you’re proud about!

This doesn’t mean this change didn’t bring any value to our application. On the contrary, we are know using generated code which provide a lot of interesting things: the `profiles` variable is an instance of `ProfilesViewController`, there was no force-casting to do on your side because it’s all done by SwiftGen.

Additionally, you’re getting auto-complete for your storyboard’s scenes!

There is one last place where we’re using the storyboard.

Open the `ProfilesViewController` and navigate to the `didSelect` method of the `UITableViewDelegate` extension.

We mentioned earlier that the code generated by `swiftgen` added an extension to `UIViewController`. Well, now is the time to use it.

Replace the `performSegue` with the code using swiftgen:

```swift
perform(segue: StoryboardSegue.Main.profileDetail)
```

One more time, build and run the application. When you select a profile, you should still be taken to the detail screen for that specific profile.

Again, we didn’t change anything inside the application, but we now have the certainty that the segue exists and we got autocompletion for it, if Xcode got a good night of sleep!

Next time you or your teammate add, modify, or remove a scene or a segue, just want just to run the command again.

## Talking Head - Conclusion

Alright, that’s everything I’d like to cover in this video. We used Swiftgen to generate Swift code describing our Storyboard.
Now, we can be sure that when we'll need to access an element from a storyboard, it will be available!

If you want to learn more, stay tuned for my next screencast, where we'll **segue** into replacing our use of assets with code generated by SwiftGen.
