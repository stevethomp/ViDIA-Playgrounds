theme: Fira, 0
build-lists: true

## Playgrounds in Your Projects



#### Steven Thompson



![inline 120%](105092-dog-running-on-merry-go-round-0XON.gif)

^ Hello! My name is Steven, I'm going to talk very quickly about playgrounds!

---

### What's a Playground?

![inline](Swift%20A%20New%20Programming%20Language%20Introduced%20by%20Apple%20For%20iOS%20and%20OS%20X%20Development.jpg)

^ File that quickly runs your Swift code.

---

### Why is this useful for us?

- Playgrounds quickly show you the results of your code
- Playgrounds can `import` frameworks and other resources
- Playgrounds can display interactive UI

---

![inline](peanutbutterchocolate.jpg)

^ So how can this be useful in your project? Let's get going

---

airGiOSTools check target box

You can have one playground and fill it up, or have multiple small ones, associated with specific parts of your app. Say this custom UI control you have, and you want to play around with how it looks.

Or you have something cool and clever but maybe it could do with some interactive documentation. How about a playground with working code examples of usage?

---

@testable still doesn't give access to private or fileprivate. Just public/internal.

You need to rebuild the framework to get access to changes

---

Don't use this for testing, that's what unit tests are for.
