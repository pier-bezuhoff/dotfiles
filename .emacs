;; Emacs 29.1 works
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(wombat))
 '(custom-safe-themes
   '("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "95b0bc7b8687101335ebbf770828b641f2befdcf6d3c192243a251ce72ab1692" default))
 '(hl-sexp-background-color "#1c1f26")
 '(icicle-mode nil)
 '(package-archives
   '(("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")))
 '(package-selected-packages
   '(auctex julia-mode ghc intero helm-fuzzier helm-fuzzy-find fuzzy fzf kivy-mode paredit smartscan use-package markdown-mode yaml-mode helm-xcdoc helm-xref helm kotlin-mode idomenu iy-go-to-char flycheck company-irony irony-eldoc irony multiple-cursors elpy)))
;; '(coq-prog-args '("-R" "~/Documents/Additional/Math/Coq/cpdt/src" "Cpdt"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 114 :width normal :foundry "1ASC" :family "Droid Sans Mono")))))

(eval-when-compile
  (require 'use-package))

;; when i become brave... (M-?)
;; (add-to-list 'load-path "~/.emacs.d/icicles") (icy-mode 1)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; (add-to-list 'auto-mode-alist '("\\.kv\\'" . kivy-mode))
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
(add-to-list 'auto-mode-alist '("PKGBUILD" . shell-script-mode))
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
;; start from 0
(setq linum-format (lambda (line) (propertize (number-to-string (1- line)) 'face 'linum)))
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
;; TODO: make half-screen (now bad in minibuffer)
;; (window-height) / 2

(setq
 save-interprogram-paste-before-kill t
 backup-by-copying t
 visible-bell t
 inhibit-startup-message t
 indent-tabs-mode nil
 default-tab-width 4
 tab-width 4
 default-input-method "russian-computer" ;; C-\ toggle input method
 matlab-shell-command "octave-cli"
 matlab-comment-region-s "% "
 delete-trailing-whitespace-on-save t ;; mine, for before-save-hook
 case-fold-search nil
 case-replace nil
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
        ("::" . ?∷)
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
         ("Complex Double" . ?ℂ)
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
         ;; ("math.sqrt" . ?√)
         ;; ("sqrt" . ?√)
         ;; ("sum" . ?∑)
         ("return" . ?⟼)
         ;; ("all" . ?∀)
         ;; ("any" . ?∃)
         ;; ("for" . ?∀)
         ("oo" . ?∞)
         ("int" . ?ℤ)
         ("float" . ?ℝ)
         ("str" . ?𝕊)
         ("complex" . ?ℂ)
         ("yield" . ?⟻)
         ;; ("in" . ?∈)
         ;; ("not in" . ?∉)
         ))

      my-julia-prettify-symbols-alist
      (append
       my-prettify-symbols-alist
       '(
         ("return" . ?⟼)
         ("in" . ?∈)
         ("true" . ?𝕋)
         ("false" . ?𝔽)
         ))

      my-coq-prettify-symbols-alist
      (append
       my-prettify-symbols-alist
       '(
         ("<->" . ?⇔)
         ("Proof." . ?□)
         ("Qed." . ?■)
         ))
      prettify-symbols-alist my-prettify-symbols-alist
      python-prettify-symbols-alist my-python-prettify-symbols-alist)

(defmacro hooking (hook &rest actions)
  `(add-hook ',hook '(lambda () ,@actions)))

; smth broke w/ it
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
;; ::;;           (delq (assoc "()" haskell-font-lock-symbols-alist) haskell-font-lock-symbols-alist)
;; :::;;           (setq prettify-symbols-alist my-haskell-prettify-symbols-alist)
          ;; (intero-mode t)
          (prettify-symbols-mode t)))

(use-package julia-mode
 :config
 (hooking julia-mode-hook
          (setq prettify-symbols-alist my-julia-prettify-symbols-alist)
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

(use-package elisp-mode
 :config
 (hooking emacs-lisp-mode-hook
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

(hooking coq-mode-hook
        (menu-bar-mode t)
        (setq coq-prettify-symbols-alist (append coq-prettify-symbols-alist my-coq-prettify-symbols-alist))
        (setq prettify-symbols-alist coq-prettify-symbols-alist)
        (setq coq-prog-name "/home/pierbezuhoff/.opam/default/bin/coqtop")
        (load-file "~/Programming/Coq/math-comp/mathcomp/ssreflect/pg-ssr.el"))

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
 (global-smartscan-mode t))

(hooking before-save-hook
        (if (not indent-tabs-mode)
            (untabify (point-min) (point-max)))
        (if delete-trailing-whitespace-on-save (delete-trailing-whitespace)))
(use-package tex
 :ensure auctex)

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

(defun kill-line-backward ()
  (interactive)
  (set-mark-command nil)
  (move-beginning-of-line nil)
  (kill-region (mark) (point)))

(defun insert-space-backward () (interactive) (insert " ") (backward-char))

(defun hard-o () (interactive) (move-end-of-line nil) (newline))

(defun hard-O () (interactive) (move-beginning-of-line nil) (newline) (previous-line))

(defun move-to-top () (interactive) (move-to-window-line 0))
(defun move-to-middle () (interactive) (move-to-window-line nil))
(defun move-to-bottom () (interactive) (move-to-window-line -1))

(defun join-next-line () (interactive) (next-line) (join-line))

(defun recenter-top () (interactive) (recenter 0))
(defun recenter-middle () (interactive) (recenter))
(defun recenter-bottom () (interactive) (recenter -1))

(defun next-line-start () (interactive) (next-line) (back-to-indentation))
(defun next-line-end () (interactive) (next-line) (move-end-of-line nil))
(defun previous-line-start () (interactive) (previous-line) (back-to-indentation))
(defun previous-line-end () (interactive) (previous-line) (move-end-of-line nil))

(defun kill-sexp-backward () (interactive) (kill-sexp -1))

(defun revert-buffer-no-confirm () (interactive) (revert-buffer t t))

(defun forward-word+ () (interactive) (forward-word) (forward-char))
(defun backward-word+ () (interactive) (backward-word) (backward-char))
(defun forward-sexp+ () (interactive) (forward-sexp) (forward-char))
(defun backward-sexp+ () (interactive) (backward-sexp) (backward-char))

(defun half-screen (&optional window) (max 1 (/ (1- (window-height (or window (selected-window)))) 2)))
(advice-add 'scroll-down :before '(lambda (&optional arg) (setq next-screen-context-lines (half-screen))))
(advice-add 'scroll-up :before '(lambda (&optional arg) (setq next-screen-context-lines (half-screen))))
(advice-add 'scroll-other-window :before '(lambda (&optional arg)
                                            (setq next-screen-context-lines
                                                  (half-screen (other-window-for-scrolling)))))

;; TODO: keybindings -> assoc list -> map over it
;; C-S-* and S-* doesn't work from terminal
;; (global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key (kbd "M-F") 'forward-word+)
(global-set-key (kbd "M-B") 'backward-word+)
(global-set-key (kbd "C-M-S-f") 'forward-sexp+)
(global-set-key (kbd "C-M-S-b") 'backward-sexp+)
(global-set-key (kbd "M-<up>") 'move-line-or-region-up)
(global-set-key (kbd "M-<down>") 'move-line-or-region-down)
(global-set-key (kbd "M-S-SPC") 'insert-space-backward)
(global-set-key (kbd "C-o") 'new-line-down)
(global-set-key (kbd "C-S-o") 'new-line-up)
(global-set-key (kbd "C-M-o") 'hard-o) ;; overrides default 'split-line
(global-set-key (kbd "C-M-S-o") 'hard-O)
(global-set-key (kbd "C-S-k") 'kill-line-spaces)
(global-set-key (kbd "M-s d") 'desktop-change-dir)
(global-set-key (kbd "M-s s") 'desktop-save)
(global-set-key (kbd "C-S-h") 'move-to-top)
(global-set-key (kbd "C-S-m") 'move-to-middle)
(global-set-key (kbd "C-S-l") 'move-to-bottom)
(global-set-key (kbd "C-S-j") 'join-next-line)
(global-set-key (kbd "C-M-S-j") 'split-statement)
(global-set-key (kbd "M-H") 'recenter-top)
(global-set-key (kbd "M-M") 'recenter-middle)
(global-set-key (kbd "M-L") 'recenter-bottom)
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
(global-set-key (kbd "C-S-v") 'select-line-next) ;; works bad on empty line
(global-set-key (kbd "C-M-S-v") 'select-line-previous)
(global-set-key (kbd "C-S-n") 'next-line-start)
(global-set-key (kbd "C-M-N") 'next-line-end)
(global-set-key (kbd "C-S-p") 'previous-line-start)
(global-set-key (kbd "C-M-P") 'previous-line-end)
(global-set-key (kbd "C-S-s") 'iy-go-up-to-char) ;; repeating char -- repeating search
(global-set-key (kbd "C-S-r") 'iy-go-to-char-backward)
(global-set-key (kbd "C-]") 'iy-go-to-char) ;; shadows 'abort-recursive-edit
(global-set-key (kbd "C-M-]") 'iy-go-up-to-char-backward) ;; this 2 are a bit strange
(global-set-key (kbd "C-M-0") 'delete-window)
(global-set-key (kbd "C-M-1") 'delete-other-windows)
(global-set-key (kbd "C-M-2") 'split-window-below)
(global-set-key (kbd "C-M-3") 'split-window-right)
(global-set-key (kbd "C-M-^") 'scroll-other-window-down)
(global-set-key (kbd "C-M-g") 'revert-buffer-no-confirm)
(global-set-key (kbd "C-j") 'kill-line-backward)
(global-set-key (kbd "C-M-d") 'kill-sexp) ;; shadows 'down-list, synonym to C-M-k
(global-set-key (kbd "C-M-<backspace>") 'kill-sexp-backward)
(global-set-key (kbd "C-*") 'comint-dynamic-complete-filename)
;; M-s h [.u...] -- highlight this
;; free: C-M-y, M-s *, C-x <C-backsapce>, ...
;; multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c C-.") 'mc/mark-next-like-this-word)
(global-set-key (kbd "C-S-c C-,") 'mc/mark-previous-like-this-word)
(global-set-key (kbd "C-S-c C->") 'mc/mark-next-like-this-symbol)
(global-set-key (kbd "C-S-c C-<") 'mc/mark-previous-like-this-symbol)
(global-set-key (kbd "C->") 'mc/mark-next-like-this) ;; these two marks next/previous _line_
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this-dwim) ;; C-c C-S-.
(global-set-key (kbd "C-S-c l") 'mc/mark-pop)
(global-set-key (kbd "C-S-SPC") 'set-rectangular-region-anchor)

(define-key key-translation-map (kbd "<backtab>") (kbd "TAB"))
;; (define-key key-translation-map (kbd "<C-tab>") (kbd "TAB"))

;; M-/ = vanilla autocomplete
