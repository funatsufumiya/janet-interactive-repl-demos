(import spork/netrepl)

(def env (make-env))

(put env :message "hello")
(put env :delay 1)

(defn date-str []
  (def d (os/date))
  # ex: {:dst false :hours 5 :minutes 27 :month 0 :month-day 8 :seconds 6 :week-day 2 :year 2024 :year-day 8}
  # return ex: "2024-01-08 05:27:06"
  (string/format "%04d-%02d-%02d %02d:%02d:%02d"
    (d :year)
    (inc (d :month))
    (inc (d :month-day))
    (d :hours)
    (d :minutes)
    (d :seconds)))

(defn worker [env]
  (forever
    (print "[" (date-str) "] " (env :message))
    (ev/sleep (env :delay))))

(defn value-change-worker [env del mes]
  (ev/sleep del)
  (put env :message mes)
  (print "(value-change-worker) changed message to " mes))

# (defn repl-server [env]
#   (netrepl/server "127.0.0.1" 9365 env))

(ev/call worker env)
(ev/call value-change-worker env 5 "hello world")
# (ev/call repl-server env)
# (repl-server root-env)

# (netrepl/server)
(netrepl/server "127.0.0.1" 9365 env)