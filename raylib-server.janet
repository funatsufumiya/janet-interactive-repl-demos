(import spork/netrepl)
(use jaylib)

(def env (make-env))
(setdyn :circle-size 31.4)
(setdyn :circle-center-color :lime)
(setdyn :circle-outer-color :red)
(setdyn :poly-color :magenta)
(setdyn :line-bezier-color :pink)
(setdyn :line-ex-color :sky-blue)
(setdyn :line-strip-color :ray-white)

(init-window 300 300 "Test Game")
(set-target-fps 60)
(hide-cursor)

# (defn draw [] ())

(defn draw []
  (clear-background [0 0 0])
  (let [[x y] (get-mouse-position)]
    # (draw-circle-gradient (math/floor x) (math/floor y) 31.4 :lime :red)
    (draw-circle-gradient (math/floor x) (math/floor y)
      (env :circle-size)
      (env :circle-center-color)
      (env :circle-outer-color))
    # (draw-poly [500 200] 5 40 0 :magenta)
    (draw-poly [500 200] 5 40 0 (env :poly-color))
    # (draw-line-bezier
    #   [(- x 100) y]
    #   [(+ x 100) (+ y 50)]
    #   4 :pink)
    (draw-line-bezier
      [(- x 100) y]
      [(+ x 100) (+ y 50)]
      4 (env :line-bezier-color))
    # (draw-line-ex
    #   [x (- y 10)]
    #   [x (+ y 10)]
    #   4 :sky-blue)
    (draw-line-ex
      [x (- y 10)]
      [x (+ y 10)]
      4 (env :line-ex-color))
    # (draw-line-strip
    #   [[x 0] [x 100] [50 y] [10 180]]
    #   :ray-white)))
    (draw-line-strip
      [[x 0] [x 100] [50 y] [10 180]]
      (env :line-strip-color))))

(setdyn :draw_fn_sexp nil)
(setdyn :draw draw)

(defn mainloop [env]
  (while (not (window-should-close))
    (begin-drawing)

    (cond
      (nil? (env :draw_fn_sexp))
        ((env :draw))
      (not (nil? (env :draw_fn_sexp)))
        (do
          (def f (eval (env :draw_fn_sexp)))
          (setdyn :draw_fn_sexp nil)
          (setdyn :draw f)
          ((env :draw))))

    (ev/sleep 0.01)

    (end-drawing)))

(ev/call mainloop env)
(netrepl/server "127.0.0.1" 9365 env)

# (close-window)
