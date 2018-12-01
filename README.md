It seems to be a pain to pair up a select input with a union type in Elm.  Let's
figure out the best way.

## TODO

* separate value from visible string in options
* add additional attributes to select
* add additional attributes to options


I would like to make the arguments easier, just a single record, but I can't
figure out how to do it.  I looked at
https://github.com/elm/browser/blob/1.0.1/src/Browser.elm and it led into some
crazy JS.  For the first pass, let's keep a really long chain of arguments.
Maybe we'll see a way to split the up as we go.
