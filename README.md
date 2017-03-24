# alda-tabs

**Execute your guitar tabs in the Java Virtual Machine (JVM)**

![alt tag](https://raw.githubusercontent.com/dgrmunch/alda-tabs/master/img/alda-tabs.png)

## What is alda-tabs?

* *alda-tabs* is a Domain Specific Language for guitar players.
* *alda-tabs* is an extension of Alda to help guitar players to "execute" their music notes in the JVM and get audio feedback.
* *alda-tabs* is an extensible tool for music programming mainly oriented to guitar players.

## What is Alda?

*alda-tabs* is built on the top of Alda, a programming language for music composition in the JVM.

## Is difficult to learn to code guitar songs with alda-tabs?

No.

### Why?

* It does not require programming skills.
* It does not require traditional music notation.
* It is as straightforward as writing simple guitar sketches in a notebook.
* You only have to copy your tabs from the paper to a text editor and execute alda-tabs.


## Can I also create complex digital music with alda-tabs?

* Yes.

### Why?

* It talks to the JVM, so any experimented programmer can do impossible things :-)
* It is just a layer on the top of Alda, so if you know music theory, then you can write complex songs using music notation.
* With *alda-tab* you can execute any *.alda* file, so you can write your songs/programs in both Clojure, Alda and alda-tabs in the same block of text.

## How is the alda-tabs syntax?

**Note:** Remember that with **alda-tabs** you can always use the standard Alda syntax and Clojure code. You can learn more about both languages later to explore the whole potential of *alda-tabs*. But don't worry, you don't need to know more yet. Just follow this tutorial and enjoy :)

What I am gonna show you here is the easy and super simple *alda-tabs* syntax:

* The **tab notation**
* The **chord notation**

In 10 minutes you will be able to write songs in a text editor and listen the result in your speakers.


# Tab notation

Imagine that you want to play all the strings of the guitar, one after another:

![alt tag](https://raw.githubusercontent.com/dgrmunch/alda-tabs/master/img/score1.png)

In this example, no fingers are pressed on the fret.

**So the fret number would be `0` in the six positions of the sequence.**

### How would we write this in Alda?

We would need to know the note equivalents of each position and:

1. We would write the octave and the note, one after another:

```
guitar: o4 e o3 b o3 g o3 d o2 a o2 e
```

2. Or we would write just the initial octave increasing/decreasing it when needed:

```
guitar: o4 e/>b/g/d/<<a/e
```

### How to do it in alda-tabs?

Remember that *alda-tabs* is based in the simple concept of a tab. Basically, the notes of a guitar can be defined by numeric combinations, a number to identify the string (from the first at the bottom to the sixth at the top) and a fret:

![alt tag](https://raw.githubusercontent.com/dgrmunch/alda-tabs/master/img/notes-fret.png)

To write a note in *alda-tabs* you only have to write `ta` followed by the `string number` and the `fret number`.
So this sequence would be as simple as:

```
 guitar: ta10 ta20 ta30 ta40 ta50 ta60
  ```

Basically, you are asking the JMV to play a guitar with the open strings 1, 2, 3, 4, 5 and 6, one after another.
If rather than playing that sequence you want to play the note *C*, according to the graphic displayed above, you will pick the second string in the first fret.

```
 guitar: a21
 ```

You can also modify the duration of a note adding a character at the end. For example:

```
guitar: a21 a21W a21Q a21D a21H
```

What does it mean? If you don't specify a duration, this will be whole beat (W). You can also play the note during half beat (H), double (D) and quarter (Q). Those note durations will be proportional to the tempo of the score. So it is not the same:

```
(tempo 100)
guitar: a21 a21W a21Q a21D a21H
```

```
(tempo 300)
guitar: a21 a21W a21Q a21D a21H
```

*Play with this combinations to see the difference*. For more complex timing, check the *advanced tips* bellow.

# Chord notation

Imagine that rather than a sequence of notes you want to play a chord. A basic example would be playing all the open strings at the same time:

![alt tag](https://raw.githubusercontent.com/dgrmunch/alda-tabs/master/img/score2.png)

You can do this in three ways:

* In Alda syntax, using the character `/` to play the notes at the same time:

```
guitar: o4 e/>b/g/d/<<a/e
```

* In *alta-tabs* syntax, using the *tab notation* with different voices:

```
guitar: V1: ta10 V2: ta20 V3: ta30 V4: ta40 V5: ta50 V6: ta60

```

* In *alta-tabs* syntax, but using the **chord notation**:

```
guitar: (c 0 0 0 0 0 0 W)

```

As you can see, the chord syntax is a Clojure function called *c* with seven parameters, the fret of each one of the six strings and the duration of the chord.

For example, the D chord would be

```
(c 2 3 2 0 x x W)
```

![alt tag](https://raw.githubusercontent.com/dgrmunch/alda-tabs/master/img/re.png)

You can also use the *chord notation* to play single notes. For example, the two following sequences are exactly the same:

```
# alta-tab syntax

ta10 ta20 ta30 ta40 ta50 ta60

# alda-tab chord syntax
(c 0 x x x x x W)
(c x 0 x x x x W)
(c x x 0 x x x W)
(c x x x 0 x x W)
(c x x x x 0 x W)
(c x x x x x 0 W)
```

## Advanced tips

 You can play tabs with specific durations, in seconds or milliseconds by using the function **t**.
 In this case you should write the number of the string, followed by a dot and the fret. Add the end, you should express in String format ("") the duration you want.

```
 guitar: (t 1.0 "2s") (t 2.0 "10ms") (t 2.2 "100ms")
 ```

 You can do the same with your chords:

 ```
 guitar: (c 0 x 1 2 2 x "5s")
 ```

## How can I install alta-tabs?

1. Follow the steps to install Alda.
2. Clone this repo and open the folder `alda-tabs` in your terminal.
3. Run the Alda server:

```alda up```

4. Create a simple text file, write your song using the alda-tabs syntax and save it.
5. Execute `./alda-tabs.sh` followed by the path of the file you want to play.
6. Listen
7. If you want to stop a song you can stop the alda server with `alda down`.

**NOTE:** You can also can play some scores (provided in the ``/examples` folder) and modify their content to explore different sounds.
You can start exploring the potential of *alda-tabs* with chords and arpeggios with the example #01:

```./alda-tabs.sh examples/01-guitartabs-example.alda ```

Try to compose *mathematical songs* extending *Alda* and *alda-tabs* with *Clojure*. See the example #02:

```./alda-tabs.sh examples/02-pi.alda```

You can also see how beautiful songs with multiple instruments can be written with Alda with the example #03:

```./alda-tabs.sh examples/03-hope-for-future-ext.alda ```
