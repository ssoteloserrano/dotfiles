;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; General Configuration
(setq user-full-name "Scar")

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-hook 'window-setup-hook #'doom-display-benchmark-h)

(setq
 doom-font (font-spec :family "Source Code Pro" :size 20)
 )

(map! :n "ff" #'find-file)

(setq auto-save-default t
      make-backup-files t)

(setq confirm-kill-emacs nil)

(defconst doom-frame-transparency 90)
(set-frame-parameter (selected-frame) 'alpha doom-frame-transparency)
(add-to-list 'default-frame-alist `(alpha . ,doom-frame-transparency))
(defun dwc-smart-transparent-frame ()
  (set-frame-parameter
   (selected-frame)
   'alpha (if (frame-parameter (selected-frame) 'fullscreen)
              100
            doom-frame-transparency)))

(setq doom-theme 'doom-dracula)
(map! :leader
      :desc "Load new theme" "h t" #'counsel-load-theme)

(custom-set-faces!
  '(doom-dashboard-banner :inherit default)
  '(doom-dashboard-loaded :inherit default))

(setq-default word-wrap t)
(toggle-truncate-lines -1)

(setq display-line-numbers-type t)

;; ORG-MODE

(after! org
  (setq org-directory "~/Dropbox/org/")

  (setq org-agenda-files
        '("~/Dropbox/org/"
          "~/Dropbox/org/daily/"
          "~/Dropbox/org/work/"))

  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  (setq org-todo-keywords
        '((sequence "TODO(t)" "ONGOING(o)" "|" "DONE(d!)")
          (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "REVIEW(v)" "WAIT(w@/!)" "|" "COMPLETED(c)" "CANC(k@)")
          (sequence "LLORAR(b)" "QUEJARSE DE LA U(p)" "READY(r)" "REVIEW TUTORA(v)" "WAIT(w@/!)" "|" "COMPLETED(c)" "CANC(k@)")))

  (setq
   org-superstar-headline-bullets-list '("◉" "○" "✸" "✿" "⁖")
   )
  (setq org-ellipsis " ▼ ")
  )

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.5)
  (add-hook 'after-init-hook 'global-company-mode)
  ;;(setq company-minimum-prefix-length 3)
  )

(after! elpy
  (set-company-backend! 'elpy-mode
    '(elpy-company-backend :with company-files company-yasnippet)))

;; (use-package
;;   elpy
;;   :ensure t
;;   :commands elpy-enable
;;   :after company
;;   :config
;;   (setq elpy-modules '(elpy-module-company
;; 		       elpy-module-pyvenv
;; 		       elpy-module-highlight-indentation
;; 		       elpy-module-sane-defaults
;; 		       elpy-module-yasnippet))
;;   )

(use-package python
  :mode ("\\.py" . python-mode)
  :ensure t
  ;; :init
  ;; (add-hook 'python-mode-hook #'elpy-enable)
  )

;; (use-package pyvenv)

;; Doom Modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  )
(setq doom-modeline-height 25)
(setq doom-modeline-bar-width 4)
(setq doom-modeline-window-width-limit fill-column)
(setq doom-modeline-project-detection 'auto)
(setq doom-modeline-buffer-file-name-style 'auto)
(setq doom-modeline-icon (display-graphic-p))
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-buffer-modification-icon t)
(setq doom-modeline-unicode-fallback nil)
(setq doom-modeline-minor-modes nil)
(setq doom-modeline-enable-word-count nil)
(setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))
(setq doom-modeline-buffer-encoding t)
(setq doom-modeline-checker-simple-format t)
(setq doom-modeline-number-limit 99)
(setq doom-modeline-vcs-max-length 12)
(setq doom-modeline-workspace-name t)
(setq doom-modeline-persp-name t)
(setq doom-modeline-display-default-persp-name nil)
(setq doom-modeline-persp-icon t)
(setq doom-modeline-lsp t)
(setq doom-modeline-github nil)
(setq doom-modeline-github-interval (* 30 60))
(setq doom-modeline-modal-icon t)
(setq doom-modeline-gnus t)
(setq doom-modeline-gnus-timer 2)
(setq doom-modeline-gnus-excluded-groups '("dummy.group"))
(setq doom-modeline-irc t)
(setq doom-modeline-irc-stylize 'identity)
(setq doom-modeline-env-version t)
(setq doom-modeline-env-enable-python t)
(setq doom-modeline-env-python-executable "python") ; or `python-shell-interpreter'
(setq doom-modeline-env-load-string "...")
(setq doom-modeline-before-update-env-hook nil)
(setq doom-modeline-after-update-env-hook nil)

(setq +format-on-save-enabled-modes
      '(not emacs-lisp-mode
        python-mode
        json-mode
        sql-mode
        tex-mode
        org-mode
        latex-mode))

;; Avoid Warning
(require 'loadhist)
;; (file-dependents (feature-file 'cl))
