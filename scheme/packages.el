;;; packages.el --- scheme layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Fei Li <feili0211@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `scheme-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `scheme/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `scheme/pre-init-PACKAGE' and/or
;;   `scheme/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(setq scheme-packages
      '(paredit
        paren-face))

(defun scheme/init-paren-face ()
  (use-package paren-face
    :init
    (progn
      (add-hook 'scheme-mode-hook
                (lambda ()
                  (paren-face-mode 1))))))

(defun scheme/init-paredit ()
  (use-package paredit
    :diminish paredit-mode
    :init
    (progn
      (add-hook 'scheme-mode-hook
                (lambda ()
                  'enable-paredit-mode
                  (define-key scheme-mode-map (kbd "<f5>") 'scheme-send-last-sexp-split-window)
                  (define-key scheme-mode-map (kbd "<f6>") 'scheme-send-definition-split-window)
                  )))))

