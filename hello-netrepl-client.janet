(import spork/netrepl)
(netrepl/client)

# try this in the repl:
# (setdyn :message "hello from repl")
# (setdyn :delay 2)


# NOTE:
# (setdyn :aaa bbb)
#   can be replaced to
# (def env (curenv))
# (put env :aaa bbb)