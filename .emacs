(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "95b0bc7b8687101335ebbf770828b641f2befdcf6d3c192243a251ce72ab1692" default)))
 '(hl-sexp-background-color "#1c1f26")
 '(icicle-mode nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (helm-fuzzier helm-fuzzy-find fuzzy fzf kivy-mode paredit smartscan use-package markdown-mode yaml-mode intero helm-xcdoc helm-xref helm kotlin-mode idomenu iy-go-to-char flycheck company-irony irony-eldoc irony multiple-cursors elpy))))
'(coq-prog-args '("-R" "~/Documents/Additional/Math/Coq/cpdt/src" "Cpdt"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; when i become brave... (M-?)
;; (add-to-list 'load-path "~/.emacs.d/icicles") (icy-mode 1)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; (add-to-list 'auto-mode-alist '("\\.kv\\'" . kivy-mode))
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
(require 'desktop)
(add-to-list 'desktop-path ".")
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; look
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(column-number-mode 1)
;; (global-linum-mode t)
(global-prettify-symbols-mode t)
;; (delete-selection-mode 1)
(setq show-paren-delay 0)
(show-paren-mode 1)

;; installation
(package-initialize)
;; (package-refresh-contents)

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme 'monokai t)
;; (load-theme 'material t)

(fset 'yes-or-no-p 'y-or-n-p) ;; space as yes

(setq
 save-interprogram-paste-before-kill t
 backup-by-copying t
 ;; TODO: as M-H, M-M, M-L
 ;; next-screen-context-lines 10 ;; now middle -> top, but bad in minibuffer
 inhibit-startup-message t
 indent-tabs-mode nil
 default-tab-width 4
 tab-width 4
 matlab-shell-command "octave-cli"
 matlab-comment-region-s "% "
 delete-trailing-whitespace-on-save t ;; mine, for before-save-hook
 )
(setq-default
 indent-tabs-mode nil
 tab-width 4)

;; for Proof General (Coq)
;; (load "~/.emacs.d/lisp/PG/generic/proof-site")

(setq prettify-symbols-unprettify-at-point 'right-edge)
(setq my-prettify-symbols-alist
      '(
        ("alpha" . ?α)
        ("beta" . ?β)
        ("gamma" . ?γ)
        ("Gamma" . ?Γ)
        ("delta" . ?δ)
        ("Delta" . ?Δ)
        ("eps" . ?ϵ)
        ("epsilon" . ?ε)
        ("zeta" . ?ζ)
        ("eta" . ?η)
        ("theta" . ?θ)
        ("th" . ?ϑ)
        ("Theta" . ?𝚯)
        ("iota" . ?ι)
        ("kappa" . ?ϰ)
        ("lambda" . ?λ)
        ("Lambda" . ?Λ)
        ("mu" . ?μ)
        ("micro" . ?µ)
        ("nu" . ?ν)
        ("xi" . ?ξ)
        ("Xi" . ?Ξ)
        ("omicron" . ?ο)
        ("pi" . ?π)
        ("Pi" . ?Π)
        ("PI" . ?Π)
        ("rho" . ?ρ)
        ("ro" . ?ρ)
        ("sigma" . ?σ)
        ("Sigma" . ?𝚺)
        ("tau" . ?τ)
        ("ups" . ?υ)
        ("upsilon" . ?υ)
        ("phi" . ?φ)
        ("Phi" . ?Φ)
        ("chi" . ?χ)
        ("psi" . ?ψ)
        ("Psi" . ?𝚿)
        ("omega" . ?ω)
        ("Omega" . ?Ω)
        ("<=" . ?≤)
        (">=" . ?≥)
        ("<-" . ?←)
        ("->" . ?→)
        ("=>" . ?⇒)
        )
      my-haskell-prettify-symbols-alist
      (append
       my-prettify-symbols-alist
       '(
         ("==" . ?≡)
         ("/=" . ?≢)
         ("sum" . ?∑)
         ("product" . ?∏)
         ("sqrt" . ?√)
         ;; ("return" . ?⟼)
         ("`elem`" . ?∈)
         ("`notElem`" . ?∉)
         ("forall" . ?∀)
         ("exists" . ?∃)
         ("all" . ?∀)
         ("any" . ?∃)
         ("fst" . ?₁)
         ("snd" . ?₂)
         ("Integer" . ?ℤ)
         ("Bool" . ?𝔹)
         ("True" . ?𝕋)
         ("False" . ?𝔽)
         ("Double" . ?ℝ)
         ("String" . ?𝕊)
         ("[Char]" . ?𝕊)
         ("Complex" . ?ℂ)
         ))
      my-python-prettify-symbols-alist
      (append
       my-prettify-symbols-alist
       '(
         ("==" . ?≡)
         ("!=" . ?≢)
         ("bool" . ?𝔹)
         ("inf" . ?∞)
         ("infinity" . ?∞)
         ("True" . ?𝕋)
         ("False" . ?𝔽)
         ("math.sqrt" . ?√)
         ("sqrt" . ?√)
         ("sum" . ?∑)
         ("return" . ?⟼)
         ;; ("all" . ?∀)
         ;; ("any" . ?∃)
         ("for" . ?∀)
         ("oo" . ?∞)
         ("int" . ?ℤ)
         ("float" . ?ℝ)
         ("str" . ?𝕊)
         ("complex" . ?ℂ)
         ("yield" . ?⟻)
         ("in" . ?∈)
         ("not in" . ?∉)
         ))
      prettify-symbols-alist my-prettify-symbols-alist
      python-prettify-symbols-alist my-python-prettify-symbols-alist)

(defmacro hooking (hook &rest actions)
  `(add-hook ',hook '(lambda () ,@actions)))

(use-package cc-mode
  :config
  (hooking c-mode-hook
           (setq prettify-symbols-alist my-prettify-symbols-alist)
           (setq c-basic-offset 4)
           (irony-mode 1)
           (company-mode 1)
           (flycheck-mode 1)
           (irony-eldoc)
           (irony-cdb-autosetup-compile-options)))

(use-package haskell-mode
  :config
  (hooking haskell-mode-hook
           (setq haskell-font-lock-symbols t)
           ;; "()" is not empty set!
           (delq (assoc "()" haskell-font-lock-symbols-alist) haskell-font-lock-symbols-alist)
           (setq prettify-symbols-alist my-haskell-prettify-symbols-alist)
           (intero-mode t)
           (prettify-symbols-mode t)))

(use-package octave
  :config
  (hooking octave-mode-hook
           (setq prettify-symbols-alist my-prettify-symbols-alist)
           (abbrev-mode 1)
           (auto-fill-mode 1)
           (if (eq window-system 'x)
               (font-lock-mode 1))))

(use-package lisp-mode
  :config
  (hooking lisp-mode-hook
           (setq prettify-symbols-alist my-prettify-symbols-alist)))

(use-package python
  :config
  (elpy-enable)
  (setq
   elpy-rpc-python-command "python3"
   python-shell-interpreter "ipython3"
   python-shell-interpreter-args "-i --simple-prompt")
  ;; (when (require 'flycheck nil t)
  ;; elpy-modules (delq elpy-module-flymake elpy-modules))
  ;; (flycheck-mode)
  (hooking python-mode-hook
           (setq python-indent 4)
           (setq prettify-symbols-alist my-python-prettify-symbols-alist)))

(use-package ido
  :init
  (ido-mode 1)
  :bind
  ("C-x :" . idomenu))

(use-package flycheck-mode
  :bind
  ("C-!" . flycheck-list-errors)
  ("C-?" . flycheck-next-error)
  ("C-M-?" . flycheck-previous-error))

(use-package smartscan
  :init
  (smartscan-mode t))

(hooking before-save-hook
         (if (not indent-tabs-mode)
             (untabify (point-min) (point-max)))
         (if delete-trailing-whitespace-on-save (delete-trailing-whitespace)))

(require 'delsel)

;; my key bindings
(defun new-line-down ()
  "Vim-like 'o'."
  (interactive)
  (move-end-of-line nil)
  (newline)
  (indent-for-tab-command))

(defun new-line-up ()
  "Vim-like 'O'."
  (interactive)
  (move-beginning-of-line nil)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(defun kill-line-spaces ()
  "Kill chars to eol."
  (interactive)
  (set-mark-command nil)
  (move-end-of-line nil)
  (delete-active-region))

(defun double-newline ()
  "Insert double newline."
  (interactive)
  (move-end-of-line nil)
  (newline)
  (newline)
  (indent-for-tab-command))

(defun comment-line ()
  "Comment/uncomment line (using 'comment-dwim)."
  (interactive)
  (move-end-of-line nil)
  (back-to-indentation)
  (set-mark-command nil)
  (move-end-of-line nil)
  (comment-dwim nil))

(defun comment-line-forward ()
  "Comment/uncomment line and move to the next."
  (interactive)
  (comment-line)
  (forward-line)
  (back-to-indentation))

(defun comment-line-backward ()
  "Comment/uncomment line and move to the previous."
  (interactive)
  (comment-line)
  (forward-line -1)
  (back-to-indentation))

(defun append-comment-forward ()
  "Append comment to the next line."
  (interactive)
  (back-to-indentation)
  (kill-line)
  (kill-whole-line)
  (move-end-of-line nil)
  (insert " ")
  (yank 2))

(defun kill-word-end ()
  "Kill punctuation, word and following punctuation."
  (interactive)
  (set-mark-command nil)
  (forward-word)
  (forward-word)
  (backward-word)
  (delete-active-region))

(defun kill-upto-word ()
  "Kill punctuation up to word."
  (interactive)
  (set-mark-command nil)
  (forward-word)
  (backward-word)
  (delete-active-region))

(defun double-line ()
  "Yank and put current line."
  (interactive)
  (move-beginning-of-line nil)
  (kill-line)
  (yank)
  (newline)
  (yank))

(defun split-statement ()
  "Split line and indent."
  (interactive)
  (just-one-space)
  (backward-delete-char 1)
  (newline)
  (indent-for-tab-command))

(defun select-line-next ()
  "Select line if no region, else select next line."
  (interactive)
  (if (use-region-p)
      (progn
        (forward-line)
        (move-end-of-line nil))
    (progn
      (move-beginning-of-line nil)
      (set-mark-command nil)
      (move-end-of-line nil))))

(defun select-line-previous ()
  "Select line if no region, else select previous line."
  (interactive)
  (if (use-region-p)
      (progn
        (forward-line -1)
        (move-beginning-of-line nil))
    (progn
      (move-end-of-line nil)
      (set-mark-command nil)
      (move-beginning-of-line nil))))

;; borrowed from elpy
(defun move-line-or-region-down (&optional beg end)
  "Move the current line or active region down."
  (interactive
   (if (use-region-p)
       (list (region-beginning) (region-end))
     (list nil nil)))
  (if beg
      (move-region-vertically beg end 1)
    (move-line-vertically 1)))

(defun move-line-or-region-up (&optional beg end)
  "Move the current line or active region down."
  (interactive
   (if (use-region-p)
       (list (region-beginning) (region-end))
     (list nil nil)))
  (if beg
      (move-region-vertically beg end -1)
    (move-line-vertically -1)))

(defun move-line-vertically (dir)
  (let* ((beg (point-at-bol))
         (end (point-at-bol 2))
         (col (current-column))
         (region (delete-and-extract-region beg end)))
    (forward-line dir)
    (save-excursion
      (insert region))))

(defun move-region-vertically (beg end dir)
  (let* ((point-before-mark (< (point) (mark)))
         (beg (save-excursion
                (goto-char beg)
                (point-at-bol)))
         (end (save-excursion
                (goto-char end)
                (if (bolp)
                    (point)
                  (point-at-bol 2))))
         (region (delete-and-extract-region beg end)))
    (goto-char beg)
    (forward-line dir)
    (save-excursion
      (insert region))
    (if point-before-mark
        (set-mark (+ (point)
                     (length region)))
      (set-mark (point))
      (goto-char (+ (point)
                    (length region))))
    (setq deactivate-mark nil)))

(defun half-screen () (max 1 (/ (1- (window-height)) 2)))
(advice-add 'scroll-down :before '(lambda (&optional arg) (setq next-screen-context-lines (half-screen))))
(advice-add 'scroll-up :before '(lambda (&optional arg) (setq next-screen-context-lines (half-screen))))
(advice-add 'scroll-other-window :before '(lambda (&optional arg) (setq next-screen-context-lines (half-screen))))

;; (defadvice scroll-down (around half-window activate)
;;   (setq next-screen-context-lines (half-screen))
;;   ad-do-it)

;; (defadvice scroll-up (around half-window activate)
;;   (setq next-screen-context-lines
;;         (max 1 (/ (1- (window-height (selected-window))) 2)))
;;   ad-do-it)

;; C-S-* and S-* doesn't work form terminal
;; (global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key (kbd "M-<up>") 'move-line-or-region-up)
(global-set-key (kbd "M-<down>") 'move-line-or-region-down)
(global-set-key (kbd "M-S-SPC") '(lambda () (interactive) (insert " ") (backward-char)))
(global-set-key (kbd "C-o") 'new-line-down)
(global-set-key (kbd "C-S-o") 'new-line-up)
(global-set-key (kbd "M-o RET") '(lambda () (interactive) (move-end-of-line nil) (newline)))
(global-set-key (kbd "M-o M-RET") '(lambda () (interactive) (move-beginning-of-line nil) (newline)))
(global-set-key (kbd "C-S-k") 'kill-line-spaces)
(global-set-key (kbd "M-s d") 'desktop-change-dir)
(global-set-key (kbd "M-s s") 'desktop-save)
(global-set-key (kbd "C-S-h") '(lambda () (interactive) (move-to-window-line 0)))
(global-set-key (kbd "C-S-m") '(lambda () (interactive) (move-to-window-line nil)))
(global-set-key (kbd "C-S-l") '(lambda () (interactive) (move-to-window-line -1)))
(global-set-key (kbd "C-S-j") '(lambda () (interactive) (next-line) (join-line)))
(global-set-key (kbd "C-M-S-j") 'split-statement)
(global-set-key (kbd "M-H") '(lambda () (interactive) (recenter 0)))
(global-set-key (kbd "M-M") '(lambda () (interactive) (recenter)))
(global-set-key (kbd "M-L") '(lambda () (interactive) (recenter -1)))
(global-set-key (kbd "M-n") 'newline)
(global-set-key (kbd "M-RET") 'double-newline)
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "C-:") 'comment-line-forward)
(global-set-key (kbd "C-M-:") 'comment-line-backward)
(global-set-key (kbd "M-K") 'append-comment-forward) ;; NOTE: C-J -- append to previous line
(global-set-key (kbd "C-S-d") 'kill-upto-word)
(global-set-key (kbd "M-D") 'kill-word-end)
(global-set-key (kbd "M-W") 'double-line)
(global-set-key (kbd "M-T") 'transpose-paragraphs)
(global-set-key (kbd "C-x C-S-e") 'eval-buffer)
(global-set-key (kbd "C-x V") 'shrink-window) ;; opposite to C-x ^ (enlarge-window)
(global-set-key (kbd "C-S-x <left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-S-x <right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-S-x <down>") 'shrink-window)
(global-set-key (kbd "C-S-x <up>") 'enlarge-window)
(global-set-key (kbd "C-S-v") 'select-line-next)
(global-set-key (kbd "C-M-S-v") 'select-line-previous)
(global-set-key (kbd "C-S-n") '(lambda () (interactive) (next-line) (back-to-indentation)))
(global-set-key (kbd "C-M-N") '(lambda () (interactive) (next-line) (move-end-of-line nil)))
(global-set-key (kbd "C-S-p") '(lambda () (interactive) (previous-line) (back-to-indentation)))
(global-set-key (kbd "C-M-P") '(lambda () (interactive) (previous-line) (move-end-of-line nil)))
(global-set-key (kbd "C-S-s") 'iy-go-up-to-char) ;; repeating char -- repeating search
(global-set-key (kbd "C-S-r") 'iy-go-to-char-backward)
(global-set-key (kbd "C-]") 'iy-go-to-char) ;; shadow 'abort-recursive-edit
(global-set-key (kbd "C-M-]") 'iy-go-up-to-char-backward) ;; this 2 are a bit strange
(global-set-key (kbd "C-M-0") 'delete-window)
(global-set-key (kbd "C-M-1") 'delete-other-windows)
(global-set-key (kbd "C-M-2") 'split-window-below)
(global-set-key (kbd "C-M-3") 'split-window-right)
;; M-s h [.u...]
;; free: C-M-y, M-s *, C-x <C-backsapce>

;; multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c C-.") 'mc/mark-next-like-this-word)
(global-set-key (kbd "C-S-c C-,") 'mc/mark-previous-like-this-word)
(global-set-key (kbd "C-S-c C->") 'mc/mark-next-like-this-symbol)
(global-set-key (kbd "C-S-c C-<") 'mc/mark-previous-like-this-symbol)
(global-set-key (kbd "C->") 'mc/mark-next-like-this) ;; these two marks next/previous _line_
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this-dwim)
(global-set-key (kbd "C-S-c l") 'mc/mark-pop)
(global-set-key (kbd "C-S-SPC") 'set-rectangular-region-anchor)
