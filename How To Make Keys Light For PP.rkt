;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |How To Make Keys Light For PP|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;;This is an extra program for the main program "Piano Prodigy"
;;;This code allows you to queue the lights on the piano to light up
;;; - based on any song's notes
;
;;;How-To
;;;Your function is going to start off as
;;;;;;(define (whattolightup... ws) where the ... is the short name of your song (Ex. (whattolightupsilent ws) for Silent Night)
;;;The first selector in the condition statement will always be
;;;;;;[(and (> (pstream-current-frame ps) (iframe ws)) (< (pstream-current-frame ps) (...key2 ws))) (make-ws #f #f #t #f (ws-difficulty ws) #f (make-song (song-shortname (ws-song ws)) #t #f "...") (ws-score ws) #f 3 4 #f #f #f (ws-currentframe ws) (...key2 ws) #f)]
;;;;;;where the first and last blanks will be the shortname of your song (Ex. (silentkey2 ws) for Silent Night)
;;;;;;and the middle blank will be the letter of the first key of the song (Ex. "F" for Jingle Bells)
;;;The rest of the selectors (excluding the last two) will be like this
;;;;;;[(and (> (pstream-current-frame ps) (ws-fra ws)) (< (pstream-current-frame ps) (...key. ws)) (make-ws #f #f #t #f (ws-difficulty ws) #f (make-song (song-shortname (ws-song ws)) #t #f "...") (ws-score ws) #f 3 4 #f #f #f (ws-currentframe ws) (...key. ws) #f)]
;;;;;;where the first and last blanks will be the shortname of your song allow with one number up from the note's position in the song
;;;;;;and the middle blanks will be the letter of the key that goes with that note, for example with the national anthem
;;;;;;[(and (> (pstream-current-frame ps) (ws-fra ws)) (< (pstream-current-frame ps) (usakey3 ws)) (make-ws #f #f #t #f (ws-difficulty ws) #f (make-song (song-shortname (ws-song ws)) #t #f "E") (ws-score ws) #f 3 4 #f #f #f (ws-currentframe ws) (usakey3 ws) #f)]
;;;;;;[(and (> (pstream-current-frame ps) (ws-fra ws)) (< (pstream-current-frame ps) (usakey4 ws)) (make-ws #f #f #t #f (ws-difficulty ws) #f (make-song (song-shortname (ws-song ws)) #t #f "C") (ws-score ws) #f 3 4 #f #f #f (ws-currentframe ws) (usakey4 ws) #f)]
;;;;;;[(and (> (pstream-current-frame ps) (ws-fra ws)) (< (pstream-current-frame ps) (usakey5 ws)) (make-ws #f #f #t #f (ws-difficulty ws) #f (make-song (song-shortname (ws-song ws)) #t #f "E") (ws-score ws) #f 3 4 #f #f #f (ws-currentframe ws) (usakey5 ws) #f)]
;;;The last two in the condition will be the queue for a 
;The things you will change will be the iframe, (giveme 1 ws), the letter near the middle of the line, for example "C", and the second to last function
;The first line of the song wil not change [(and (> (pstream-current-frame ps) (+ (ws-currentframe ws) iframe)), it will only change the second part
;For each (giveme 1 ws), you will need to type (giveme) first because that's the name of the function I created
;and then put in the length of the note in the song. So ultimately the first giveme in the code will match with the first (thisnote) of a song and so on
;After the first line, the first thing to change will always change to (ws-fra ws) for each line
;The second thing could be (giveme 4 ws) or (giveme 2 ws) or just whatever note comes up
;The next thing to change is the letter at the end that represents the note that you are playing
;Don't worry about the number just the letter
;If you have a (si...) in the song, just put "none" as the letter in the middle
;Lastly, put exactly what you put in the second thing to change in the last thing to change
;Once you are done making the code, try it out by putting it right below the whattolightuptwinkle code in the main program and running the program
;Also don't worry about the first silence at the start of every song 
;If you have any questions, obviously just ask me
;Here's an example for a song that has (thisnote C4 1 difficulty) (thisnote D4 2 difficulty) (thisnote E4 1 difficulty) (thisnote G4 2 difficulty) (thisnote E4 1 difficulty)))
(define (examplecode ws)
  (cond
    [(and (> (pstream-current-frame ps) (+ (ws-currentframe ws) iframe)) (< (pstream-current-frame ps) (+ (ws-currentframe ws) (giveme 1 ws)))) (make-ws #f #f #t #f (ws-difficulty ws) #f (make-song (song-shortname (ws-song ws)) #t #f "C") (ws-score ws) #f 3 4 #f #f #f (ws-currentframe ws) (giveme 1 ws) #f)]
    [(and (> (pstream-current-frame ps) (+ (ws-currentframe ws) (ws-fra ws))) (< (pstream-current-frame ps) (+ (ws-currentframe ws) (giveme 2 ws)))) (make-ws #f #f #t #f (ws-difficulty ws) #f (make-song (song-shortname (ws-song ws)) #t #f "D") (ws-score ws) #f 3 4 #f #f #f (ws-currentframe ws) (giveme 2 ws) #f)]
    [(and (> (pstream-current-frame ps) (+ (ws-currentframe ws) (ws-fra ws))) (< (pstream-current-frame ps) (+ (ws-currentframe ws) (giveme 1 ws)))) (make-ws #f #f #t #f (ws-difficulty ws) #f (make-song (song-shortname (ws-song ws)) #t #f "E") (ws-score ws) #f 3 4 #f #f #f (ws-currentframe ws) (giveme 1 ws) #f)]
    [(and (> (pstream-current-frame ps) (+ (ws-currentframe ws) (ws-fra ws))) (< (pstream-current-frame ps) (+ (ws-currentframe ws) (giveme 2 ws)))) (make-ws #f #f #t #f (ws-difficulty ws) #f (make-song (song-shortname (ws-song ws)) #t #f "G") (ws-score ws) #f 3 4 #f #f #f (ws-currentframe ws) (giveme 2 ws) #f)]
    [(and (> (pstream-current-frame ps) (+ (ws-currentframe ws) (ws-fra ws))) (< (pstream-current-frame ps) (+ (ws-currentframe ws) (giveme 1 ws)))) (make-ws #f #f #t #f (ws-difficulty ws) #f (make-song (song-shortname (ws-song ws)) #t #f "E") (ws-score ws) #f 3 4 #f #f #f (ws-currentframe ws) (giveme 1 ws) #f)]