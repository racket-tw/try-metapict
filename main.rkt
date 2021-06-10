#lang racket

(require metapict)

(def p1 (pt   0 100))
(def p2 (pt 100 100))
(def p3 (pt 200 100))
(def p4 (pt   0   0))
(def p5 (pt 100   0))
(def p6 (pt 200   0))

(with-window (window -10 210 -5 105)
  (draw
   (curve p1 .. p6)
   (curve p2 .. p5)
   (curve p3 .. p4)))
(with-window (window -10 210 -5 105)
  (draw (curve p1 .. p6)))

;;; label
(def A (pt 0 0))
(def B (pt 3 2))
(with-window (window -1 4 -1 3)
  (draw (dot-label "A" A              (top))
        (dot-label "C" (med 0.25 A B) (top))
        (dot-label "D" (med 0.5  A B) (bot))
        (dot-label "E" (med 0.75 A B) (bot))
        (dot-label "B" B              (bot))))

;;; four A
(define (A- w h α)
  (set-curve-pict-size w h)
  (def p1 (pt    0    0))
  (def p2 (pt (/ w 2) h))
  (def p3 (pt    w    0))
  (def p4 (med α p1 p2))
  (def p5 (med α p3 p2))
  (with-window (window 0 w 0 h)
    (draw (curve p1 .. p2)
          (curve p2 .. p3)
          (curve p4 .. p5))))
(list (A- 10 20 0.3)
      (A- 10 20 0.4)
      (A- 10 20 0.5)
      (A- 10 20 0.6))

(penwidth 4 (draw (color "red"     (draw      origo))
                  (color "green"   (draw (pt+ origo north)))
                  (color "blue"    (draw (pt+ origo south)))
                  (color "magenta" (draw (pt+ origo left)))
                  (color "purple"  (draw (pt+ origo right)))))

(set-curve-pict-size 50 50)
(with-window (window -1.1 1.1 -1.1 1.1)
  (penwidth 4 (draw* (for/list ([θ (in-range 0 (* 2 pi) (/ (* 2 pi) 12))])
                       (pt@ 1 θ)))))

(with-window (window 0 1 0 1)
  (apply beside (for/list ([f (in-range 0 11/10 1/10)])
                  (color f "red" (fill unitsquare)))))
