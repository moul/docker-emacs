;; self check and compile
(defun self_check_and_compile! (a b)
  (cond
   ((file-newer-than-file-p a b)
    (let ((mode-line-format "*** Recompiling FROM ***"))
      (yow)
      (sit-for 1)
      (byte-compile-file a)
      (message "TO recompiled --- reloading..."))
    (load b t t t)
    )))
(self_check_and_compile! "~/.emacs.el" "~/.emacs.elc")

;; Marmalade
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; Disable backups
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq create-lockfiles nil)

;; Enable server-mode
(setq server-host "0.0.0.0")
(setq server-port "4242")
(setq server-use-tcp t)
(server-start)
