## Inspiration
Inspired by TheOpenCode's mission to make coding accessible to people in low-income families in the underprivileged parts of the world, we were thinking of a way where students could code without a computer. After doing some research, we discovered that while only around 10% of households have access to a computer in Africa. This means that a lot of the time, students wishing to learn computer science often don't get the amount of practice that they need. In addition, electricity in these less developed countries can be expensive, so it's important to ensure that learning doesn't negatively impact living, especially with a more technological-oriented subject like computer science. Thus, we thought it would be a good idea to allow these students to practice computer science by providing a way to easily write and run hand-written code, which not only conserves electricity, but it's also been proven that writing out code on paper is a much more effective method to better understand the code you're writing, as it forces you to think much more deeply about the execution process behind your code.

## What it does
PhotoCode is a mobile app that allows the user to take a photo of their code, which they could then edit on the app. They also have the option to run the code, which would give them the appropriate output at the press of a button. As all the computation is done server-side, this method uses a minimal amount of electricity and is very power-efficient relative to the other ways you would run your code. Our app also allows you to save the code for later, as well as synchronize it between an account you can access on the accompanying web app, which allows you to continue coding from a computer when you gain access to one.

Not only will underprivileged people benefit from such an app, but also people who are looking for a better way to practice computer science. When you write code on paper, you are forcing your brain to walk through the code step-by-step, practicing your recalling of an algorithm in a much more effective method rather than trying to just memorize the syntax. This method of studying greately reinforces your comprehension and can be a much more practical alternative to studying computer science topics like algorithms. Our app allows you to write this code on paper, and then be able to import your code into the app and test it without having to type up everything. This way, you can debug and test yourself after writing code on paper much more efficiently.

When you first open the mobile app, you are greeted with a Login Screen. Creating an account lets you synchronize your code snippets between your device and the web app. After logging in, you are introduced to all the snippets that you've taken, where you can click on any one of them and choose to Edit, Execute, or Delete the snippet.

If you choose to edit the snippet (e.g. fixing small mistakes during the OCR process), you are brought to a page where you can view your code (with syntax highlighting) and make changes as you please. You can also execute your code, where it sends what you have to the HackerEarth API, where it runs the code and returns the result. Currently, we only support JavaScript (where you can get output by using console.log), but it's definitely possible to integrate many other languages in the future.

Of course, the main feature of PhotoCode is the ability to take a photo of handwritten code on paper which gets transformed into text which you can freely edit in the app. If we navigate to the second tab, we can see that the user has the option to either take a photo or choose an existing one from their gallery to import into the app. Once they confirm, the image is sent to our backend server which then sends the code back to the app. Then, the user is brought to the edit screen where they can give their snippet a name and edit any parts of the code that the OCR may have failed to convert.

## How I built it
We used Flutter to build the mobile app, as it allowed us to quickly build a minimum viable product while still providing a great UI.

## Challenges I ran into

## Accomplishments that I'm proud of

## What I learned

## What's next for PhotoCode
Of course, you can only build so much in a 24-hour timeframe. For one, we decided to only focus on implementing PhotoCode for one language (JavaScript), but of course many CS courses use other laungages to teach CS concepts, so it would definitely benefit to add other language implementations. As well, many computer science algorithms require input, so a feature to add input to your code execution instead of hardcoding it in would also be a nice feature to have.
