;;; evil-ex-fasd.el --- using fasd right from evil-ex  -*- lexical-binding: t; -*-

;; Copyright © 2018, Rashawn Zhang, all rights reserved.

;; Author: Rashawn Zhang <namy.19@gmail.com>
;; Created:  2 August 2018
;; Keywords: fasd, evil, navigation

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;  Invode fasd functionality right from evil-ex

;;; Code:

(require 'fasd)

(defvar evil-ex-fasd-prefix ":"
  "Prefix for evil-ex command that will invode fasd")

(defun evil-ex-fasd-eval (orig-fun str)
  "docstring"
  (interactive "P")
  (if (not (cond ((string-prefix-p evil-ex-fasd-prefix str) (funcall 'fasd-find-file t (string-remove-prefix ":" str)))))
      (funcall orig-fun str)))

(advice-add 'evil-ex-execute :around 'evil-ex-fasd-eval)

(defun evil-ex-fasd: () (interactive) (evil-ex evil-ex-fasd-prefix))

(provide 'evil-ex-fasd)
;;; evil-ex-fasd.el ends here