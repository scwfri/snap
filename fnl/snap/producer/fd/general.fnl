(let [snap (require :snap)
      io (require :snap.io)]
  (fn [args request]
    (local cwd (snap.sync vim.fn.getcwd))
    (each [data err kill (io.spawn :fd args cwd)]
      (if request.cancel (do
                           (kill)
                           (coroutine.yield nil))
          (not= err "") (coroutine.yield nil)
          (= data "") (coroutine.yield [])
          (coroutine.yield (vim.split data "\n" true))))))