(import spork/netrepl)
(netrepl/client)

# try this in the repl:
# (dyn :circle-outer-color)
# (setdyn :circle-outer-color :blue)
# (dyn :line-bezier-color)
# (setdyn :line-bezier-color :orange)
# (def draw2 '(fn [] (clear-background [0 0 0]) ))
# (setdyn :draw_fn_sexp draw2)
# (def draw3 '(fn [] (clear-background [0 0 0]) (let [[x y] (get-mouse-position)] (draw-rectangle (- (math/floor x) 30) (- (math/floor y) 30) 60 60 :red)) ))
# (setdyn :draw_fn_sexp draw3)