;;; activity-bar.el --- VS Code like acitivity bar for emacs -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 Thomas F. K. Jorna
;;
;; Author: Thomas F. K. Jorna <hello@tefkah.com>
;; Maintainer: Thomas F. K. Jorna <hello@tefkah.com>
;; Created: March 21, 2022
;; Modified: March 21, 2022
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/thomas/activity-bar
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(defgroup activity-bar nil
  "Activity bar.")

(defcustom activity-bar-side 'left
  "Side where the activity bar should display.
Options: 'right and 'left (default)."
  :type 'symbol
  :group 'activity-bar)

(defcustom activity-bar-icon-margin-left 2
  "Left margin for the icons in the activity bar."
  :type 'number
  :group 'activity-bar)

(defcustom activity-bar-icon-margin-right 2
  "Right margin for the icons in the activity bar."
  :type 'number
  :group 'activity-bar)

(define-minor-mode activity-bar-mode
  "Display a VS Code-like activity bar in a side menu in Emacs."
  :init-value nil
  :global t
  (if activity-bar-mode
      (progn
       (get-buffer-create "*activity-bar*")
       (with-current-buffer "*activity-bar*"
         (fundamental-mode)
       (insert "\n")
         (dotimes (i activity-bar-icon-margin-left) (insert " "))
       (insert-button (concat "\n "(all-the-icons-faicon "files-o") "\n ")
                      'action (lambda (_button) (+treemacs/toggle) )
                      'face '(:height 300))

         (dotimes (i activity-bar-icon-margin-right) (insert " "))
       (insert "\n\n")
         (dotimes (i activity-bar-icon-margin-left) (insert " "))
       (insert-button (all-the-icons-material "toc")
                      'action (lambda (_button) (+treemacs/toggle) )
                      'face '(:height 300))
         (dotimes (i activity-bar-icon-margin-right) (insert " "))

         (read-only-mode)
                      )
      (display-buffer-in-side-window (get-buffer "*activity-bar*")
                                                 '(
                                                   (mode . '(fundamental-mode read-only-mode))
                                                   (side . left)
                                                   (slot . -1)
                                                   (window-width . 10))))
    (kill-buffer"*activity-bar*")))

(provide 'activity-bar)
;;; activity-bar.el ends here
