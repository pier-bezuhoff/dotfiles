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
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (flycheck company-irony irony-eldoc irony multiple-cursors elpy))))
 '(coq-prog-args '("-R" "~/Documents/Additional/Math/Coq/cpdt/src" "Cpdt"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; (add-to-list 'auto-mode-alist '("\\.kv\\'" . kivy-mode))
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))


;; look
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; (menu-bar-mode -1)
(column-number-mode 1)
;; (global-linum-mode t)

;; installation
(package-initialize)
;; (package-refresh-contents)

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme 'monokai t)
;; (load-theme 'material t)

(fset 'yes-or-no-p 'y-or-n-p) ;; space as yes
(setq inhibit-startup-message t)
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq matlab-shell-command "octave-cli")
(setq matlab-comment-region-s "% ")
(elpy-enable)
(setq python-indent 4)
(setq c-basic-offset 4)
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "-i --simple-prompt")
;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

;; (recentf-mode 1)
;; (setq recentf-max-menu-items 25)

;; for Proof General (Coq)
;; (load "~/.emacs.d/lisp/PG/generic/proof-site")

(add-hook 'c-mode-hook
          (lambda ()
            (irony-mode 1)
            (company-mode 1)
            (flycheck-mode 1)
            (irony-eldoc)
            (irony-cdb-autosetup-compile-options)))
(add-hook 'haskell-mode-hook 'intero-mode)
(add-hook 'octave-mode-hook
		  (lambda ()
			(abbrev-mode 1)
			(auto-fill-mode 1)
			(if (eq window-system 'x)
				(font-lock-mode 1))))

;; my key bindings
(defun new-line-down ()
  "vim-like o"
  (interactive)
  (move-end-of-line nil)
  (newline)
  (indent-for-tab-command))

(defun new-line-up ()
  "vim-like O"
  (interactive)
  (move-beginning-of-line nil)
  (newline)
  (previous-line)
  (indent-for-tab-command))

(defun kill-line-spaces ()
  "kill chars to eol"
  (interactive)
  (set-mark-command nil)
  (move-end-of-line nil)
  (delete-active-region))

(defun double-newline ()
  (interactive)
  (move-end-of-line nil)
  (newline)
  (newline)
  (indent-for-tab-command))

(defun comment-line ()
  "comment/uncomment line (using 'comment-dwim)"
  (interactive)
  (move-end-of-line nil)
  (back-to-indentation)
  (set-mark-command nil)
  (move-end-of-line nil)
  (comment-dwim nil))

(defun kill-word-end ()
  (interactive)
  (set-mark-command nil)
  (forward-word)
  (forward-word)
  (backward-word)
  (delete-active-region))

(defun kill-upto-word ()
  (interactive)
  (set-mark-command nil)
  (forward-word)
  (backward-word)
  (delete-active-region))

(defun double-line ()
  (interactive)
  (move-beginning-of-line nil)
  (kill-line)
  (yank)
  (newline)
  (yank))

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
      (insert region))
    (goto-char (+ (point) col))))


;; C-S-* and S-* doesn't work form terminal
;; (global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key (kbd "M-<up>") 'move-line-or-region-up)
(global-set-key (kbd "M-<down>") 'move-line-or-region-down)
(global-set-key (kbd "S-SPC") '(lambda () (interactive) (insert " ") (backward-char)))
(global-set-key (kbd "C-o") 'new-line-down)
(global-set-key (kbd "C-S-o") 'new-line-up)
(global-set-key (kbd "M-o RET") '(lambda () (interactive) (move-end-of-line nil) (newline)))
(global-set-key (kbd "M-o M-RET") '(lambda () (interactive) (move-beginning-of-line nil) (newline)))
(global-set-key (kbd "C-S-k") 'kill-line-spaces)
(global-set-key (kbd "C-S-r") 'desktop-read) 
(global-set-key (kbd "C-S-s") '(lambda () (interactive) (desktop-save user-emacs-directory)))
(global-set-key (kbd "C-S-h") '(lambda () (interactive) (move-to-window-line 0)))
(global-set-key (kbd "C-S-m") '(lambda () (interactive) (move-to-window-line nil)))
(global-set-key (kbd "C-S-l") '(lambda () (interactive) (move-to-window-line -1)))
(global-set-key (kbd "C-S-j") '(lambda () (interactive) (next-line) (join-line)))
(global-set-key (kbd "M-H") '(lambda () (interactive) (recenter 0)))
(global-set-key (kbd "M-M") '(lambda () (interactive) (recenter)))
(global-set-key (kbd "M-L") '(lambda () (interactive) (recenter -1)))
(global-set-key (kbd "M-n") 'newline)
(global-set-key (kbd "M-RET") 'double-newline)
(global-set-key (kbd "C-;") 'comment-line)
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
(global-set-key (kbd "C-S-v") '(lambda () (interactive) (move-beginning-of-line nil) (set-mark-command nil) (move-end-of-line nil)))

;; free: C-M-y, M-n, M-p

;; multiple-cursors
;; (add-to-list 'package-archives )
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c C-.") 'mc/mark-next-like-this-word)
(global-set-key (kbd "C-S-c C-,") 'mc/mark-previous-like-this-word)
(global-set-key (kbd "C-S-c C->") 'mc/mark-next-like-this-symbol)
(global-set-key (kbd "C-S-c C-<") 'mc/mark-previous-like-this-symbol)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this-dwim)
