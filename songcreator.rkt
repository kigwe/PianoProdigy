;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname pianoprodigysongcreator) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;;This is an extra program for the main program "Piano Prodigy"
;;;This code allows you to format any song into our program properly
;;;- with little to no restrictions
;
;;;How-To
;;;Under the comment "Notes For Piano" includes all of the notes
;;;- that are available in our program
;;;Using those notes and a song that you want to put into our program, use
;;;- the (thisnote) function to add a note to your song
;;;;;;.25 stands for a sixteenth note (1/16 of a measure)
;;;;;;.5 stands for a eighth note (1/8 of a measure)
;;;;;;1 stands for a quarter note (1/4 of a measure)
;;;;;;2 stands for a half note (1/2 of a measure)
;;;;;;3 typically stands for a whole note on a 3/4 signature (3/3 of a measure)
;;;;;;4 stands for a whole note (4/4 of a measure)
;;;If there's a silence in the song, use the (si) function
;;;Every song also starts with a 7 second silence to help everything load,
;;;- so make sure to add that at the beginning of your song
;;;After using (rs-append) to attach all of the notes together, go into
;;;- main program, find where it has all the pre-installed songs and paste your song there
;;;After that, you will need to add your song to the (listofplayablesongs), you will need
;;;- to add a mouse event similar to the pre-installed songs that will make your song a part
;;;- of the world state, and then wherever there are clauses for the other songs to play,
;;;- add in your song
;;;If you have any further questions or need help, contact the Big Bangers for more information

;Example
;(define (playbday difficulty) (rs-append (silence (* FRAME-RATE 7) (thisnote D4 .5 difficulty) (thisnote D4 .5 difficulty) (thisnote E4 1 difficulty) (thisnote D4 1 difficulty)
;(thisnote G4 1 difficulty) (thisnote F#4 2 difficulty) (thisnote D4 .5 difficulty) (thisnote D4 .5 difficulty) (thisnote E4 1 difficulty) (thisnote D4 1 difficulty)
;(thisnote A4 1 difficulty) (thisnote G4 2 difficulty) (thisnote D4 .5 difficulty) (thisnote D4 .5 difficulty) (thisnote D5 1 difficulty) (thisnote B4 1 difficulty)
;(thisnote G4 1 difficulty) (thisnote F#4 1 difficulty) (thisnote E4 2 difficulty) (thisnote C5 .5 difficulty) (thisnote C5 .5 difficulty) (thisnote B4 1 difficulty)
;(thisnote G4 1 difficulty) (thisnote A4 1 difficulty) (thisnote G4 2 difficulty)))

(require rsound)
(require 2htdp/image)
(require 2htdp/universe)
(require rsound/piano-tones)

;Second Conversion
(define (sec seconds)
  (* FRAME-RATE seconds))

;Notes For Piano
(define C2
  (piano-tone 36))
(define C#2
  (piano-tone 37))
(define D2
  (piano-tone 38))
(define D#2
  (piano-tone 39))
(define E2
  (piano-tone 40))
(define F2
  (piano-tone 41))
(define F#2
  (piano-tone 42))
(define G2
  (piano-tone 43))
(define G#2
  (piano-tone 44))
(define A2
  (piano-tone 45))
(define A#2
  (piano-tone 46))
(define B2
  (piano-tone 47))
(define C3
  (piano-tone 48))
(define C#3
  (piano-tone 49))
(define D3
  (piano-tone 50))
(define D#3
  (piano-tone 51))
(define E3
  (piano-tone 52))
(define F3
  (piano-tone 53))
(define F#3
  (piano-tone 54))
(define G3
  (piano-tone 55))
(define G#3
  (piano-tone 56))
(define A3
  (piano-tone 57))
(define A#3
  (piano-tone 58))
(define B3
  (piano-tone 59))
(define C4
  (piano-tone 60))
(define C#4
  (piano-tone 61))
(define D4
  (piano-tone 62))
(define D#4
  (piano-tone 63))
(define E4
  (piano-tone 64))
(define F4
  (piano-tone 65))
(define F#4
  (piano-tone 66))
(define G4
  (piano-tone 67))
(define G#4
  (piano-tone 68))
(define A4
  (piano-tone 69))
(define A#4
  (piano-tone 70))
(define B4
  (piano-tone 71))
(define C5
  (piano-tone 72))
(define C#5
  (piano-tone 73))
(define D5
  (piano-tone 74))
(define D#5
  (piano-tone 75))
(define E5
  (piano-tone 76))
(define F5
  (piano-tone 77))
(define F#5
  (piano-tone 78))
(define G5
  (piano-tone 79))
(define G#5
  (piano-tone 80))
(define A5
  (piano-tone 81))
(define A#5
  (piano-tone 82))
(define B5
  (piano-tone 83))
(define C6
  (piano-tone 84))

;Initial Tempo
(define TEMPOi 120)

;Length represents the length of a note where
;1 represents 1 beat of music
;Tempo represents the overall tempo of a song

;PS: To take in a length of a note along with the tempo and convert it into
; the correct length
; Number Number -> Number
(define (convert-tempo LENGTH TEMPO)
  (* LENGTH (/ FRAME-RATE (/ TEMPO 60))))

;Note represents a note name on the piano scale (eg. C4)
;Length repressents the length of a note
;Difficulty represents the difficulty of the song

;PS: To take in a note, length, and difficulty and produce an rsound with
; the given characteristics
; Note Number String -> RSound
(define (thisnote note length difficulty)
  (clip note 0 (convert-tempo length (TEMPO difficulty))))

;Conversion of Silence Function Using Format Of ThisNote Function
(define (si length difficulty)
  (silence (convert-tempo length (TEMPO difficulty))))

;The initial tempo is multiplied by one of
; -.75, for easy mode, or
; 1, for medium mode, or
; 1.5, for hard mode

;PS: To take in a difficulty and multiply the initial tempo by a certain number
; to create a new tempo for the song
; String -> Number
(define (TEMPO difficulty)
  (cond
    [(string=? difficulty "easy") (* TEMPOi .75)]
    [(string=? difficulty "medium") (* TEMPOi 1)]
    [(string=? difficulty "hard") (* TEMPOi 1.25)]))

;-----------------------------------------------------------START CREATING BELOW-------------------------------------------------------------------------------------;






















