(add-hook 'scheme-mode-hook
          (lambda ()
            (push '("lambda" . ?λ) prettify-symbols-alist)))
