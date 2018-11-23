(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired                                                                                           
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)                                                                           
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib                                                                                                                             
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.                                                                                                                                        
 ;; If you edit it by hand, you could mess it up, so be careful.                                                                                                                     
 ;; Your init file should contain only one such instance.                                                                                                                            
 ;; If there is more than one, they won't work right.                                                                                                                                
 '(package-selected-packages (quote (multiple-cursors company-irony irony))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.                                                                                                                                            
 ;; If you edit it by hand, you could mess it up, so be careful.                                                                                                                     
 ;; Your init file should contain only one such instance.                                                                                                                            
 ;; If there is more than one, they won't work right.                                                                                                                                
 )
(global-set-key (kbd "C-c C-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)


(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(put 'upcase-region 'disabled nil)
(add-hook 'after-init-hook 'global-company-mode)
