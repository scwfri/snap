(let [snap (require :snap)
      general (snap.get :producer.ripgrep.general)]
  (fn [request]
    (let [cwd (snap.sync vim.fn.getcwd)]
      (general request {:args [:--line-buffered :-M 100 :--vimgrep request.filter] : cwd}))))
