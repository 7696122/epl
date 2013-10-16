;;; test-helper.el --- EPL: Unit test helpers -*- lexical-binding: t; -*-

;; Copyright (C) 2013  Sebastian Wiesner

;; Author: Sebastian Wiesner <lunaryorn@gmail.com>
;; Maintainer: Johan Andersson <johan.rejeep@gmail.com>
;;     Sebastian Wiesner <lunaryorn@gmail.com>
;; URL: http://github.com/cask/epl

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(require 'find-func)
(require 'cl-lib)
(require 'f)
(require 'epl)


(defconst epl-test-directory (f-parent (f-this-file))
  "Directory of the EPL test suite.")

(defconst epl-test-source-directory (f-parent epl-test-directory)
  "Source directory of EPL.")

;; Ensure that we test against the byte-compiled EPL from the source tree
(let ((source (symbol-file 'epl-initialize 'defun)))
  (cl-assert (f-same? source (f-join epl-test-source-directory "epl.elc")) nil
             "ERROR: EPL not loaded from byte-compiled source, but from %s! \
Please run make compile" source))

;;; test-helper.el ends here
