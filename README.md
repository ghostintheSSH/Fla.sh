### fla.sh

##### Paper-light flashcards in under 65 lines of bash.

Flashcards by Joliv were [simply files](http://en.wikipedia.org/wiki/Everything_is_a_file)
with their filename as the prompt and their contents as the answer. When cards are learned, they are hidden and a `.` is prepended to the filename.

Flashcards by SSH[ghost] use a single flashcard per topic and a single directory to house
all flashcards, i.e. only one directory in total vs one directory per topic (if you
wanted file management with your flashcards) and one flashcard per topic vs multiple
flashcards per topic. It's fla.sh with improved flashcard management. Shuf is still used
but to call each line from a single flashcard, questions may be repeated, and nothing is
made hidden.

Additional changes include no requirement to answer if you got a question correct,
especially since there's only one flashcard and nothing is moved to hidden, no learn
feature since test already requires a specified file, and script defaulting to usage
display if no argument field is entered.

Flashcard questions can be created anew, amended to an already existing flashcard, or can
be erased one at a time. Erasing a question shifts any question with a number greater than
the deleted question down by one so no numeric gaps are present.

### ORIGINAL COMMENT
*How come you have the user check their answers? Wouldn't it just be a simple equality
check?*

Ah, glad you asked! I've tried many flashcard systems, and automatic answer checking just
adds too many hassles. Some answers are cumbersome to type out, silly typos will get
reported as wrong answers, and some questions can't simply be answered in a short string
of text.
###END ORIGINAL COMMENT

(I have no demo gifs prepared at this time.)

```
Usage:
  fla.sh
  fla.sh w(rite) <file...>
  fla.sh t(est)  <file...>
  fla.sh e(rase) <file...>
```

### ORIGINAL COMMENT
This script depends on GNU `shuf`, which comes bundled on any sane Linux distro, but not
on OSX. You can install it through [Homebrew](http://brew.sh) with `brew install coreutil
`, but then `shuf` will be installed as `gshuf`, so you'll need to either alias it (
alias shuf='gshuf'`) or edit the script locally to change the `shuf` call to `gshuf`.
###END ORIGINAL COMMENT
