(require '[clojure.string :as stri])

(def Q 16) (def H 8) (def W 4) (def D 2) (def x "x")

(defn extra-semitones
  "given a number it returns as many semitone symbols as needed"
  [number]
  (clojure.string/join (repeat number "+")))

(defn guitar-note
  "given a string and a fret number it returns a note in Alda syntax"
  [string fret]
  (if (= string 1) (str "o4 e" (extra-semitones fret))
    (if (= string 2) (str "o3 b" (extra-semitones fret))
      (if (= string 3) (str "o3 g" (extra-semitones fret))
        (if (= string 4) (str "o3 d" (extra-semitones fret))
          (if (= string 5) (str "o2 a" (extra-semitones fret))
            (if (= string 6) (str "o2 e" (extra-semitones fret)) (str "r"))))))))



(defn tab-str
  "given a tab-note it returns a note in Alda syntax as a string"
  [string-fret & [duration]]
  (if (.contains (str string-fret) ".")  (def sf (stri/split (str string-fret) #"\."))
   (def sf [(str string-fret) "0"]))
  (str (guitar-note (read-string (nth sf 0)) (read-string (nth sf 1))) duration))


(defn chord-str
  "given a list of tab-notes and a duration it executes a chord of Alda notes"
  [duration one two three four five six]

  (if (.contains (str one)    "x")  (def one    "x")   (def one    (str   "1." one)))
  (if (.contains (str two)    "x")  (def two    "x")   (def two    (str   "2." two)))
  (if (.contains (str three)  "x")  (def three  "x")   (def three  (str   "3." three)))
  (if (.contains (str four)   "x")  (def four   "x")   (def four   (str   "4." four)))
  (if (.contains (str five)   "x")  (def five   "x")   (def five   (str   "5." five)))
  (if (.contains (str six)    "x")  (def six    "x")   (def six    (str   "6." six))))

   (str   "V1: " (tab-str one duration)    " V2: " (tab-str two duration)
                    " V3: " (tab-str three duration)  " V4: " (tab-str four duration)
                    " V5:" (tab-str five duration)    " V6: " (tab-str six duration) " ")


(c Q 3 x x x x x)
