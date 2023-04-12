---
title: "Generating Music from Text Notation"
excerpt: "An investigation into playing actual audio from a couple lines of ABC notation"
color: rgb(25, 115, 150)
---

What's the current state of playing music in a web browser?

Meaning; given instructions on what notes to play (duration, pitch, etc), what does it take to actually hear some music?

## Motivation

I discovered [ABC Notation](https://abcnotation.com/) recently. I already love text files and traditional music, so I'm all over this thing. Even better, it integrates with [Obsidian](https://obsidian.md/). This means I'm close to a place where I can have a text file for each song I'm learning with Mandolin tabulature and a playable melody.

Have already:
- Huge Database of traditional music (thank you, [ABC Tune Search](https://abcnotation.com/tunes))
- Turn simple text into sheet music and tabulature
- Integrates with my favorite text notes app

Wanted:
- a "play" button

Actually playing music in a browser seems... weirdly difficult.

I say "wierdly" because webpage background [MIDI](https://en.wikipedia.org/wiki/MIDI) files were a thing like 30 years ago, but today it's kind of tricky to "just play" something. This investigation will be the bulk of this article.


## The Song

Here's a song I'm learning called "Turkey in the Straw" ([video](https://youtu.be/_aQonnNSATk?t=110)), represented in the ABC Notation format:

```
X:1
T:Turkey in the Straw
F:http://www.banjolin.co.uk/tunes/abcs/turkeyinstraw.abc
M:4/4
L:1/4
K:G
B/2A/2|: G/2F/2G/2A/2 G B,/2C/2| D/2E/2D/2B,/2 D G/2A/2| BB  B/2A/2G/2A/2|BAA B/2A/2|
      |G/2F/2G/2A/2 G B,/2C/2| D/2E/2D/2B,/2 D G/2A/2| B d d/2B/2G/2A/2|1BAG B/2A/2:|2BAG A|
      |:B/2dB/2 dd| B/2dB/2 d2| c/2ec/2 ee| c/2ec/2  ef|
      | gg dd| B/2dB/2  AG/2A/2| Bd  d/2B/2G/2A/2|1 BA GA:|2 BAG B/2A/2|
```

This format is pretty readable. We can see it's specifying Key of G (`K:G`), that the typical note length is a quarter note (`L:1/4`), and the meter is 4/4.

All the stuff at the bottom is the definition of what notes to play, for how long, and where the measures and repeats are.



## Going from Text to Music

Let's try working on this song with [ABCJS](https://www.abcjs.net/).

We can generate visual sheet music like this:

```js
ABCJS.renderAbc("output-area", SONG);
```

<script async src="//jsfiddle.net/simplgy/9yx4wg7z/5/embed/result/"></script>

This is already really cool, because it's rendered an SVG and the individual notes are addressable, which means you can highlight them as a song is played.

Next, we can add tabs, because maybe some people (🙋‍♂️) can't read sheet music:

```js
ABCJS.renderAbc("output-area", SONG, {
  tablature: [{instrument: 'violin'}]
});
```

<script async src="//jsfiddle.net/simplgy/9yx4wg7z/9/embed/result/"></script>


## Playing the Song as Audio

Now the main goal, let's play the song, so we can tell if our practice matches what we're supposed to play.

This involves a few too many steps, but it's manageable. Here's how it looks:

```js
const visualObj = ABCJS.renderAbc("output-area", SONG)[0];
const midiBuffer = new ABCJS.synth.CreateSynth();
const audioContext = new AudioContext();

// browsers won't play sound unless it's based on a user event
document.querySelector("button.play").addEventListener("click", () => audioContext.resume().then(onAudioContextResumed););
document.querySelector("button.stop").addEventListener("click", () => midiBuffer.stop(););

function onAudioContextResumed() {
  // preloads and caches all notes needed. may be significant network traffic
  return midiBuffer.init({
    visualObj: visualObj,
    audioContext: audioContext,
    millisecondsPerMeasure: visualObj.millisecondsPerMeasure()
  })
  .then(() => midiBuffer.prime()) // actually builds the output buffer.
	.then(() => {
    midiBuffer.start(); // At this point, everything slow has happened.
    return Promise.resolve();
  })
  .catch(console.warn.bind(console));
}
```


One final tweak, let's have adjustable speed to better support our "learning this song" beginner use case.

Add a slider:

```html
<input type="range" class="speed" name="Song Speed" min="5" max="300" step="5">
```

Wire it up to a reset that seems to need debouncing:

```js
speedSlider.addEventListener('input', onChangeSpeed);

const reset = debounce(() => {
	onClickStop();
  onClickPlay();
});

function onChangeSpeed() {
  reset();
}
```

Mix in some conversion functions from bpm to ms-per-measure and we're done.

## All Together Demo

Here it is on JSFiddle, a playable song with sheet music and tabs based on just a few lines of text definition:

<script async src="//jsfiddle.net/simplgy/9yx4wg7z/97/embed/result/"></script>



