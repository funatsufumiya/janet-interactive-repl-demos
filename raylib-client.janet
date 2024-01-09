(import spork/netrepl)
(netrepl/client)

# try this in the repl:
# (def env (curenv))
# (get env :circle-outer-color)
# (put env :circle-outer-color :blue)
# (get env :line-bezier-color)
# (put env :line-bezier-color :orange)
# (def draw2 '(fn [] (clear-background [0 0 0]) ))
# (put env :draw_fn_sexp draw2)
# (def draw3 '(fn [] (clear-background [0 0 0]) (let [[x y] (get-mouse-position)] (draw-rectangle (- (math/floor x) 30) (- (math/floor y) 30) 60 60 :red)) ))
# (put env :draw_fn_sexp draw3)